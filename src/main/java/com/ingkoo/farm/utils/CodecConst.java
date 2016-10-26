package com.ingkoo.farm.utils;

/**
 * 编码常量
 *
 * @author lichen
 */
public final class CodecConst {

	/**
	 * utf-8编码
	 */
	public static final String CHARSET_UTF8 = "UTF-8";

	/**
	 * 16进制
	 */
	public static final int RADIX_16 = 16;

	/**
	 * MD5算法
	 */
	public static final String ALGORITHM_MD5 = "MD5";


	/**
	 * SHA1算法
	 */
	public static final String ALGORITHM_SHA1 = "SHA1";

	/**
	 * AES算法
	 */
	public static final String ALGORITHM_AES = "AES";

	/**
	 * AES填充方式
	 */
	public static final String AES_TRANSFORMATION = "AES/CBC/PKCS5Padding";

	/**
	 * 填充向量
	 */
	public static final String IV_PARAMETER = "abcdefgh12345678";

	/**
	 * aes密钥
	 */
	public static final String SECRET_KEY = "abcdefgh12345678";

	/**
	 * Http Content-Type
	 */
	public static final String HTTP_CONTENT_JSON_TYPE = "application/json;charset=utf-8";
	public static final String HTTP_CONTENT_TEXT_TYPE = "text/plain;charset=utf-8";

	/**
	 * Http Accept-Encoding
	 */
	public static final String HTTP_ACCEPT_ENCODING = "gzip";

}
