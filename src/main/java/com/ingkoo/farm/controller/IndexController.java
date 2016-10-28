package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.MoneyService;
import com.jfinal.core.Controller;

/**
 * 首页
 *
 * @author lichen
 */
public class IndexController extends Controller {

	private MoneyService moneyService = new MoneyService();

	public void index() {
		setAttr("current", "index");
		User user = getSessionAttr("user");
		setAttr("petDailyOutput", moneyService.getPetDailyOutput(user.getStr("userId")));
		render("index.jsp");
	}

}
