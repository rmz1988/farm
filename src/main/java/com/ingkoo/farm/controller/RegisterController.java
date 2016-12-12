package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.ActiveApply;
import com.ingkoo.farm.model.Dict;
import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.Pet;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.MoneyService;
import com.ingkoo.farm.service.RecommendService;
import com.ingkoo.farm.utils.AES;
import com.ingkoo.farm.utils.MD5;
import com.ingkoo.farm.utils.RandomCode;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.render.JsonRender;

import java.sql.SQLException;
import java.util.Random;

/**
 * 注册
 *
 * @author lichen
 */
public class RegisterController extends Controller {

	public void index() {
		setAttr("imgUrl", OtherRate.dao.findById("img_url").getStr("rate"));
		setAttr("petList", Pet.dao.find("select * from pet"));
		//setAttr("bankList", Dict.dao.find("select * from dict where dictGroup = 'bank'"));
		setSessionAttr("qq", OtherRate.dao.findById("qq").getStr("rate"));
		render("register.jsp");
	}

	/**
	 * 获取用户姓名
	 */
	public void getNameByUserId() {
		String userId = getPara("userId");
		User user = User.dao.findById(userId);

		render(new JsonRender(user == null ? "" : user.getStr("name")).forIE());
	}

	public void getNameByActiveNo() {
		String activeNo = getPara("activeNo");
		User user = User.dao.findFirst("select * from user where activeNo = ?", activeNo);

		render(new JsonRender(user == null ? "" : user.getStr("name")).forIE());
	}

	/**
	 * 注册
	 */
	public void doRegister() {
		final User user = getModel(User.class, "user");
		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				try {
					//保存用户信息
					user.set("idCard", AES.encrypt(user.getStr("idCard")))
							.set("loginPwd", MD5.encrypt("111111"))
							.set("tradePwd", MD5.encrypt("222222"))
							.set("registerTime", System.currentTimeMillis())
							.save();

					//记录玩家激活申请
					new ActiveApply().set("applyId", RandomCode.uuid())
							.set("userId", user.getStr("userId"))
							.set("name", user.getStr("name"))
							.set("petName", Pet.dao.findById(user.getStr("petNo")).getStr("name"))
							.set("activateUserId", user.getStr("activateUserId"))
							.set("status", "0")
							.set("applyTime", System.currentTimeMillis()).save();

					return true;
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
			}
		});

		render(new JsonRender(result).forIE());
	}
}
