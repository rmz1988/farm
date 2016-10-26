package com.ingkoo.farm.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5加密
 *
 * @author lichen
 */
public final class MD5 {

	public static String encrypt(String source) {
		try {
			return encrypt(source.getBytes(CodecConst.CHARSET_UTF8));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "";
		}
	}

	public static String encrypt(byte[] source) {
		try {
			MessageDigest digest = MessageDigest.getInstance(CodecConst.ALGORITHM_MD5);
			return Hex.bytes2Hex(digest.digest(source));
		} catch (NoSuchAlgorithmException | NullPointerException e) {
			return "";
		}
	}
}
