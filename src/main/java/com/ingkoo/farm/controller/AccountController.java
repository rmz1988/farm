package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.ActiveAuthApply;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.RecommendService;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

/**
 * 账号管理
 *
 * @author lichen
 */
public class AccountController extends Controller {

	private RecommendService recommendService = new RecommendService();

	/**
	 * 推荐列表
	 */
	public void recommend() {
		setAttr("current", "account");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("recommendLevelList", recommendService.queryRecommendList(user));
		render("recommend_list.jsp");
	}

	/**
	 * 申请激活中心权限
	 */
	public void apply() {
		setAttr("current", "account");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("user", user);
		setAttr("recommendCount", user.getInt("recommendCount"));
		setAttr("activeNo", user.getStr("activeNo"));
		setAttr("activeAuthApply", ActiveAuthApply.dao
				.findFirst("select * from active_auth_apply where userId = ?", user.getStr("userId")));
		render("activate_apply.jsp");
	}

	/**
	 * 提交申请
	 */
	public void doApply() {

	}

	@ActionKey("/account/apply/edit")
	public void applyEdit() {
		setAttr("current", "account");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("user", user);
		setAttr("activeAuthApply", ActiveAuthApply.dao.findById(getPara("applyId")));

		render("active_apply_edit.jsp");
	}

	/**
	 * 提交编辑
	 */
	public void doApplyEdit() {

	}

	/**
	 * 激活中心管理
	 */
	public void activate() {
		setAttr("current", "account");
	}
}
