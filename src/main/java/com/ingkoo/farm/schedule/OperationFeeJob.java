package com.ingkoo.farm.schedule;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.Money;

import java.util.List;

/**
 * @author lichen
 */
public class OperationFeeJob {

	public void decreaseFee() {
		String operationFee = OtherRate.dao.findById("operation_fee").getStr("rate");

		List<User> userList = User.dao.find("select * from user where cast(money as decimal(10,2)) >= ?",
				Double.parseDouble(operationFee));
		for (User user : userList) {
			//减少用户金额，记录用户总收入明细
			user.set("money", new Money(user.getStr("money")).subtract(operationFee).toString()).update();
			TotalIncome.dao.saveOperationFee(User.dao.findById(user.getStr("userId")), operationFee);
		}
	}
}
