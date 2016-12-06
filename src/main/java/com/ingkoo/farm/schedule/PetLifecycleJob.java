package com.ingkoo.farm.schedule;

import com.ingkoo.farm.model.Pet;
import com.ingkoo.farm.model.PetLifecycle;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.MoneyService;

import java.util.List;

/**
 * 宠物生命周期
 *
 * @author lichen
 */
public class PetLifecycleJob {

	private MoneyService moneyService = new MoneyService();

	public void growUp() {
		//宠物生命周期+1，如果已经为15，则失效
		List<PetLifecycle> lifecycleList = PetLifecycle.dao.find("select * from pet_lifecycle where status = '1'");
		for (PetLifecycle lifecycle : lifecycleList) {
			Pet pet = Pet.dao.findById(lifecycle.getStr("petNo"));
			if (lifecycle.getInt("liveDays") == pet.getInt("lifecycle")) {
				lifecycle.set("status", "0").set("outTime", System.currentTimeMillis()).update();
			} else {
				lifecycle.set("liveDays", lifecycle.getInt("liveDays") + 1).update();
			}
		}

		List<User> userList = User.dao.find("select * from user");
		for (User user : userList) {
			if (!moneyService.petValid(user.getStr("userId"))) {
				user.set("status", "0").update();
			}
		}
	}
}
