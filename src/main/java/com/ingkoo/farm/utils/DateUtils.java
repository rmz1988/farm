package com.ingkoo.farm.utils;

import org.apache.commons.lang3.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * 日期格式化
 *
 * @author lichen
 */
public final class DateUtils {

	/**
	 * 格式化日期成指定字符串
	 *
	 * @param date    日期
	 * @param pattern 日期格式
	 */
	public static String format(Date date, String pattern) {
		if (date == null || StringUtils.isBlank(pattern)) {
			return null;
		}

		SimpleDateFormat sdf;
		try {
			sdf = new SimpleDateFormat(pattern);
		} catch (Exception e) {
			return null;
		}

		return sdf.format(date);
	}

	/**
	 * 解析指定格式日期字符串为Date
	 *
	 * @param date    日期字符串
	 * @param pattern 日期格式
	 */
	public static Date parse(String date, String pattern) {
		if (StringUtils.isBlank(date) || StringUtils.isBlank(pattern)) {
			return null;
		}
		SimpleDateFormat sdf;
		try {
			sdf = new SimpleDateFormat(pattern);
			return sdf.parse(date);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 获取昨天日期
	 */
	public static String getYesterday(String pattern) {
		Calendar calendar = Calendar.getInstance(Locale.CHINA);
		calendar.add(Calendar.DATE, -1);
		return format(calendar.getTime(), pattern);
	}

	/**
	 * 获取上个月日期
	 */
	public static String getLastMonth(String pattern) {
		Calendar calendar = Calendar.getInstance(Locale.CHINA);
		calendar.add(Calendar.MONTH, -1);
		return format(calendar.getTime(), pattern);
	}

	/**
	 * 获取去年日期
	 */
	public static String getLastYear(String pattern) {
		Calendar calendar = Calendar.getInstance(Locale.CHINA);
		calendar.add(Calendar.YEAR, -1);
		return format(calendar.getTime(), pattern);
	}

	/**
	 * 校验日期格式是否合法
	 *
	 * @param time    日期字符串
	 * @param pattern 格式
	 */
	public static boolean isValidDate(String time, String pattern) {
		return parse(time, pattern) != null;
	}

}
