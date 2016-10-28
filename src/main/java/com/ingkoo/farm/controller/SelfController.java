package com.ingkoo.farm.controller;

import com.jfinal.core.Controller;

/**
 * 个人信息
 *
 * @author lichen
 */
public class SelfController extends Controller {

	/**
	 * 个人信息
	 */
	public void index() {
		setAttr("current", "person");
		render("base_info.jsp");
	}

}
