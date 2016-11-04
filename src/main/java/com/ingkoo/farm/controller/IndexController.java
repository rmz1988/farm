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
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("petDailyOutput", moneyService.getPetDailyOutput(user.getStr("userId")));
		setAttr("totalMoney",user.getStr("money"));
		setAttr("activeMoney",user.getStr("activeMoney"));
		setAttr("isFeed",user.getStr("isFeed"));
		setAttr("repurchase",user.getInt("rePurchase"));
		setAttr("pet",user.getUserPet());
		render("index.jsp");
	}

}
