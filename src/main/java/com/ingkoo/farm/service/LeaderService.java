package com.ingkoo.farm.service;

import com.ingkoo.farm.model.LeaderRate;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.Money;
import org.apache.commons.lang3.StringUtils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

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
		int generation = 1;
		while (true) {
			//存在上级，则计算领导奖
			if (StringUtils.isNotEmpty(user.getStr("recommendUserId"))) {
				User leaderUser = User.dao.findById(user.getStr("recommendUserId"));
				if (moneyService.isOverDailyIncome(leaderUser.getStr("userId"))) {
					//如果超过每日收益，则该用户不计算，计算其上一代用户
					generation++;
					user = leaderUser;
				} else {
					//计算当代用户应获得的提成
					LeaderRate leaderRate =
							generation > 7 ? LeaderRate.dao.findById(999) : LeaderRate.dao.findById(generation);
					String income = new Money(dailyOutput).multiply(leaderRate.getStr("rate")).divide(100).toString();
					//用户余额和今日收益增加相应提成
					leaderUser.set("money", new Money(leaderUser.getStr("money")).add(income))
							.set("todayIncome", new Money(leaderUser.getStr("todayIncome")).add(income))
							.update();
					//记录用户领导奖收益记录
					TotalIncome.dao.saveLeaderIncome(leaderUser, income);
				}
			} else {
				break;
			}
		}
	}
}
