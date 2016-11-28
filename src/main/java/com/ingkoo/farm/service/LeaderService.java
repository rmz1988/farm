package com.ingkoo.farm.service;

import com.ingkoo.farm.model.LeaderIncome;
import com.ingkoo.farm.model.LeaderRate;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.DateTimeConst;
import com.ingkoo.farm.utils.DateUtils;
import com.ingkoo.farm.utils.Money;
import com.jfinal.plugin.activerecord.Db;
import org.apache.commons.lang3.StringUtils;

import java.util.Date;

/**
 * 领导
 *
 * @author lichen
 */
public class LeaderService {

	private MoneyService moneyService = new MoneyService();

	/**
	 * 计算用户领导奖收益
	 *
	 * @param user        基本用户
	 * @param dailyOutput 每日产币金额
	 */
	public void calcLeaderIncome(User user, String dailyOutput) {
		synchronized (MoneyService.LEADER_LOCK) {
			int generation = 1;
			while (true) {
				//存在上级，则计算领导奖
				if (StringUtils.isNotEmpty(user.getStr("recommendUserId"))) {
					User leaderUser = User.dao.findById(user.getStr("recommendUserId"));
					//if (!moneyService.isOverDailyIncome(leaderUser.getStr("userId"))) {
					//计算当代用户应获得的提成
					LeaderRate leaderRate =
							generation > 7 ? LeaderRate.dao.findById(999) : LeaderRate.dao.findById(generation);
					String actualIncome =
							new Money(dailyOutput).multiply(leaderRate.getInt("rate")).divide(100).toString();

						/*//用户余额和今日收益增加相应提成
						leaderUser.set("money", new Money(leaderUser.getStr("money")).add(actualIncome).toString())
								.set("todayIncome",
										new Money(leaderUser.getStr("todayIncome")).add(actualIncome).toString())
								.update();
						//记录用户领导奖收益记录
						TotalIncome.dao.saveLeaderIncome(leaderUser, actualIncome);*/
					if (!actualIncome.equals("0.00")) {
						//记录领导奖收益
						//						new LeaderIncome().set("userId", leaderUser.getStr("userId"))
						//								.set("money", actualIncome)
						//								.set("createTime", DateUtils.format(new Date(), DateTimeConst.DATE_10)).save();
						Db.update("insert into leader_income values (null,?,?,?)", leaderUser.getStr("userId"),
								actualIncome, DateUtils.format(new Date(), DateTimeConst.DATE_10));

						//获得领导奖的提成需要加到上一级用户
						calcLeaderIncome(leaderUser, actualIncome);
					}
					//}

					generation++;
					user = leaderUser;
				} else {
					break;
				}
			}
		}
	}
}
