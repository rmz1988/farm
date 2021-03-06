package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.ActiveAuthApply;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.AES;
import com.ingkoo.farm.utils.MD5;
import com.ingkoo.farm.utils.Validator;
import com.jfinal.core.Controller;
import com.jfinal.render.JsonRender;

import java.util.List;

/**
 * 校验
 *
 * @author lichen
 */
public class CheckController extends Controller {

	/**
	 * 唯一用户Id
	 */
	public void uniqueUserId() {
		String userId = getPara("userId");
		render(new JsonRender(User.dao.findById(userId) == null).forIE());
	}

	/**
	 * 合法身份证号码
	 */
	public void validIdCard() {
		render(new JsonRender(Validator.checkIdCard(getPara("idCard"))).forIE());
	}

	/**
	 * 唯一身份证
	 */
	public void uniqueIdCard() {
		String idCard = getPara("idCard");
		render(new JsonRender(User.dao.findFirst("select * from user where idCard = ?", AES.encrypt(idCard)) == null)
				.forIE());
	}

	/**
	 * 合法推荐人编号
	 */
	public void validRecommendId() {
		String recommendUserId = getPara("recommendUserId");
		render(new JsonRender(
				User.dao.findFirst("select * from user where userId = ? and status = '2'", recommendUserId) != null)
				.forIE());
	}

	/**
	 * 合法激活编号
	 */
	public void validActiveNo() {
		String activatedNo = getPara("activatedNo");
		render(new JsonRender(User.dao.findFirst("select * from user where activeNo = ?", activatedNo) != null)
				.forIE());
	}

	/**
	 * 唯一激活编号
	 */
	public void uniqueActiveNo() {
		String activeNo = getPara("activeNo");
		List<User> userList = User.dao.find("select * from user where activeNo = ?", activeNo);
		List<ActiveAuthApply> applyList =
				ActiveAuthApply.dao.find("select * from active_auth_apply where activeNo = ?", activeNo);
		render(new JsonRender(userList.isEmpty() && applyList.isEmpty()).forIE());
	}

	/**
	 * 用户是否存在
	 */
	public void existsUser() {
		String userId = getPara("userId");

		render(new JsonRender(User.dao.findById(userId) != null).forIE());
	}

	/**
	 * 校验登录密码
	 */
	public void loginPwd() {
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		render(new JsonRender(user.getStr("loginPwd").equals(MD5.encrypt(getPara("loginPwd")))).forIE());
	}

	/**
	 * 校验支付密码
	 */
	public void tradePwd() {
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		render(new JsonRender(user.getStr("tradePwd").equals(MD5.encrypt(getPara("tradePwd")))).forIE());
	}

	/**
	 * 是否满15天
	 */
	public void lessThanDays() {
		User user = User.dao.findById(getPara("userId"));
		render(new JsonRender(user.canTransfer()).forIE());
	}
}
