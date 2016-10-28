package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.PetLifecycle;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.MoneyService;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

/**
 * 牧场（宠物管理）
 *
 * @author lichen
 */
public class PetController extends Controller {

	private MoneyService moneyService = new MoneyService();

	public void index() {
		setAttr("current", "pet");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("petDailyOutput", moneyService.getPetDailyOutput(user.getStr("userId")));
		setAttr("total", user.getStr("money"));
		setAttr("isFeed", user.getStr("isFeed"));
		setAttr("repurchase", user.getInt("todayRepurchase"));
		setAttr("pet", user.getUserPet());
		setAttr("repurchaseLimit", OtherRate.dao.findById("daily_repurchase_limit").getStr("rate"));
		render("pet.jsp");
	}

	public void queryLifecycleList() {
		String userId = ((User) getSessionAttr("user")).getStr("userId");
		Page<PetLifecycle> page =
				PetLifecycle.dao.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
						"from pet_lifecycle where userId = ? order by createTime desc", userId);
		setAttr("page", page);
		render("pet_content.jsp");
	}

	/**
	 * 喂养
	 */
	public void feed(){
		//判断当日已收入是否超过上限
		//修改用户状态，今日已喂养
		//用户余额以及每日收入增加当日产币量
		//记录总收益记录
		//计算领导奖，该用户上级的日产币额收益，记录相应收益记录
		redirect("/pet");
	}

	/**
	 * 复购
	 */
	public void repurchase(){
		//判断是否推荐超过4个人，生成pet lifecycle 活跃0天（收益比例：10%or13%）
		//增加个人复购次数，以及今日复购次数
		//该用户的推荐人获得复购金额的10%，记录推荐人的推荐奖记录，记录推荐人的总收益记录
		redirect("/pet");
	}
}
