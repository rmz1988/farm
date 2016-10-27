package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.Dict;
import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.Pet;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.MoneyService;
import com.ingkoo.farm.service.RecommendService;
import com.ingkoo.farm.utils.AES;
import com.ingkoo.farm.utils.MD5;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.render.JsonRender;

import java.sql.SQLException;

/**
 * 注册
 *
 * @author lichen
 */
public class RegisterController extends Controller {

	private MoneyService moneyService = new MoneyService();
	private RecommendService recommendService = new RecommendService();

	public void index() {
		setAttr("imgUrl", OtherRate.dao.findById("img_url").getStr("rate"));
		setAttr("petList", Pet.dao.find("select * from pet"));
		setAttr("bankList", Dict.dao.find("select * from dict where dictGroup = 'bank'"));
		render("register.jsp");
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
							.set("bankCard", AES.encrypt(user.getStr("bankCard"))).save();

					//计算推荐奖，判断收入是否达到上限，加入推荐人账户，记录推荐奖明细
					if (!moneyService.isOverDailyIncome(user.getStr("userId"))) {
						recommendService.saveRecommendIncome(user);
					}

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
