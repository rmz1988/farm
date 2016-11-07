package com.ingkoo.farm.model;

import com.ingkoo.farm.service.MoneyService;
import com.ingkoo.farm.utils.DateTimeConst;
import com.ingkoo.farm.utils.DateUtils;
import com.ingkoo.farm.utils.Money;
import com.jfinal.plugin.activerecord.Model;

import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 总收入明细
 *
 * @author lichen
 */
public class TotalIncome extends Model<TotalIncome> {

	private static final long serialVersionUID = -1518367793047681229L;

	public static final TotalIncome dao = new TotalIncome();

	private static ExecutorService es = Executors.newFixedThreadPool(5);

	/**
	 * 保存推荐收益
	 *
	 * @param user   用户
	 * @param income 收益
	 */
	public void saveRecommendIncome(User user, String income) {
		synchronized (MoneyService.MONEY_LOCK) {
			final String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
			String yesterday = DateUtils.getYesterday(DateTimeConst.DATE_10);
			TotalIncome totalIncome = TotalIncome.dao
					.findFirst("select * from total_income where userId = ? and createTime = ?",
							user.getStr("userId"), todayDate);
			if (totalIncome != null) {
				totalIncome
						.set("recommendIncome", new Money(totalIncome.getStr("recommendIncome")).add(income).toString())
						.set("currentTotal", new Money(totalIncome.getStr("currentTotal")).add(income).toString())
						.update();
			} else {
				TotalIncome yesterdayIncome = TotalIncome.dao
						.findFirst("select * from total_income where userId = ? and createTime = ?",
								user.getStr("userId"), yesterday);
				new TotalIncome().set("recommendIncome", income)
						.set("currentTotal",
								new Money(yesterdayIncome != null ? yesterdayIncome.getStr("currentTotal") : "0.00")
										.add(income).toString())
						.set("userId", user.getStr("userId"))
						.set("createTime", todayDate).save();
			}
			/*//计算每日团队收益
			es.submit(new Runnable() {

				@Override
				public void run() {
					List<User> userList = User.dao.find("select * from user");
					for (User user : userList) {
						DailyIncome.dao.addUp(user.getStr("userId"), todayDate);
					}
				}
			});*/
		}
	}

	/**
	 * 保存日产币收益
	 *
	 * @param user   用户
	 * @param income 收益
	 */
	public void savePetOutput(User user, String income) {
		synchronized (MoneyService.MONEY_LOCK) {
			final String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
			String yesterday = DateUtils.getYesterday(DateTimeConst.DATE_10);
			TotalIncome totalIncome = TotalIncome.dao
					.findFirst("select * from total_income where userId = ? and createTime = ?",
							user.getStr("userId"), todayDate);
			if (totalIncome != null) {
				totalIncome.set("output", new Money(totalIncome.getStr("output")).add(income).toString())
						.set("currentTotal", new Money(totalIncome.getStr("currentTotal")).add(income).toString())
						.update();
			} else {
				TotalIncome yesterdayIncome = TotalIncome.dao
						.findFirst("select * from total_income where userId = ? and createTime = ?",
								user.getStr("userId"), yesterday);
				new TotalIncome().set("output", income)
						.set("currentTotal",
								new Money(yesterdayIncome != null ? yesterdayIncome.getStr("currentTotal") : "0.00")
										.add(income).toString())
						.set("userId", user.getStr("userId"))
						.set("createTime", todayDate).save();
			}
			/*//计算每日团队收益
			es.submit(new Runnable() {

				@Override
				public void run() {
					List<User> userList = User.dao.find("select * from user");
					for (User user : userList) {
						DailyIncome.dao.addUp(user.getStr("userId"), todayDate);
					}
				}
			});*/
		}
	}

	/**
	 * 保存领导奖收益
	 *
	 * @param user   用户
	 * @param income 收益
	 */
	public void saveLeaderIncome(User user, String income) {
		synchronized (MoneyService.MONEY_LOCK) {
			final String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
			String yesterday = DateUtils.getYesterday(DateTimeConst.DATE_10);
			TotalIncome totalIncome = TotalIncome.dao
					.findFirst("select * from total_income where userId = ? and createTime = ?",
							user.getStr("userId"), todayDate);
			if (totalIncome != null) {
				totalIncome.set("leaderIncome", new Money(totalIncome.getStr("leaderIncome")).add(income).toString())
						.set("currentTotal", new Money(totalIncome.getStr("currentTotal")).add(income).toString())
						.update();
			} else {
				TotalIncome yesterdayIncome = TotalIncome.dao
						.findFirst("select * from total_income where userId = ? and createTime = ?",
								user.getStr("userId"), yesterday);
				new TotalIncome().set("leaderIncome", income)
						.set("currentTotal",
								new Money(yesterdayIncome != null ? yesterdayIncome.getStr("currentTotal") : "0.00")
										.add(income).toString())
						.set("userId", user.getStr("userId"))
						.set("createTime", todayDate).save();
			}
			/*//计算每日团队收益
			es.submit(new Runnable() {

				@Override
				public void run() {
					List<User> userList = User.dao.find("select * from user");
					for (User user : userList) {
						DailyIncome.dao.addUp(user.getStr("userId"), todayDate);
					}
				}
			});*/
		}
	}

