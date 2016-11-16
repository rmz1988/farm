package com.ingkoo.farm.schedule;

import com.ingkoo.farm.model.LeaderIncome;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.MoneyService;
import com.ingkoo.farm.utils.Money;

import java.util.List;

/**
 * 领导奖结算任务
 *
 * @author lichen
 */
public class LeaderIncomeJob {

	private MoneyService moneyService = new MoneyService();

	public void account() {
		List<LeaderIncome> leaderIncomeList = LeaderIncome.dao.find("select * from leader_income");

		for (LeaderIncome leaderIncome : leaderIncomeList) {

			synchronized (MoneyService.MONEY_LOCK) {
				//修改用户收益
				if (!moneyService.isOverDailyIncome(leaderIncome.getStr("userId"))) {
					String actualIncome =
							moneyService.actualIncome(leaderIncome.getStr("userId"), leaderIncome.getStr("money"));
					User user = User.dao.findById(leaderIncome.getStr("userId"));
					user.set("money", new Money(user.getStr("money")).add(actualIncome).toString())
							.set("todayIncome", new Money(user.getStr("todayIncome")).add(actualIncome).toString())
							.update();

					new TotalIncome().saveLeaderIncome(user, actualIncome);
				}
				leaderIncome.delete();
			}
		}
	}
}
