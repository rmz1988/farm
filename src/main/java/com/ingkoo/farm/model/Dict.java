package com.ingkoo.farm.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 字典
 *
 * @author lichen
 */
public class Dict extends Model<Dict> {

	private static final long serialVersionUID = -8678301702274638226L;

	public static final Dict dao = new Dict();

	public String getDictValue(String dictGroup, String dictName) {
		return dao.findFirst("select * from dict where dictGroup = ? and dictName = ?", dictGroup, dictName)
				.getStr("dictValue");
	}
}
