package com.ingkoo.farm.service;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.PetLifecycle;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.DateUtils;
import com.ingkoo.farm.utils.Money;

import java.util.Date;
import java.util.List;

/**
 * 金币Service
 *
 * @author lichen
 */
public class MoneyService {

	public static final Object MONEY_LOCK = new Object();
	public static final Object LEADER_LOCK = new Object();

	/**
	 * 当前时间段是否可以访问页面
	 * 早6点到晚11点可以访问
	 */
	public boolean canVisit() {
		int currentTime = Integer.parseInt(DateUtils.format(new Date(), "HH"));
		return currentTime >= 7 && currentTime < 24;
	}

	/**
	 * 判断今日收入是否达到上限
	 */
	public boolean isOverDailyIncome(String userId) {
		User user = User.dao.findById(userId);
		return Double.parseDouble(user.getStr("todayIncome")) >=
				Double.parseDouble(OtherRate.dao.findById("daily_input_limit").getStr("rate"));
	}

	public boolean petValid(String userId) {
		return !PetLifecycle.dao.find("select * from pet_lifecycle where status = '1' and userId = ?", userId)
				.isEmpty();
	}

	/**
	 * 获取实际收益
	 *
	 * @param userId       用户Id
	 * @param expectIncome 期望收益
	 */
	public String actualIncome(String userId, String expectIncome) {
		synchronized (MONEY_LOCK) {
			String maxDailyIncome = OtherRate.dao.findById("daily_input_limit").getStr("rate");
			String todayIncome = User.dao.findById(userId).getStr("todayIncome");

			Money leftIncome = new Money(maxDailyIncome).subtract(todayIncome);
			return leftIncome.doubleValue() > Double.parseDouble(expectIncome) ? expectIncome : leftIncome.toString();
		}
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
		synchronized (MONEY_LOCK) {
			List<PetLifecycle> lifecycleList = PetLifecycle.dao
					.find("select * from pet_lifecycle where status = '1' and liveDays > 0 and userId = ?", userId);
			for (PetLifecycle lifecycle : lifecycleList) {
				lifecycle.set("totalOutput",
						new Money(lifecycle.getStr("totalOutput")).add(lifecycle.getStr("dailyOutput")).toString())
						.update();
			}
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
