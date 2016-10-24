package com.ingkoo.farm.config;

import com.ingkoo.farm.controller.IndexController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.spring.SpringPlugin;
import com.jfinal.render.ViewType;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.swing.*;

/**
 * @author lichen
 */
public class FarmConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants constants) {
		constants.setDevMode(true);
		constants.setEncoding("utf-8");
		constants.setBaseViewPath("/WEB-INF/jsp");
		constants.setViewType(ViewType.JSP);
	}

	@Override
	public void configRoute(Routes routes) {
		routes.add("/", IndexController.class,"/index");
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
		arp.setShowSql(true);
//		arp.addMapping()
		arp.start();

		plugins.add(new SpringPlugin(new ClassPathXmlApplicationContext("applicationContext.xml")));
	}

	@Override
	public void configInterceptor(Interceptors interceptors) {

	}

	@Override
	public void configHandler(Handlers handlers) {

	}
}
