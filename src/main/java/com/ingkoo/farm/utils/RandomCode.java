package com.ingkoo.farm.utils;

import java.util.Random;
import java.util.UUID;

/**
 * 随机数编码
 *
 * @author lichen
 */
public final class RandomCode {

	private static Random r = new Random();

	/**
	 * 生成指定长度的随机数
	 *
	 * @param len 随机数长度
	 */
	public static String randomNum(int len) {
		StringBuilder numBuilder = new StringBuilder();
		for (int i = 0; i < len; i++) {
			numBuilder.append(r.nextInt(10));
		}

		return numBuilder.toString();
	}

	/**
	 * 生成指定长度的随机字符串
	 */
	public static String randomStr(int len) {
		final Random r = new Random();
		final char[] arr = new char[36];
		for (int q = 0; q < 26; q++) {
			arr[q] = (char) ('a' + q);
		}
		for (int q = 26; q < arr.length; q++) {
			arr[q] = (char) ('0' + q - 26);
		}
		StringBuilder code = new StringBuilder();
		for (int i = 0; i < len; i++) {
			int index;
			final int rnd = r.nextInt();
			index = (rnd < 0 ? -rnd : rnd) % arr.length;
			code.append(arr[index]);
		}
		return code.toString();
	}

	/**
	 * 生成32位uuid
	 */
	public static String uuid() {
		String uuid = UUID.randomUUID().toString();
		return uuid.replaceAll("-", "");
	}

}
