package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.Pet;
import com.jfinal.core.Controller;

/**
 * 注册
 *
 * @author lichen
 */
public class RegisterController extends Controller {

	public void index() {
		setAttr("imgUrl", OtherRate.dao.findById("img_url").getStr("rate"));
		setAttr("petList", Pet.dao.find("select * from pet"));
		render("register.jsp");
	}
}
