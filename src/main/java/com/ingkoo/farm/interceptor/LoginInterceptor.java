package com.ingkoo.farm.interceptor;

import com.ingkoo.farm.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 登录拦截器
 *
 * @author lichen
 */
public class LoginInterceptor implements Interceptor {

	private List<String> excludeUris = new ArrayList<>();

	public LoginInterceptor(String... excludes) {
		Collections.addAll(excludeUris, excludes);
	}

	@Override
	public void intercept(ActionInvocation actionInvocation) {
		Controller controller = actionInvocation.getController();
		String controllerKey = actionInvocation.getControllerKey();
		if (!excludeUris.contains(controllerKey)) {
			if (controller.getSessionAttr("user") == null) {
				String cookieValue = controller.getCookie("loginCookie");
				if (cookieValue != null && cookieValue.contains(";")) {
					String userId = cookieValue.split(";")[0];
					String loginPwd = cookieValue.split(";")[1];
					User user = User.dao.findById(userId);
					if (user != null && user.getStr("loginPwd").equals(loginPwd)) {
						controller.setSessionAttr("user", user);
					} else {
						controller.redirect("/login");
						return;
					}
				}else{
					controller.redirect("/login");
					return;
				}
			}
		}

		actionInvocation.invoke();
	}
}
