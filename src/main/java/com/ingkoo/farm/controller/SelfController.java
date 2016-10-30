package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.MD5;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.render.JsonRender;

import java.sql.SQLException;

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
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("user", user);

		render("base_info.jsp");
	}

	/**
	 * 修改登录密码
	 */
	@ActionKey("/self/pwd/login")
	public void loginPwd() {
		setAttr("current", "person");
		render("login_pwd.jsp");
	}

	public void doLoginPwd() {
		final User user = getSessionAttr("user");
		final String loginPwd = getPara("loginPwd");
		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				return new User().set("userId", user.getStr("userId")).set("loginPwd", MD5.encrypt(loginPwd)).update();
			}
		});

		render(new JsonRender(result).forIE());
	}

	/**
	 * 修改交易密码
	 */
	@ActionKey("/self/pwd/trade")
	public void tradePwd() {
		setAttr("current", "person");
		render("trade_pwd.jsp");
	}

	public void doTradePwd() {
		final User user = getSessionAttr("user");
		final String tradePwd = getPara("tradePwd");
		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				return new User().set("userId", user.getStr("userId")).set("tradePwd", MD5.encrypt(tradePwd)).update();
			}
		});

		render(new JsonRender(result).forIE());
	}
}
