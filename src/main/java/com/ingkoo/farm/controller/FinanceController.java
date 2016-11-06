package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.ActiveIncome;
import com.ingkoo.farm.model.DailyIncome;
import com.ingkoo.farm.model.RecommendIncome;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.jfinal.core.Controller;

/**
 * 财务管理
 *
 * @author lichen
 */
public class FinanceController extends Controller {

	/**
	 * 激活明细
	 */
	public void active() {
		setAttr("current", "finance");
		render("active.jsp");
	}

	public void queryActiveList() {
		User user = getSessionAttr("user");
		setAttr("page", ActiveIncome.dao
				.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
						"from active_income where userId = ? order by createTime desc", user.getStr("userId")));
		render("active_list.jsp");
	}

	/**
	 * 每日收入
	 */
	public void daily() {
		setAttr("current", "finance");
		render("daily.jsp");
	}

	public void queryDailyList() {
		User user = getSessionAttr("user");
		/*setAttr("page", DailyIncome.dao.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
				"from daily_income where userId = ? order by id desc", user.getStr("userId")));*/
		setAttr("page", TotalIncome.dao
				.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
						"from total_income where userId = ? order by id desc", user.getStr("userId")));
		render("daily_list.jsp");
	}

	/**
	 * 推荐奖励
	 */
	public void recommend() {
		setAttr("current", "finance");
		render("recommend.jsp");
	}

	public void queryRecommendList() {
		User user = getSessionAttr("user");
		setAttr("page", RecommendIncome.dao
				.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
						"from recommend_income where userId = ? order by createTime desc", user.getStr("userId")));
		render("recommend_list.jsp");
	}

	/**
	 * 总收入
	 */
	public void total() {
		setAttr("current", "finance");
		render("total.jsp");
	}

	public void queryTotalList() {
		User user = getSessionAttr("user");
		setAttr("page", TotalIncome.dao
				.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
						"from total_income where userId = ? order by id desc", user.getStr("userId")));
		render("total_list.jsp");
	}

}
