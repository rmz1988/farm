package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.*;
import com.ingkoo.farm.service.ActiveService;
import com.ingkoo.farm.service.MoneyService;
import com.ingkoo.farm.service.RecommendService;
import com.ingkoo.farm.utils.AES;
import com.ingkoo.farm.utils.Money;
import com.ingkoo.farm.utils.RandomCode;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.render.JsonRender;
import org.apache.commons.lang3.StringUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 账号管理
 *
 * @author lichen
 */
public class AccountController extends Controller {

	private RecommendService recommendService = new RecommendService();
	private ActiveService activeService = new ActiveService();
	private MoneyService moneyService = new MoneyService();

	/**
	 * 推荐列表
	 */
	public void recommend() {
		setAttr("current", "account");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("recommendResult", recommendService.queryRecommendList(user));
		render("recommend_list.jsp");
	}

	/**
	 * 申请激活中心权限
	 */
	public void apply() {
		setAttr("current", "account");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("user", user);
		setAttr("recommendCount", user.getInt("recommendCount"));
		setAttr("teamCount", recommendService.getTeamCount(user));
		setAttr("activeNo", user.getStr("activeNo"));
		setAttr("activeAuthApply", ActiveAuthApply.dao
				.findFirst("select * from active_auth_apply where userId = ?", user.getStr("userId")));
		render("activate_apply.jsp");
	}

	/**
	 * 提交申请
	 */
	public void doApply() {
		final String userId = getPara("userId");
		final String activeNo = getPara("activeNo");
		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				User user = User.dao.findById(userId);
				return new ActiveAuthApply().set("applyId", RandomCode.uuid())
						.set("userId", user.getStr("userId"))
						.set("name", user.getStr("name"))
						.set("recommendCount", user.getInt("recommendCount"))
						.set("activeNo", activeNo)
						.set("applyTime", System.currentTimeMillis())
						.save();
			}
		});

		render(new JsonRender(result).forIE());
	}

	@ActionKey("/account/apply/edit")
	public void applyEdit() {
		setAttr("current", "account");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("user", user);
		setAttr("activeAuthApply", ActiveAuthApply.dao.findById(getPara("applyId")));

		render("activate_apply_edit.jsp");
	}

	/**
	 * 提交编辑
	 */
	public void doApplyEdit() {
		final String applyId = getPara("applyId");
		final String userId = getPara("userId");
		final String activeNo = getPara("activeNo");
		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				User user = User.dao.findById(userId);
				return new ActiveAuthApply().set("applyId", applyId)
						.set("recommendCount", user.getInt("recommendCount"))
						.set("activeNo", activeNo)
						.set("applyTime", System.currentTimeMillis())
						.set("status", "0")
						.update();
			}
		});

		render(new JsonRender(result).forIE());
	}

	/**
	 * 激活中心管理
	 */
	public void activate() {
		setAttr("current", "account");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("user", user);
		setAttr("canVisit", moneyService.canVisit());
		render("activate_manage.jsp");
	}

	/**
	 * 查询待激活用户列表
	 */
	public void queryActivateApplyList() {
		String userId = getPara("userId");
		String status = getPara("status");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("userId", userId);
		setAttr("status", status);
		setAttr("page", activeService
				.queryActivatedApplyList(userId, status, user.getStr("userId"), getParaToInt("pageNumber", 1),
						getParaToInt("pageSize", 20)));

		render("activate_manage_list.jsp");
	}

	/**
	 * 激活
	 */
	public void doActive() {
		final String applyId = getPara("applyId");
		final User sessionUser = getSessionAttr("user");
		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				//修改用户激活状态
				final ActiveApply activeApply = ActiveApply.dao.findById(applyId);
				if ("0".equals(activeApply.getStr("status"))) {
					User outActivatedUser = User.dao.findById(activeApply.getStr("userId"));
					Pet pet = outActivatedUser.getUserPet();

					final String activeDecrease = OtherRate.dao.findById("active_decrease_money").getStr("rate");


					User outUser = User.dao.findById(sessionUser.getStr("userId"));
					if (Double.parseDouble(activeDecrease) > Double.parseDouble(outUser.getStr("activeMoney"))) {
						return false;
					} else {
						activeApply.set("status", "1")
								.set("statusTime", System.currentTimeMillis())
								.update();
						outActivatedUser.set("status", "2").set("activateTime", System.currentTimeMillis()).update();
						//为用户生成宠物生命周期，生存1天
						new PetLifecycle().set("userId", outActivatedUser.getStr("userId"))
								.set("petNo", outActivatedUser.getStr("petNo"))
								.set("liveDays", 1)
								.set("overtimeDays", Integer.parseInt(
										OtherRate.dao.findById("pet_initial_lifecycle").getStr("rate")))
								.set("price", Money.format(Double.parseDouble(pet.getStr("price"))))
								.set("dailyOutput", Money.format(Double.parseDouble(
										OtherRate.dao.findById("pet_initial_output").getStr("rate"))))
								.set("totalOutput", "0.00")
								.set("createTime", System.currentTimeMillis())
								.set("status", "1")
								.save();
						synchronized (MoneyService.MONEY_LOCK) {
							User activatedUser = User.dao.findById(activeApply.getStr("userId"));
							User user = User.dao.findById(sessionUser.getStr("userId"));
							//扣除操作员相应（300）激活币，如果激活币不足300，则激活失败
							user.set("activeMoney",
									new Money(user.getStr("activeMoney")).subtract(activeDecrease).toString())
									.update();

							//计算推荐奖
							recommendService.saveRecommendIncome(activatedUser);
						}

						return true;
					}
				}


				return true;
			}
		});

		render(new JsonRender(result).forIE());
	}

}
