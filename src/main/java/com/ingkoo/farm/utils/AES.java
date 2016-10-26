package com.ingkoo.farm.utils;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 * AES加解密
 *
 * @author lichen
 */
public final class AES {

	private static Cipher cipher;
	private static SecretKey key;
	private static IvParameterSpec ivParameterSpec;

	static {
		try {
			cipher = Cipher.getInstance(CodecConst.AES_TRANSFORMATION);
			key = new SecretKeySpec(CodecConst.SECRET_KEY.getBytes(CodecConst.CHARSET_UTF8), CodecConst.ALGORITHM_AES);
			ivParameterSpec = new IvParameterSpec(CodecConst.IV_PARAMETER.getBytes(CodecConst.CHARSET_UTF8));
		} catch (NoSuchAlgorithmException | NoSuchPaddingException | UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
	}

	public static String encrypt(String source) {
		try {
			cipher.init(Cipher.ENCRYPT_MODE, key, ivParameterSpec, new SecureRandom());
			return Hex.bytes2Hex(cipher.doFinal(source.getBytes(CodecConst.CHARSET_UTF8)));
		} catch (InvalidKeyException | UnsupportedEncodingException | IllegalBlockSizeException |
				BadPaddingException | InvalidAlgorithmParameterException | NullPointerException e) {
			return "";
		}
	}

	public static String decrypt(String encryptedHex) {
		try {
			cipher.init(Cipher.DECRYPT_MODE, key, ivParameterSpec, new SecureRandom());
			return new String(cipher.doFinal(Hex.hex2Bytes(encryptedHex)), CodecConst.CHARSET_UTF8);
		} catch (InvalidKeyException | BadPaddingException | IllegalBlockSizeException | UnsupportedEncodingException |
				InvalidAlgorithmParameterException | NullPointerException e) {
			return "";
		}
	}
}
