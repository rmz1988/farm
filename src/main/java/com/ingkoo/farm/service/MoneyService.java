package com.ingkoo.farm.service;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.Pet;
import com.ingkoo.farm.model.PetLifecycle;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.Money;

import java.util.List;

/**
 * 金币Service
 *
 * @author lichen
 */
public class MoneyService {

	/**
	 * 判断今日收入是否达到上限
	 */
	public boolean isOverDailyIncome(String userId) {
		User user = User.dao.findById(userId);
		return Double.parseDouble(user.getStr("todayIncome")) >=
				Double.parseDouble(OtherRate.dao.findById("daily_input_limit").getStr("rate"));
	}

	/**
	 * 获取每日宠物产币量
	 *
	 * @param userId 用户id
	 */
	public String getPetDailyOutput(String userId) {
		List<PetLifecycle> petLifecycleList = PetLifecycle.dao
				.find("select * from pet_lifecycle where userId = ? and status = '1' and liveDays > 0", userId);

		Money output = new Money("0.00");
		for (PetLifecycle lifecycle : petLifecycleList) {
			output = output.add(lifecycle.getStr("dailyOutput"));
		}

		return output.toString();
	}
}