	/**
	 * 记录金币转入
	 *
	 * @param user   用户
	 * @param income 金额
	 */
	public void saveTrasferIn(User user, String income) {
		synchronized (MoneyService.MONEY_LOCK) {
			final String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
			String yesterday = DateUtils.getYesterday(DateTimeConst.DATE_10);
			TotalIncome totalIncome = TotalIncome.dao
					.findFirst("select * from total_income where userId = ? and createTime = ?",
							user.getStr("userId"), todayDate);
			if (totalIncome != null) {
				totalIncome
						.set("transferIncome", new Money(totalIncome.getStr("transferIncome")).add(income).toString())
						.set("currentTotal", new Money(totalIncome.getStr("currentTotal")).add(income).toString())
						.update();
			} else {
				TotalIncome yesterdayIncome = TotalIncome.dao
						.findFirst("select * from total_income where userId = ? and createTime = ?",
								user.getStr("userId"), yesterday);
				new TotalIncome().set("transferIncome", income)
						.set("currentTotal",
								new Money(yesterdayIncome != null ? yesterdayIncome.getStr("currentTotal") : "0.00")
										.add(income).toString())
						.set("userId", user.getStr("userId"))
						.set("createTime", todayDate).save();
			}
			/*//计算每日团队收益
			es.submit(new Runnable() {

				@Override
				public void run() {
					List<User> userList = User.dao.find("select * from user");
					for (User user : userList) {
						DailyIncome.dao.addUp(user.getStr("userId"), todayDate);
					}
				}
			});*/
		}
	}

	/**
	 * 保存激活收益记录
	 *
	 * @param user   用户
	 * @param income 收入
	 */
	public void saveActiveIncome(User user, String income) {
		synchronized (MoneyService.MONEY_LOCK) {
			final String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
			String yesterday = DateUtils.getYesterday(DateTimeConst.DATE_10);
			TotalIncome totalIncome = TotalIncome.dao
					.findFirst("select * from total_income where userId = ? and createTime = ?",
							user.getStr("userId"), todayDate);
			if (totalIncome != null) {
				totalIncome.set("activeIncome", new Money(totalIncome.getStr("activeIncome")).add(income).toString())
						.set("currentTotal", new Money(totalIncome.getStr("currentTotal")).add(income).toString())
						.update();
			} else {
				TotalIncome yesterdayIncome = TotalIncome.dao
						.findFirst("select * from total_income where userId = ? and createTime = ?",
								user.getStr("userId"), yesterday);
				new TotalIncome().set("activeIncome", income)
						.set("currentTotal",
								new Money(yesterdayIncome != null ? yesterdayIncome.getStr("currentTotal") : "0.00")
										.add(income).toString())
						.set("userId", user.getStr("userId"))
						.set("createTime", todayDate).save();
			}
			/*//计算每日团队收益
			es.submit(new Runnable() {

				@Override
				public void run() {
					List<User> userList = User.dao.find("select * from user");
					for (User user : userList) {
						DailyIncome.dao.addUp(user.getStr("userId"), todayDate);
					}
				}
			});*/
		}
	}

	/**
	 * 记录系统维护费扣除
	 *
	 * @param user   用户
	 * @param output 支出
	 */
	public void saveOperationFee(User user, String output) {
		synchronized (MoneyService.MONEY_LOCK) {
			final String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
			String yesterday = DateUtils.getYesterday(DateTimeConst.DATE_10);
			TotalIncome totalIncome = TotalIncome.dao
					.findFirst("select * from total_income where userId = ? and createTime = ?",
							user.getStr("userId"), todayDate);
			if (totalIncome != null) {
				totalIncome.set("operationFee", new Money(totalIncome.getStr("operationFee")).add(output).toString())
						.update();
			} else {
				TotalIncome yesterdayIncome = TotalIncome.dao
						.findFirst("select * from total_income where userId = ? and createTime = ?",
								user.getStr("userId"), yesterday);
				new TotalIncome().set("operationFee", output)
						.set("currentTotal", yesterdayIncome.getStr("currentTotal"))
						.set("userId", user.getStr("userId"))
						.set("createTime", todayDate).save();
			}
			/*//计算每日团队收益
			es.submit(new Runnable() {

				@Override
				public void run() {
					List<User> userList = User.dao.find("select * from user");
					for (User user : userList) {
						DailyIncome.dao.addUp(user.getStr("userId"), todayDate);
					}
				}
			});*/
		}
	}

