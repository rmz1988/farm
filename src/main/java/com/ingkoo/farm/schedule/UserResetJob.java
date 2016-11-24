package com.ingkoo.farm.schedule;

import com.ingkoo.farm.model.User;

import java.util.List;

/**
 * 用户信息重置
 *
 * @author lichen
 */
public class UserResetJob {

	public void reset() {
		//重置今日提现
		//重置今日喂养
		//重置今日收入
		//重置今日复购
		//重置今日提现与转币限制
		List<User> userList = User.dao.find("select * from user where status = '2'");
		for (User user : userList) {
			user.set("isWithdraw", "0")
					.set("isFeed", "0")
					.set("todayIncome", "0.00")
					.set("todayRepurchase", 0)
					.set("todayLimitMoney", "0.00")
					.update();
		}

	}
}
