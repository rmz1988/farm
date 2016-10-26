package com.ingkoo.farm.utils;

import java.util.Date;

/**
 * 校验
 *
 * @author lichen
 */
public final class Validator {

	/**
	 * 校验身份证号
	 *
	 * @param idCard 身份证号码
	 */
	public static boolean checkIdCard(String idCard) {
		String birth = idCard.substring(6, 14);

		Date birthDate = DateUtils.parse(birth, DateTimeConst.DATE_8);
		if (birthDate == null) {
			return false;
		}

		int[] weights = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
		String[] checkCodes = {"1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2"};

		int sum = 0;
		for (int i = 0; i < weights.length; i++) {
			sum += Character.digit(idCard.charAt(i), 10) * weights[i];
		}

		String checkCode = checkCodes[sum % 11];

		return checkCode.equalsIgnoreCase(String.valueOf(idCard.charAt(17)));

	}

}