	/**
	 * 记录提现扣除
	 *
	 * @param user   用户
	 * @param output 提现金额
	 */
	public void saveWithdrawOutput(User user, String output) {
		synchronized (MoneyService.MONEY_LOCK) {
			final String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
			String yesterday = DateUtils.getYesterday(DateTimeConst.DATE_10);
			TotalIncome totalIncome = TotalIncome.dao
					.findFirst("select * from total_income where userId = ? and createTime = ?",
							user.getStr("userId"), todayDate);
			if (totalIncome != null) {
				totalIncome
						.set("withdrawOutput", new Money(totalIncome.getStr("withdrawOutput")).add(output).toString())
						.update();
			} else {
				TotalIncome yesterdayIncome = TotalIncome.dao
						.findFirst("select * from total_income where userId = ? and createTime = ?",
								user.getStr("userId"), yesterday);
				new TotalIncome().set("withdrawOutput", output)
						.set("currentTotal", yesterdayIncome.getStr("currentTotal"))
						.set("userId", user.getStr("userId"))
						.set("createTime", todayDate).save();
			}
			/*//计算每日团队收益
			es.submit(new Runnable() {

				@Override
				public void run() {
					List<User> userList = User.dao.find("select * from user");
					for (User user : userList) {
						DailyIncome.dao.addUp(user.getStr("userId"), todayDate);
					}
				}
			});*/
		}
	}

	/**
	 * 扣除转出金额
	 *
	 * @param user   用户
	 * @param output 转出金额
	 */
	public void saveTransferOutput(User user, String output) {
		synchronized (MoneyService.MONEY_LOCK) {
			final String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
			String yesterday = DateUtils.getYesterday(DateTimeConst.DATE_10);
			TotalIncome totalIncome = TotalIncome.dao
					.findFirst("select * from total_income where userId = ? and createTime = ?",
							user.getStr("userId"), todayDate);
			if (totalIncome != null) {
				totalIncome
						.set("transferOutput", new Money(totalIncome.getStr("transferOutput")).add(output).toString())
						.update();
			} else {
				TotalIncome yesterdayIncome = TotalIncome.dao
						.findFirst("select * from total_income where userId = ? and createTime = ?",
								user.getStr("userId"), yesterday);
				new TotalIncome().set("transferOutput", output)
						.set("currentTotal", yesterdayIncome.getStr("currentTotal"))
						.set("userId", user.getStr("userId"))
						.set("createTime", todayDate).save();
			}
			/*//计算每日团队收益
			es.submit(new Runnable() {

				@Override
				public void run() {
					List<User> userList = User.dao.find("select * from user");
					for (User user : userList) {
						DailyIncome.dao.addUp(user.getStr("userId"), todayDate);
					}
				}
			});*/
		}
	}

	/**
	 * 扣除奖励币转激活币
	 *
	 * @param user   用户
	 * @param output 转出金额
	 */
	public void saveTransferToActiveOutput(User user, String output) {
		synchronized (MoneyService.MONEY_LOCK) {
			final String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
			String yesterday = DateUtils.getYesterday(DateTimeConst.DATE_10);
			TotalIncome totalIncome = TotalIncome.dao
					.findFirst("select * from total_income where userId = ? and createTime = ?",
							user.getStr("userId"), todayDate);
			if (totalIncome != null) {
				totalIncome
						.set("transferToActive",
								new Money(totalIncome.getStr("transferToActive")).add(output).toString())
						.update();
			} else {
				TotalIncome yesterdayIncome = TotalIncome.dao
						.findFirst("select * from total_income where userId = ? and createTime = ?",
								user.getStr("userId"), yesterday);
				new TotalIncome().set("transferToActive", output)
						.set("currentTotal", yesterdayIncome.getStr("currentTotal"))
						.set("userId", user.getStr("userId"))
						.set("createTime", todayDate).save();
			}
			/*//计算每日团队收益
			es.submit(new Runnable() {

				@Override
				public void run() {
					List<User> userList = User.dao.find("select * from user");
					for (User user : userList) {
						DailyIncome.dao.addUp(user.getStr("userId"), todayDate);
					}
				}
			});*/
		}
	}

	/**
	 * 扣除复购金额
	 *
	 * @param user   用户
	 * @param output 复购金额
	 */
	public void saveRepurchaseOutput(User user, String output) {
		synchronized (MoneyService.MONEY_LOCK) {
			final String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
			String yesterday = DateUtils.getYesterday(DateTimeConst.DATE_10);
			TotalIncome totalIncome = TotalIncome.dao
					.findFirst("select * from total_income where userId = ? and createTime = ?",
							user.getStr("userId"), todayDate);
			if (totalIncome != null) {
				totalIncome.set("repurchase", new Money(totalIncome.getStr("repurchase")).add(output).toString())
						.update();
			} else {
				TotalIncome yesterdayIncome = TotalIncome.dao
						.findFirst("select * from total_income where userId = ? and createTime = ?",
								user.getStr("userId"), yesterday);
				new TotalIncome().set("repurchase", output)
						.set("currentTotal", yesterdayIncome.getStr("currentTotal"))
						.set("userId", user.getStr("userId"))
						.set("createTime", todayDate).save();
			}
			/*//计算每日团队收益
			es.submit(new Runnable() {

				@Override
				public void run() {
					List<User> userList = User.dao.find("select * from user");
					for (User user : userList) {
						DailyIncome.dao.addUp(user.getStr("userId"), todayDate);
					}
				}
			});*/
		}
	}
}
