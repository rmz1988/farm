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
}
