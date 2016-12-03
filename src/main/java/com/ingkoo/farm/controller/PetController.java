package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.Pet;
import com.ingkoo.farm.model.PetLifecycle;
import com.ingkoo.farm.model.TotalIncome;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.service.LeaderService;
import com.ingkoo.farm.service.MoneyService;
import com.ingkoo.farm.service.RecommendService;
import com.ingkoo.farm.utils.Money;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import org.apache.commons.lang3.StringUtils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 牧场（宠物管理）
 *
 * @author lichen
 */
public class PetController extends Controller {

	private static ExecutorService es = Executors.newFixedThreadPool(5);

	private MoneyService moneyService = new MoneyService();
	private RecommendService recommendService = new RecommendService();
	private LeaderService leaderService = new LeaderService();

	public void index() {
		setAttr("current", "pet");
		User user = User.dao.findById(((User) getSessionAttr("user")).getStr("userId"));
		setAttr("canVisit", moneyService.canVisit());
		setAttr("total", user.getStr("money"));
		setAttr("isFeed", user.getStr("isFeed"));
		setAttr("repurchase", user.getInt("todayRepurchase"));
		setAttr("pet", user.getUserPet());
		setAttr("repurchaseLimit", OtherRate.dao.findById("daily_repurchase_limit").getStr("rate"));
		setAttr("overIncome", moneyService.isOverDailyIncome(user.getStr("userId")));
		setAttr("totalOutput", moneyService.getTotalOutput(user.getStr("userId")));

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
	@Before(Tx.class)
	public void feed() {
		final String userId = ((User) getSessionAttr("user")).getStr("userId");
		User sessionUser = User.dao.findById(userId);
		if ("1".equals(sessionUser.getStr("isFeed"))) {
			redirect("/pet");
			return;
		}

		synchronized (MoneyService.MONEY_LOCK) {
			final User user = User.dao.findById(userId);

			//判断当日已收入是否超过上限
			if (!moneyService.isOverDailyIncome(userId) && "0".equals(user.getStr("isFeed"))) {
				//修改用户状态，今日已喂养
				new User().set("userId", userId).set("isFeed", "1").update();
				//用户余额以及每日收入增加当日产币量
				final String dailyPetOutput = moneyService.getPetDailyOutput(userId);
				String actualIncome = moneyService.actualIncome(userId, dailyPetOutput);
				user.set("money", new Money(user.getStr("money")).add(actualIncome).toString())
						.set("todayIncome", new Money(user.getStr("todayIncome")).add(actualIncome).toString())
						.update();
				//修改宠物生命周期
				moneyService.saveDailyOutput(userId, actualIncome);
				//记录总收益记录
				new TotalIncome().savePetOutput(user, actualIncome);
				//计算领导奖，该用户上级的日产币额收益，记录相应收益记录
				es.submit(new Runnable() {

					@Override
					public void run() {
						leaderService.calcLeaderIncome(user, dailyPetOutput);
					}
				});
			}
		}

		redirect("/pet");
	}

	/**
	 * 复购
	 */
	@Before(Tx.class)
	public void repurchase() {
		final String userId = ((User) getSessionAttr("user")).getStr("userId");
		Db.update("update user set rePurchase = rePurchase+1,todayRepurchase=todayRepurchase + 1 where userId = ?",
				userId);
		synchronized (MoneyService.MONEY_LOCK) {
			User user = User.dao.findById(userId);
			Pet pet = user.getUserPet();
			if (Double.parseDouble(user.getStr("money")) >= Double.parseDouble(pet.getStr("price"))) {
				//判断是否推荐超过4个人，生成pet lifecycle 活跃0天（收益比例：10%or13%）
				String dailyOutputRate =
						user.getInt("recommendCount") < 4 ?
								OtherRate.dao.findById("redirect_repurchase_rate").getStr("rate") :
								OtherRate.dao.findById("daily_output_rate").getStr("rate");
				String dailyOutput = new Money(pet.getStr("price")).multiply(dailyOutputRate).divide(100).toString();
				new PetLifecycle().set("userId", user.getStr("userId"))
						.set("petNo", user.getStr("petNo"))
						.set("liveDays", 0)
						.set("overtimeDays", pet.getInt("lifecycle"))
						.set("price", Money.format(Double.parseDouble(pet.getStr("price"))))
						.set("dailyOutput", dailyOutput)
						.set("dailyOutputRate", dailyOutputRate)
						.set("totalOutput", "0.00")
						.set("createTime", System.currentTimeMillis())
						.set("status", "1")
						.save();
				//扣除宠物价格，增加个人复购次数，以及今日复购次数
				user.set("money", new Money(user.getStr("money")).subtract(pet.getStr("price")).toString())
						.update();
				new TotalIncome().saveRepurchaseOutput(user, pet.getStr("price"));

				//该用户的推荐人获得复购金额的10%，记录推荐人的推荐奖记录，记录推荐人的总收益记录
				if (StringUtils.isNotEmpty(user.getStr("recommendUserId")) &&
						!moneyService.isOverDailyIncome(user.getStr("recommendUserId"))) {
					recommendService.saveRecommendIncome(user, "1");
				}
			}
		}

		redirect("/pet");
	}
}
