package com.ingkoo.farm.schedule;

import com.ingkoo.farm.model.LeaderIncome;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.MoneyService;
import com.ingkoo.farm.utils.Money;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Page;

import java.sql.SQLException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 领导奖结算任务
 *
 * @author lichen
 */
public class LeaderIncomeJob {

	private MoneyService moneyService = new MoneyService();

	public void account() {
		System.out.println("=================Begin to account leader income ===================");
		long totalCount = Db.queryLong("select count(*) from leader_income");
		int pageSize = 1000;
		int totalPages = ((int) totalCount - 1) / pageSize + 1;
		final Map<String, Money> moneyMap = new ConcurrentHashMap<>();
		for (int pageNo = 1; pageNo <= totalPages; pageNo++) {
			Page<LeaderIncome> page = LeaderIncome.dao.paginate(pageNo, pageSize, "select *", "from leader_income");
			for (LeaderIncome leaderIncome : page.getList()) {
				String userId = leaderIncome.getStr("userId");
				if (moneyMap.containsKey(leaderIncome.getStr("userId"))) {
					Money money = moneyMap.get(userId);
					moneyMap.put(userId, money.add(leaderIncome.getStr("money")));
				} else {
					moneyMap.put(userId, new Money(leaderIncome.getStr("money")));
				}
			}
		}

		Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				//更新用户收益，添加收益记录
				synchronized (MoneyService.MONEY_LOCK) {
					for (Map.Entry<String, Money> entry : moneyMap.entrySet()) {
						String userId = entry.getKey();
						Money leaderIncome = entry.getValue();
						if (!moneyService.isOverDailyIncome(entry.getKey())) {
							String actualIncome =
									moneyService.actualIncome(userId, leaderIncome.toString());
							User user = User.dao.findById(userId);
							user.set("money", new Money(user.getStr("money")).add(actualIncome).toString())
									.set("todayIncome",
											new Money(user.getStr("todayIncome")).add(actualIncome).toString())
									.update();

							new TotalIncome().saveLeaderIncome(user, actualIncome);
						}
					}

					//清空leader_income
					Db.update("truncate table leader_income");

					return true;
				}

			}
		});

		System.out.println("============================End to account leader income==========================");

	}
}
