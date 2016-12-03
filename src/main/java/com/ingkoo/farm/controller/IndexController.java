package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.MoneyService;
import com.ingkoo.farm.utils.MD5;
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
		setAttr("totalMoney", user.getStr("money"));
		setAttr("activeMoney", user.getStr("activeMoney"));
		setAttr("isFeed", user.getStr("isFeed"));
		setAttr("repurchase", user.getInt("rePurchase"));
		setAttr("pet", user.getUserPet());
		setAttr("user", user);
		Object pwdFlag = getSession().getAttribute("pwdFlag");
		if (pwdFlag == null || !(boolean) pwdFlag) {
			setAttr("needChangePwd", MD5.encrypt("111111").equals(user.getStr("loginPwd")));
			setSessionAttr("pwdFlag", true);
		} else {
			setAttr("needChangePwd", false);
		}
		render("index.jsp");
	}

}
