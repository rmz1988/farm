package com.ingkoo.farm.service;

import com.ingkoo.farm.model.OtherRate;
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
	 * 获取实际收益
	 *
	 * @param userId       用户Id
	 * @param expectIncome 期望收益
	 */
	public String actualIncome(String userId, String expectIncome) {
		String maxDailyIncome = OtherRate.dao.findById("daily_input_limit").getStr("rate");
		String todayIncome = User.dao.findById(userId).getStr("todayIncome");

		Money leftIncome = new Money(maxDailyIncome).subtract(todayIncome);
		return leftIncome.doubleValue() > Double.parseDouble(expectIncome) ? expectIncome : leftIncome.toString();
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

	/**
	 * 修改宠物生命周期金币产量
	 *
	 * @param userId 用户Id
	 */
	public void saveDailyOutput(String userId, String dailyOutput) {
		List<PetLifecycle> lifecycleList = PetLifecycle.dao
				.find("select * from pet_lifecycle where status = '1' and liveDays > 0 and userId = ?", userId);
		for (PetLifecycle lifecycle : lifecycleList) {
			lifecycle.set("totalOutput",
					new Money(lifecycle.getStr("totalOutput")).add(dailyOutput).toString())
					.update();
		}
	}

	/**
	 * 查询产币总量
	 *
	 * @param userId 用户id
	 */
	public String getTotalOutput(String userId) {
		List<PetLifecycle> petLifecycleList = PetLifecycle.dao
				.find("select * from pet_lifecycle where userId = ? and liveDays > 0", userId);

		Money output = new Money("0.00");
		for (PetLifecycle lifecycle : petLifecycleList) {
			output = output.add(lifecycle.getStr("totalOutput"));
		}

		return output.toString();
	}
}
