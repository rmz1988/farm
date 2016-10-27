package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.MD5;
import com.jfinal.core.Controller;
import com.jfinal.render.JsonRender;

import javax.servlet.http.Cookie;

/**
 * 登录
 *
 * @author lichen
 */
public class LoginController extends Controller {

	public void index() {
		Cookie cookie = getCookieObject("loginCookie");
		if (cookie != null && cookie.getValue().contains(";")) {
			String userId = cookie.getValue().split(";")[0];
			String loginPwd = cookie.getValue().split(";")[1];
			User user = User.dao.findById(userId);
			if (user != null && user.getStr("loginPwd").equals(loginPwd) && "2".equals(user.getStr("status"))) {
				setSessionAttr("user", user);
				setSessionAttr("imageUrl", OtherRate.dao.findById("img_url").getStr("rate"));
				setSessionAttr("imagePath", OtherRate.dao.findById("img_path").getStr("rate"));
				//记录最后一次登录时间
				user.set("lastLoginTime", System.currentTimeMillis()).update();
				redirect("/");
			}
		}

		render("login.jsp");
	}

	/**
	 * 登录
	 */
	public void doLogin() {
		User loginUser = getModel(User.class, "user");
		User user = User.dao.findById(loginUser.getStr("userId"));
		String loginResult;
		if (user != null && user.getStr("loginPwd").equals(MD5.encrypt(loginUser.getStr("loginPwd")))) {
			if ("2".equals(user.getStr("status"))) {
				setSessionAttr("user", user);
				setSessionAttr("imageUrl", OtherRate.dao.findById("img_url").getStr("rate"));
				setSessionAttr("imagePath", OtherRate.dao.findById("img_path").getStr("rate"));
				if ("1".equals(getPara("rememberUser"))) {
					setCookie("loginCookie",
							loginUser.getStr("userId") + ";" + MD5.encrypt(loginUser.getStr("loginPwd")),
							7 * 24 * 60 * 60);
				}
				//记录最后一次登录时间
				user.set("lastLoginTime", System.currentTimeMillis()).update();
				loginResult = "0";
			} else {
				loginResult = "2";
			}
		} else {
			loginResult = "1";
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
