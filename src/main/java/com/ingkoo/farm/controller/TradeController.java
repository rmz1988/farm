package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.Dict;
import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.Transfer;
import com.ingkoo.farm.model.TransferToActive;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.model.Withdraw;
import com.ingkoo.farm.utils.AES;
import com.ingkoo.farm.utils.Money;
import com.ingkoo.farm.utils.RandomCode;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.render.JsonRender;

import java.sql.SQLException;

/**
 * 交易管理
 *
 * @author lichen
 */
public class TradeController extends Controller {

	/**
	 * 提现
	 */
	public void withdraw() {
		setAttr("current", "trade");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		String minWithdraw = OtherRate.dao.findById("min_withdraw").getStr("rate");
		setAttr("minWithdraw", minWithdraw);
		setAttr("user", user);
		setAttr("canWithdraw", user.canWithdraw());
		setAttr("allowMoney", Money.maxOfTimes(user.getStr("money"), minWithdraw));
		setAttr("fee", OtherRate.dao.findById("withdraw_rate").getStr("rate"));

		render("withdraw.jsp");
	}

	/**
	 * 查询提现记录
	 */
	public void queryWithdrawList() {
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("page", Withdraw.dao.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
				"from withdraw where userId = ? order by createTime desc", user.getStr("userId")));

		render("withdraw_list.jsp");
	}

	/**
	 * 提现
	 */
	public void doWithdraw() {
		final User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		final String money = getPara("money");
		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				//保存提现记录
				String feeRate = OtherRate.dao.findById("withdraw_rate").getStr("rate");
				String fee = new Money(money).multiply(feeRate).divide("100").toString();
				String realMoney = new Money(money).subtract(fee).toString();
				new Withdraw().set("withdrawId", RandomCode.uuid())
						.set("userId", user.getStr("userId"))
						.set("money", Money.format(Double.parseDouble(money)))
						.set("bankName", Dict.dao.getDictValue("bank", user.getStr("bank")))
						.set("cardNo", AES.decrypt(user.getStr("bankCard")))
						.set("bankAccountName", user.getStr("bankAccountName"))
						.set("status", "0")
						.set("createTime", System.currentTimeMillis())
						.set("realMoney", realMoney)
						.set("fee", fee)
						.save();
				//修改用户余额及提现状态
				user.set("money", new Money(user.getStr("money")).subtract(money).toString())
						.set("isWithdraw", "1")
						.update();
				//记录用户收入总明细
				TotalIncome.dao.saveWithdrawOutput(User.dao.findById(user.getStr("userId")), money);

				return true;
			}
		});

		render(new JsonRender(result).forIE());
	}

	/**
	 * 互转
	 */
	public void transfer() {
		setAttr("current", "trade");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		String minTransfer = OtherRate.dao.findById("min_withdraw").getStr("rate");
		setAttr("minTransfer", minTransfer);
		setAttr("user", user);
		setAttr("allowMoney", Money.maxOfTimes(user.getStr("money"), minTransfer));

		render("transfer.jsp");
	}

	/**
	 * 查询转账记录
	 */
	public void queryTransferList() {
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("page", Transfer.dao.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
				"from transfer where userId = ? order by createTime desc", user.getStr("userId")));

		render("transfer_list.jsp");
	}

	/**
	 * 转出
	 */
	public void doTransfer() {
		final User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		final Transfer transferOut = getModel(Transfer.class, "transfer");

		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				//保存转出记录
				transferOut.set("transferId", RandomCode.uuid())
						.set("type", "0")
						.set("status", "1")
						.set("money", Money.format(Double.parseDouble(transferOut.getStr("money"))))
						.set("createTime", System.currentTimeMillis())
						.set("userId", user.getStr("userId"))
						.save();
				//保存对应玩家的转入记录
				new Transfer().set("transferId", RandomCode.uuid())
						.set("inUserId", user.getStr("userId"))
						.set("type", "1")
						.set("money", transferOut.getStr("money"))
						.set("status", "1")
						.set("createTime", System.currentTimeMillis())
						.set("userId", transferOut.getStr("outUserId"))
						.save();
				//修改双方玩家余额
				user.set("money", new Money(user.getStr("money")).subtract(transferOut.getStr("money")).toString())
						.update();
				User inUser = User.dao.findById(transferOut.getStr("outUserId"));
				inUser.set("money", new Money(inUser.getStr("money")).add(transferOut.getStr("money")).toString())
						.update();

				//记录双方玩家收入总明细
				TotalIncome.dao
						.saveTransferOutput(User.dao.findById(user.getStr("userId")), transferOut.getStr("money"));
				TotalIncome.dao.saveTrasferIn(User.dao.findById(inUser.getStr("userId")), transferOut.getStr("money"));

				return true;
			}
		});

		render(new JsonRender(result).forIE());
	}

	/**
	 * 奖励币转激活币
	 */
	@ActionKey("/trade/activate/transfer")
	public void transferMoney2ActiveMoney() {
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		String minTransfer = OtherRate.dao.findById("min_withdraw").getStr("rate");
		setAttr("minTransfer", minTransfer);
		setAttr("allowMoney", Money.maxOfTimes(user.getStr("money"), minTransfer));
		setAttr("user", user);

		render("activate_transfer.jsp");
	}

	/**
	 * 奖励币转激活币
	 */
	public void doTransferToActiveMoney() {
		final User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		final String activeMoney = Money.format(Double.parseDouble(getPara("money")));
		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				String currentActiveMoney = user.getStr("activeMoney");
				return user.set("money", new Money(user.getStr("money")).subtract(activeMoney).toString())
						.set("activeMoney", new Money(user.getStr("activeMoney")).add(activeMoney).toString())
						.update() && new TransferToActive().set("transferId", RandomCode.uuid())
						.set("userId", user.getStr("userId"))
						.set("transferMoney", activeMoney)
						.set("activeMoney", new Money(currentActiveMoney).add(activeMoney).toString())
						.set("createTime", System.currentTimeMillis()).save();
			}
		});

		render(new JsonRender(result).forIE());
	}

	public void queryTransferToActiveList() {
		User user = getSessionAttr("user");
		setAttr("page", TransferToActive.dao
				.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
						"from transfer_to_active where userId = ? order by createTime desc", user.getStr("userId")));

		render("activate_transfer_list.jsp");
	}
}
