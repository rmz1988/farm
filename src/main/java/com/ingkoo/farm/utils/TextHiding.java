package com.ingkoo.farm.utils;

import org.apache.commons.lang3.StringUtils;

/**
 * 文字关键信息隐藏
 *
 * @author lichen
 */
public final class TextHiding {

	/**
	 * 隐藏真实姓名或用户名
	 *
	 * @param name 名称
	 */
	public static String hideName(String name) {
		String hideText = "";
		if (StringUtils.isNotEmpty(name)) {
			int len = name.length();

			if (len == 2) {
				hideText = "*" + name.substring(len - 1);
			} else if (len > 2) {
				hideText = name.substring(0, 1) + getWildCards(len - 2) + name.substring(len - 1);
			}
		}

		return hideText;
	}

	/**
	 * 隐藏身份证号码
	 *
	 * @param idCard 身份证号码
	 */
	public static String hideIdCard(String idCard) {
		String hideText = "";
		if (StringUtils.isNotEmpty(idCard) && idCard.length() == 18) {
			hideText = idCard.substring(0, 6) + getWildCards(8) + idCard.substring(idCard.length() - 4);
		}

		return hideText;
	}

	/**
	 * 隐藏手机号
	 *
	 * @param mobile 手机号
	 */
	public static String hideMobile(String mobile) {
		String hideText = "";
		if (StringUtils.isNotEmpty(mobile)) {
			int len = mobile.length();
			if (len >= 11) {
				hideText = mobile.substring(0, len - 8) + getWildCards(4) + mobile.substring(len - 4);
			} else {
				hideText = mobile.substring(0, 1) + getWildCards(len - 2) + mobile.substring(len - 1);
			}

		}

		return hideText;
	}

	/**
	 * 隐藏邮箱
	 *
	 * @param email 邮箱
	 */
	public static String hideEmail(String email) {
		String hideText = "";
		if (StringUtils.isNotEmpty(email)) {
			String name = email.substring(0, email.indexOf("@"));
			hideText = hideName(name) + email.substring(email.indexOf('@'));
		}

		return hideText;
	}

	private static String getWildCards(int len) {
		StringBuilder builder = new StringBuilder();
		for (int i = 0; i < len; i++) {
			builder.append("*");
		}

		return builder.toString();
	}

}
