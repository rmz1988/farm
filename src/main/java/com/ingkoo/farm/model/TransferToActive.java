package com.ingkoo.farm.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 奖励币转激活币
 *
 * @author lichen
 */
public class TransferToActive extends Model<TransferToActive> {

	private static final long serialVersionUID = 3718901008817858922L;

	public static final TransferToActive dao = new TransferToActive();
}
