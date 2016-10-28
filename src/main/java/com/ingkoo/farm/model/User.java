package com.ingkoo.farm.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 玩家
 *
 * @author lichen
 */
public class User extends Model<User> {

	private static final long serialVersionUID = -6231238741246896138L;

	private Pet pet;

	public static final User dao = new User();

	public Pet getUserPet() {
		return Pet.dao.findById(get("petNo"));
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}
}
