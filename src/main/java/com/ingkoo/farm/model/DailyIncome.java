package com.ingkoo.farm.model;

import com.ingkoo.farm.service.RecommendService;
import com.jfinal.plugin.activerecord.Model;

/**
 * 每日收入
 *
 * @author lichen
 */
public class DailyIncome extends Model<DailyIncome> {

	private static final long serialVersionUID = 6775049660558450395L;

	public static final DailyIncome dao = new DailyIncome();
	private RecommendService recommendService = new RecommendService();

	public void addUp(String userId, String date) {
		DailyIncome dailyIncome = DailyIncome.dao
				.findFirst("select * from daily_income where userId = ? and createTime = ?", userId,
						date);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?", userId, date);
		if (dailyIncome != null) {
			dailyIncome.set("dailyOutput", totalIncome != null ? totalIncome.getStr("output") : "0.00")
					.set("teamIncome", recommendService.addUpTeamIncome(User.dao.findById(userId), date))
					.update();
		} else {
			new DailyIncome().set("dailyOutput", totalIncome != null ? totalIncome.getStr("output") : "0.00")
					.set("teamIncome", recommendService.addUpTeamIncome(User.dao.findById(userId), date))
					.set("createTime", date)
					.set("userId", userId)
					.save();
		}

	}
}
