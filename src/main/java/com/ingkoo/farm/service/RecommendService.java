package com.ingkoo.farm.service;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.Pet;
import com.ingkoo.farm.model.RecommendIncome;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.DateTimeConst;
import com.ingkoo.farm.utils.DateUtils;
import com.ingkoo.farm.utils.Money;
import org.springframework.format.datetime.standard.DateTimeContext;

import java.util.Date;

/**
 * 推荐
 *
 * @author lichen
 */
public class RecommendService {

	/**
	 * 保存推荐奖励
	 *
	 * @param user 玩家信息
	 * @param type 0:直推玩家提成，1：玩家复购提成
	 */
	public void saveRecommendIncome(User user, String type) {
		Pet pet = Pet.dao.findById(user.getStr("petNo"));
		//直推提成比例
		String recommendRate = "0".equals(type) ? OtherRate.dao.findById("redirect_recommend_rate").getStr("rate") :
				OtherRate.dao.findById("redirect_repurchase_rate").getStr("rate");
		//直推收益
		String recommendIncome =
				new Money(pet.getStr("price")).multiply(new Money(recommendRate)).divide(100).toString();

		User recommendUser = User.dao.findById(user.getStr("recommendUserId"));
		//修改推荐人金币余额和当天已获得收益,添加已推荐人数量
		recommendUser.set("money", new Money(recommendUser.getStr("money")).add(recommendIncome).toString())
				.set("todayIncome", new Money(recommendUser.getStr("todayIncome")).add(recommendIncome).toString())
				.set("recommendCount", recommendUser.getInt("recommendCount") + 1)
				.update();
		//记录推荐奖励日志
		new RecommendIncome().set("recommendUserId", user.getStr("userId"))
				.set("name", user.getStr("name"))
				.set("income", recommendIncome)
				.set("createTime", System.currentTimeMillis())
				.set("userId", recommendUser.getStr("userId")).save();
		//记录总收益明细
		TotalIncome.dao.saveRecommendIncome(recommendUser, recommendIncome);
	}
}