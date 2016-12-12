package com.ingkoo.farm.service;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.Pet;
import com.ingkoo.farm.model.RecommendIncome;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.Money;
import com.jfinal.plugin.activerecord.Db;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 推荐
 *
 * @author lichen
 */
public class RecommendService {

	private LeaderService leaderService = new LeaderService();
	private MoneyService moneyService = new MoneyService();

	private static ExecutorService es = Executors.newFixedThreadPool(5);


	/**
	 * 保存推荐奖励
	 *
	 * @param user 玩家信息
	 */
	public void saveRecommendIncome(User user) {
		synchronized (MoneyService.MONEY_LOCK) {
			Pet pet = Pet.dao.findById(user.getStr("petNo"));
			//直推提成比例
			String recommendRate = OtherRate.dao.findById("redirect_recommend_rate").getStr("rate");
			//直推收益
			final String income =
					new Money(pet.getStr("price")).multiply(new Money(recommendRate)).divide(100).toString();
			final User recommendUser = User.dao.findById(user.getStr("recommendUserId"));

			if (moneyService.petValid(recommendUser.getStr("userId"))) {
				//判断实际收益
				final String recommendIncome = moneyService.actualIncome(recommendUser.getStr("userId"), income);

				//修改推荐人金币余额和当天已获得收益,添加已推荐人数量
				recommendUser.set("money", new Money(recommendUser.getStr("money")).add(recommendIncome).toString())
						.set("todayIncome",
								new Money(recommendUser.getStr("todayIncome")).add(recommendIncome).toString())
						.set("recommendCount", recommendUser.getInt("recommendCount") + 1)
						.set("total", new Money(recommendUser.getStr("total")).add(recommendIncome).toString())
						.update();

				//记录推荐奖励日志
				new RecommendIncome().set("recommendUserId", user.getStr("userId"))
						.set("name", user.getStr("name"))
						.set("income", recommendIncome)
						.set("createTime", System.currentTimeMillis())
						.set("userId", recommendUser.getStr("userId")).save();
				//记录总收益明细
				new TotalIncome().saveRecommendIncome(recommendUser, recommendIncome);

				//计算领导奖
				es.submit(new Runnable() {

					@Override
					public void run() {
						leaderService.calcLeaderIncome(recommendUser, income);
					}
				});
			}

			//再上一级用户动态推荐数量+1
			User recommendUpUser = User.dao.findById(recommendUser.getStr("recommendUserId"));
			if (recommendUpUser != null) {
				recommendUpUser.set("activeRecommendCount", recommendUpUser.getInt("activeRecommendCount") + 1)
						.update();
			}
		}
	}

	/**
	 * 查询推荐，递归展示
	 *
	 * @param user 玩家
	 * @return 数组，0：团队人数，1:直推人数，2：团队列表
	 */
	public Object[] queryRecommendList(User user) {
		Object[] recommendResult = new Object[3];
		List<List<User>> recommendLevelList = new ArrayList<>();
		List<User> parentUserList = Arrays.asList(user);
		int teamCount = 0;
		List<User> recommendUserList;
		while (true) {
			recommendUserList = new ArrayList<>();
			for (User parentUser : parentUserList) {
				List<User> userList =
						User.dao.find("select * from user where recommendUserId = ? and status = '2'",
								parentUser.getStr("userId"));
				if (userList.isEmpty()) {
					continue;
				}
				recommendUserList.addAll(userList);
			}
			if (recommendUserList.isEmpty()) {
				break;
			}
			teamCount += recommendUserList.size();
			parentUserList = recommendUserList;
			recommendLevelList.add(recommendUserList);
		}

		recommendResult[0] = teamCount;
		recommendResult[1] = Db.queryLong("select count(*) from user where recommendUserId = ? and status = '2'",
				user.getStr("userId"));
		recommendResult[2] = recommendLevelList;

		return recommendResult;
	}

	/**
	 * 查询团队人数
	 *
	 * @param user 用户
	 */
	public int getTeamCount(User user) {
		List<User> parentUserList = Arrays.asList(user);
		int teamCount = 0;
		List<User> recommendUserList;
		while (true) {
			recommendUserList = new ArrayList<>();
			for (User parentUser : parentUserList) {
				List<User> userList =
						User.dao.find("select * from user where recommendUserId = ? and status = '2'",
								parentUser.getStr("userId"));
				if (userList.isEmpty()) {
					continue;
				}
				recommendUserList.addAll(userList);
			}
			if (recommendUserList.isEmpty()) {
				break;
			}
			teamCount += recommendUserList.size();
			parentUserList = recommendUserList;
		}

		return teamCount;
	}

	/**
	 * 统计团队收益
	 *
	 * @param user 用户
	 */
	public String addUpTeamIncome(User user, String date) {
		List<User> parentUserList = Arrays.asList(user);
		Money teamIncome = new Money(user.getStr("todayIncome"));
		List<User> recommendUserList;
		while (true) {
			recommendUserList = new ArrayList<>();
			for (User parentUser : parentUserList) {
				List<User> userList =
						User.dao.find("select * from user where recommendUserId = ? and status = '2'",
								parentUser.getStr("userId"));
				if (userList.isEmpty()) {
					continue;
				}
				for (User recommendedUser : userList) {
					TotalIncome totalIncome = TotalIncome.dao
							.findFirst("select * from total_income where userId = ? and createTime = ?",
									recommendedUser.getStr("userId"), date);
					teamIncome = teamIncome.add(totalIncome != null ? totalIncome.getStr("output") : "0.00")
							.add(totalIncome != null ? totalIncome.getStr("recommendIncome") : "0.00")
							.add(totalIncome != null ? totalIncome.getStr("leaderIncome") : "0.00")
							.add(totalIncome != null ? totalIncome.getStr("activeIncome") : "0.00");
				}

				recommendUserList.addAll(userList);
			}
			if (recommendUserList.isEmpty()) {
				break;
			}
			parentUserList = recommendUserList;
		}

		return teamIncome.toString();

	}
}
