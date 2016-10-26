package com.ingkoo.farm.utils;

/**
 * 16进制转换
 *
 * @author lichen
 */
public final class Hex {

	/**
	 * byte数组转为16进制字符串
	 */
	public static String bytes2Hex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for (byte b : bytes) {
			String hex = Integer.toHexString(0xff & b);
			if (hex.length() == 2) {
				builder.append(hex);
			} else {
				builder.append("0").append(hex);
			}
		}

		return builder.toString();
	}

	/**
	 * 16进制字符串转byte数组
	 */
	public static byte[] hex2Bytes(String hex) {
		if (hex == null) {
			return new byte[0];
		}
		if ((hex.length() & 1) == 1) {
			hex = "0" + hex;
		}

		int byteLength = hex.length() >> 1;
		byte[] bytes = new byte[byteLength];
		for (int i = 0; i < byteLength; i++) {
			int highByte = Character.digit(hex.charAt(i * 2), CodecConst.RADIX_16);
			int lowByte = Character.digit(hex.charAt(i * 2 + 1), CodecConst.RADIX_16);
			bytes[i] = (byte) ((highByte << 4) | lowByte);
		}

		return bytes;
	}
}
