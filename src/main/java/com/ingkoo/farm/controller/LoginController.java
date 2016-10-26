package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.MD5;
import com.jfinal.core.Controller;
import com.jfinal.render.JsonRender;

/**
 * 登录
 *
 * @author lichen
 */
public class LoginController extends Controller {

	public void index() {
		render("login.jsp");
	}

	/**
	 * 登录
	 */
	public void doLogin() {
		User loginUser = getModel(User.class, "user");
		User user = User.dao.findById(loginUser.getStr("userId"));
		boolean loginResult;
		if (user != null && user.getStr("loginPwd").equals(MD5.encrypt(loginUser.getStr("loginPwd")))) {
			setSessionAttr("user", user);
			if ("1".equals(getPara("rememberUser"))) {
				setCookie("loginCookie", loginUser.getStr("userId") + ";" + MD5.encrypt(loginUser.getStr("loginPwd")),
						7 * 24 * 60 * 60);
			}
			//记录最后一次登录时间
			user.set("lastLoginTime", System.currentTimeMillis()).update();
			loginResult = true;
		} else {
			loginResult = false;
		}

		render(new JsonRender(loginResult).forIE());
	}

	/**
	 * 登出
	 */
	public void logout() {
		getSession().invalidate();
		redirect("/login");
	}
}
