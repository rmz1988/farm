package com.ingkoo.farm.interceptor;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import org.apache.commons.lang3.StringUtils;

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
				String loginUserId = controller.getCookie("loginUserId");
				String loginPwd = controller.getCookie("loginPwd");
				if (StringUtils.isNotEmpty(loginUserId) && StringUtils.isNotEmpty(loginPwd)) {
					User user = User.dao.findById(loginUserId);
					if (user != null && user.getStr("loginPwd").equals(loginPwd) && "2".equals(user.getStr("status"))) {
						user.put("pet",user.getUserPet());
						controller.setSessionAttr("user", user);
						controller.setSessionAttr("imageUrl", OtherRate.dao.findById("img_url").getStr("rate"));
						controller.setSessionAttr("imagePath", OtherRate.dao.findById("img_path").getStr("rate"));
						controller.setSessionAttr("qq", OtherRate.dao.findById("qq").getStr("rate"));
						//记录最后一次登录时间
						user.set("lastLoginTime", System.currentTimeMillis()).update();
					} else {
						controller.redirect("/login");
						return;
					}
				} else {
					controller.redirect("/login");
					return;
				}
			}
		}

		actionInvocation.invoke();
	}
}
