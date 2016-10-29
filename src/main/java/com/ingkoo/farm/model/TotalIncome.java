package com.ingkoo.farm.model;

import com.ingkoo.farm.utils.DateTimeConst;
import com.ingkoo.farm.utils.DateUtils;
import com.ingkoo.farm.utils.Money;
import com.jfinal.plugin.activerecord.Model;

import java.util.Date;

/**
 * 总收入明细
 *
 * @author lichen
 */
public class TotalIncome extends Model<TotalIncome> {

	private static final long serialVersionUID = -1518367793047681229L;

	public static final TotalIncome dao = new TotalIncome();

	/**
	 * 保存推荐收益
	 *
	 * @param user   用户
	 * @param income 收益
	 */
	public void saveRecommendIncome(User user, String income) {
		String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?",
						user.getStr("userId"), todayDate);
		if (totalIncome != null) {
			totalIncome.set("recommendIncome", new Money(totalIncome.getStr("recommendIncome")).add(income).toString())
					.set("currentTotal", user.getStr("money"))
					.update();
		} else {
			new TotalIncome().set("recommendIncome", income)
					.set("currentTotal", user.getStr("money"))
					.set("userId", user.getStr("userId"))
					.set("createTime", todayDate).save();
		}
	}

	/**
	 * 保存日产币收益
	 *
	 * @param user   用户
	 * @param income 收益
	 */
	public void savePetOutput(User user, String income) {
		String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?",
						user.getStr("userId"), todayDate);
		if (totalIncome != null) {
			totalIncome.set("output", new Money(totalIncome.getStr("output")).add(income).toString())
					.set("currentTotal", user.getStr("money"))
					.update();
		} else {
			new TotalIncome().set("output", income)
					.set("currentTotal", user.getStr("money"))
					.set("userId", user.getStr("userId"))
					.set("createTime", todayDate).save();
		}
	}

	/**
	 * 保存领导奖收益
	 *
	 * @param user   用户
	 * @param income 收益
	 */
	public void saveLeaderIncome(User user, String income) {
		String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?",
						user.getStr("userId"), todayDate);
		if (totalIncome != null) {
			totalIncome.set("leaderIncome", new Money(totalIncome.getStr("leaderIncome")).add(income).toString())
					.set("currentTotal", user.getStr("money"))
					.update();
		} else {
			new TotalIncome().set("leaderIncome", income)
					.set("currentTotal", user.getStr("money"))
					.set("userId", user.getStr("userId"))
					.set("createTime", todayDate).save();
		}
	}

	/**
	 * 记录金币转入
	 *
	 * @param user   用户
	 * @param income 金额
	 */
	public void saveTrasferIn(User user, String income) {
		String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?",
						user.getStr("userId"), todayDate);
		if (totalIncome != null) {
			totalIncome.set("transferIncome", new Money(totalIncome.getStr("transferIncome")).add(income).toString())
					.set("currentTotal", user.getStr("money"))
					.update();
		} else {
			new TotalIncome().set("transferIncome", income)
					.set("currentTotal", user.getStr("money"))
					.set("userId", user.getStr("userId"))
					.set("createTime", todayDate).save();
		}
	}

	/**
	 * 保存激活收益记录
	 * @param user 用户
	 * @param income 收入
	 */
	public void saveActiveIncome(User user, String income) {
		String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?",
						user.getStr("userId"), todayDate);
		if (totalIncome != null) {
			totalIncome.set("activeIncome", new Money(totalIncome.getStr("activeIncome")).add(income).toString())
					.set("currentTotal", user.getStr("money"))
					.update();
		} else {
			new TotalIncome().set("activeIncome", income)
					.set("currentTotal", user.getStr("money"))
					.set("userId", user.getStr("userId"))
					.set("createTime", todayDate).save();
		}
	}

	/**
	 * 记录系统维护费扣除
	 *
	 * @param user   用户
	 * @param output 支出
	 */
	public void saveOperationFee(User user, String output) {
		String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?",
						user.getStr("userId"), todayDate);
		if (totalIncome != null) {
			totalIncome.set("operationFee", new Money(totalIncome.getStr("operationFee")).add(output).toString())
					.set("currentTotal", user.getStr("money"))
					.update();
		} else {
			new TotalIncome().set("operationFee", output)
					.set("currentTotal", user.getStr("money"))
					.set("userId", user.getStr("userId"))
					.set("createTime", todayDate).save();
		}
	}

	/**
	 * 记录提现扣除
	 *
	 * @param user   用户
	 * @param output 提现金额
	 */
	public void saveWithdrawOutput(User user, String output) {
		String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?",
						user.getStr("userId"), todayDate);
		if (totalIncome != null) {
			totalIncome.set("withdrawOutput", new Money(totalIncome.getStr("withdrawOutput")).add(output).toString())
					.set("currentTotal", user.getStr("money"))
					.update();
		} else {
			new TotalIncome().set("withdrawOutput", output)
					.set("currentTotal", user.getStr("money"))
					.set("userId", user.getStr("userId"))
					.set("createTime", todayDate).save();
		}
	}

	/**
	 * 扣除转出金额
	 *
	 * @param user   用户
	 * @param output 转出金额
	 */
	public void saveTransferOutput(User user, String output) {
		String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?",
						user.getStr("userId"), todayDate);
		if (totalIncome != null) {
			totalIncome.set("transferOutput", new Money(totalIncome.getStr("transferOutput")).add(output).toString())
					.set("currentTotal", user.getStr("money"))
					.update();
		} else {
			new TotalIncome().set("transferOutput", output)
					.set("currentTotal", user.getStr("money"))
					.set("userId", user.getStr("userId"))
					.set("createTime", todayDate).save();
		}
	}

	/**
	 * 扣除复购金额
	 *
	 * @param user   用户
	 * @param output 复购金额
	 */
	public void saveRepurchaseOutput(User user, String output) {
		String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?",
						user.getStr("userId"), todayDate);
		if (totalIncome != null) {
			totalIncome.set("repurchase", new Money(totalIncome.getStr("repurchase")).add(output).toString())
					.set("currentTotal", user.getStr("money"))
					.update();
		} else {
			new TotalIncome().set("repurchase", output)
					.set("currentTotal", user.getStr("money"))
					.set("userId", user.getStr("userId"))
					.set("createTime", todayDate).save();
		}
	}
}
