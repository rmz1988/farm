package com.ingkoo.farm.service;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.Pet;
import com.ingkoo.farm.model.RecommendIncome;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.DateTimeConst;
import com.ingkoo.farm.utils.DateUtils;
import com.ingkoo.farm.utils.Money;
import org.springframework.format.datetime.standard.DateTimeContext;

import java.util.Date;

/**
 * 推荐
 *
 * @author lichen
 */
public class RecommendService {

	/**
	 * 保存推荐奖励
	 *
	 * @param user 玩家信息
	 */
	public void saveRecommendIncome(User user) {
		Pet pet = Pet.dao.findById(user.getStr("petNo"));
		//直推提成比例
		String recommendRate = OtherRate.dao.findById("redirect_recommend_rate").getStr("rate");
		//直推收益
		String recommendIncome =
				new Money(pet.getStr("price")).multiply(new Money(recommendRate)).divide(100).toString();

		User recommendUser = User.dao.findById(user.getStr("recommendUserId"));
		//修改推荐人金币余额和当天已获得收益
		recommendUser.set("money", new Money(recommendUser.getStr("money")).add(recommendIncome))
				.set("todayIncome", new Money(recommendUser.getStr("todayIncome")).add(recommendIncome)).update();
		//记录推荐奖励日志
		new RecommendIncome().set("recommendUserId", user.getStr("userId"))
				.set("name", user.getStr("name"))
				.set("income", recommendIncome)
				.set("createTime", System.currentTimeMillis())
				.set("userId", recommendUser.getStr("userId"));
		//记录总收益明细
		String todayDate = DateUtils.format(new Date(), DateTimeConst.DATE_10);
		TotalIncome totalIncome = TotalIncome.dao
				.findFirst("select * from total_income where userId = ? and createTime = ?",
						recommendUser.getStr("userId"), todayDate);
		if (totalIncome != null) {
			totalIncome.set("recommendIncome", recommendIncome)
					.set("currentTotal", new Money(recommendUser.getStr("money")).add(recommendIncome).toString())
					.update();
		} else {
			new TotalIncome().set("recommendIncome", recommendIncome)
					.set("currentTotal", new Money(recommendUser.getStr("money")).add(recommendIncome).toString())
					.set("userId", recommendUser.getStr("userId"))
					.set("createTime", todayDate).save();
		}
	}
}
