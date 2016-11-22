package com.ingkoo.farm.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Const;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.jfinal.i18n.I18N;
import org.apache.commons.lang3.StringUtils;

/**
 * 国际化拦截器
 *
 * @author lichen
 */
public class I18NInterceptor implements Interceptor {

	@Override
	public void intercept(ActionInvocation actionInvocation) {
		Controller controller = actionInvocation.getController();
		String remoteLang = controller.getRequest().getLocale().toString();
		String cookieLang = controller.getCookie(Const.I18N_LOCALE);
		if (StringUtils.isEmpty(cookieLang)) {
			controller.setCookie(Const.I18N_LOCALE, remoteLang, Const.DEFAULT_I18N_MAX_AGE_OF_COOKIE,
					JFinal.me().getContextPath());
		}
		controller.setAttr("i18n", I18N.me());
		controller.setAttr("locale", controller.getCookie(Const.I18N_LOCALE));

		actionInvocation.invoke();
	}
}
