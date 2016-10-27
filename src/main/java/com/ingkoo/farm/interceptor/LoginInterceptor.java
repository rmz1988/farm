package com.ingkoo.farm.interceptor;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;

import javax.servlet.http.Cookie;
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
				/*Cookie cookie = controller.getCookieObject("loginCookie");
				if (cookie != null && cookie.getValue().contains(";")) {
					String userId =  cookie.getValue().split(";")[0];
					String loginPwd =  cookie.getValue().split(";")[1];
					User user = User.dao.findById(userId);
					if (user != null && user.getStr("loginPwd").equals(loginPwd) && "2".equals(user.getStr("status"))) {
						controller.setSessionAttr("user", user);
						controller.setSessionAttr("imageUrl", OtherRate.dao.findById("img_url").getStr("rate"));
						controller.setSessionAttr("imagePath", OtherRate.dao.findById("img_path").getStr("rate"));
						//记录最后一次登录时间
						user.set("lastLoginTime", System.currentTimeMillis()).update();
					} else {
						controller.redirect("/login");
						return;
					}
				} else {
					controller.redirect("/login");
					return;
				}*/
				controller.redirect("/login");
			}
		}

		actionInvocation.invoke();
	}
}
