package com.ingkoo.farm.schedule;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.MoneyService;
import com.ingkoo.farm.utils.Money;

import java.util.List;

/**
 * @author lichen
 */
public class OperationFeeJob {

	public void decreaseFee() {
		String operationFee = OtherRate.dao.findById("operation_fee").getStr("rate");

		synchronized (MoneyService.MONEY_LOCK) {
			List<User> userList = User.dao.find(
					"select * from user where status = '2' and recommendCount > 0");
			for (User user : userList) {
				//减少用户金额，记录用户总收入明细
				if (Double.parseDouble(user.getStr("total")) >= 300d) {
					user.set("money", new Money(user.getStr("money")).subtract(operationFee).toString()).update();
					new TotalIncome().saveOperationFee(User.dao.findById(user.getStr("userId")), operationFee);
				}
			}
		}
	}
}
