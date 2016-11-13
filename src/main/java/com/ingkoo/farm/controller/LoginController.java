package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.MoneyService;
import com.ingkoo.farm.utils.MD5;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.jfinal.render.JsonRender;

import javax.servlet.http.Cookie;

/**
 * 登录
 *
 * @author lichen
 */
public class LoginController extends Controller {

	private MoneyService moneyService = new MoneyService();

	public void index() {
		setAttr("qq", OtherRate.dao.findById("qq").getStr("rate"));
		render("login.jsp");
	}

	/**
	 * 登录
	 */
	public void doLogin() {
		User loginUser = getModel(User.class, "user");
		User user = User.dao.findById(loginUser.getStr("userId"));
		String loginResult;
		if (!moneyService.canVisit()) {
			loginResult = "4";
		} else if (user != null && user.getStr("loginPwd").equals(MD5.encrypt(loginUser.getStr("loginPwd")))) {
			if ("2".equals(user.getStr("status"))) {
				user.put("pet", user.getUserPet());
				setSessionAttr("user", user);
				setSessionAttr("imageUrl", OtherRate.dao.findById("img_url").getStr("rate"));
				setSessionAttr("imagePath", OtherRate.dao.findById("img_path").getStr("rate"));
				setSessionAttr("qq", OtherRate.dao.findById("qq").getStr("rate"));
				if ("1".equals(getPara("rememberUser"))) {
					setCookie("loginUserId",
							loginUser.getStr("userId"),
							7 * 24 * 60 * 60, JFinal.me().getContextPath());
					setCookie("loginPwd",
							MD5.encrypt(loginUser.getStr("loginPwd")), 7 * 24 * 60 * 60, JFinal.me().getContextPath());
				} else {
					removeCookie("loginUserId");
					removeCookie("loginPwd");
				}
				//记录最后一次登录时间
				user.set("lastLoginTime", System.currentTimeMillis()).update();
				loginResult = "0";
			} else if ("1".equals(user.getStr("status"))) {//尚未激活
				loginResult = "2";
			} else {//已停用
				loginResult = "3";
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
