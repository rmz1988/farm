package com.ingkoo.farm.controller;

import com.jfinal.core.Controller;

/**
 * 牧场（宠物管理）
 *
 * @author lichen
 */
public class PetController extends Controller {

	public void index() {
		setAttr("current", "pet");
		render("pet.jsp");
	}
}
