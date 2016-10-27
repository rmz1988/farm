package com.ingkoo.farm.service;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.User;

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
}
