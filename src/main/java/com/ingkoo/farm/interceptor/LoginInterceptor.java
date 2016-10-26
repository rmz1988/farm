package com.ingkoo.farm.interceptor;

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
		actionInvocation.invoke();
	}
}
