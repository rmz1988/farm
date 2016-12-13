package com.ingkoo.farm.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 玩家
 *
 * @author lichen
 */
public class User extends Model<User> {

	private static final long serialVersionUID = -6231238741246896138L;

	public static final User dao = new User();

	public Pet getUserPet() {
		return Pet.dao.findById(get("petNo"));
	}

	/**
	 * 能否提现
	 */
	public boolean canWithdraw() {
		return getInt("rePurchase") > 0 && getStr("isWithdraw").equals("0") && getInt("recommendCount") > 0 &&
				!PetLifecycle.dao
						.find("select * from pet_lifecycle where userId = ? and petNo = ? and status = '0' and liveDays = 15",
								get("userId"), get("petNo"))
						.isEmpty();
	}

	public boolean canTransfer() {
		return Double.parseDouble(getStr("money")) > 300;
	}

	public boolean canTransferActive() {
		return Double.parseDouble(getStr("money")) > 300;
	}
}
