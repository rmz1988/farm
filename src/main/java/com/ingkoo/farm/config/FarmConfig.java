package com.ingkoo.farm.config;

import com.ingkoo.farm.controller.*;
import com.ingkoo.farm.interceptor.I18NInterceptor;
import com.ingkoo.farm.interceptor.LoginInterceptor;
import com.ingkoo.farm.model.*;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.Const;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.spring.SpringPlugin;
import com.jfinal.render.ViewType;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Locale;

/**
 * @author lichen
 */
public class FarmConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants constants) {
		constants.setDevMode(false);
		constants.setEncoding("utf-8");
		constants.setBaseViewPath("/WEB-INF/jsp");
		constants.setViewType(ViewType.JSP);
		constants.setI18n("text", Locale.CHINA, Const.DEFAULT_I18N_MAX_AGE_OF_COOKIE);
	}

	@Override
	public void configRoute(Routes routes) {
		routes.add("/check", CheckController.class);
		routes.add("/", IndexController.class, "/index");
		routes.add("/login", LoginController.class, "/user");
		routes.add("/register", RegisterController.class, "/user");
		routes.add("/pet", PetController.class, "/pet");
		routes.add("/trade", TradeController.class, "/trade");
		routes.add("/ueditor", UeditorController.class);
		routes.add("/self", SelfController.class, "/self");
		routes.add("/account", AccountController.class, "/account");
		routes.add("/finance", FinanceController.class, "/finance");
		routes.add("/notice", NoticeController.class, "/index");
		routes.add("/feedback", FeedbackController.class, "/index");
		routes.add("/shop", ShopController.class, "/shop");
	}

	@Override
	public void configPlugin(Plugins plugins) {
		loadPropertyFile("db.properties");
		C3p0Plugin c3p0Plugin =
				new C3p0Plugin(getProperty("db.url"), getProperty("db.username"), getProperty("db.password"),
						getProperty("db.driver"));
		c3p0Plugin.setMinPoolSize(getPropertyToInt("c3p0.minPoolSize"));
		c3p0Plugin.setMaxPoolSize(getPropertyToInt("c3p0.maxPoolSize"));
		c3p0Plugin.setMaxIdleTime(getPropertyToInt("c3p0.maxIdleTime"));
		c3p0Plugin.setAcquireIncrement(getPropertyToInt("c3p0.acquireIncrement"));
		c3p0Plugin.setInitialPoolSize(getPropertyToInt("c3p0.initialPoolSize"));
		c3p0Plugin.start();

		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		arp.setDialect(new MysqlDialect());
		arp.setShowSql(false);
		arp.addMapping("active_apply", "applyId", ActiveApply.class);
		arp.addMapping("active_auth_apply", "applyId", ActiveAuthApply.class);
		arp.addMapping("active_income", ActiveIncome.class);
		arp.addMapping("dict", Dict.class);
		arp.addMapping("goods", "goodsId", Goods.class);
		arp.addMapping("leader_rate", "rateNo", LeaderRate.class);
		arp.addMapping("other_rate", "rateKey", OtherRate.class);
		arp.addMapping("pet", "petNo", Pet.class);
		arp.addMapping("pet_lifecycle", PetLifecycle.class);
		arp.addMapping("recommend_income", RecommendIncome.class);
		arp.addMapping("total_income", TotalIncome.class);
		arp.addMapping("transfer", "transferId", Transfer.class);
		arp.addMapping("withdraw", "withdrawId", Withdraw.class);
		arp.addMapping("user", "userId", User.class);
		arp.addMapping("notice", "noticeId", Notice.class);
		arp.addMapping("feedback", "feedbackId", Feedback.class);
		arp.addMapping("daily_income", DailyIncome.class);
		arp.addMapping("transfer_to_active", "transferId", TransferToActive.class);
		arp.addMapping("leader_income", LeaderIncome.class);
		arp.addMapping("purchase_apply", "applyId", PurchaseApply.class);
		arp.start();

		plugins.add(new SpringPlugin(new ClassPathXmlApplicationContext("applicationContext.xml")));
	}

	@Override
	public void configInterceptor(Interceptors interceptors) {
		interceptors.add(new I18NInterceptor());
		interceptors.add(new LoginInterceptor("/login", "/register", "/check"));
	}

	@Override
	public void configHandler(Handlers handlers) {
	}
}
