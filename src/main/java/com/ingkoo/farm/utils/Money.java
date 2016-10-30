package com.ingkoo.farm.utils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

/**
 * 计算金额
 *
 * @author lichen
 */
public final class Money {

	private static DecimalFormat df = new DecimalFormat("0.00");

	private String value;

	public Money(Number value) {
		this.value = String.valueOf(value);
	}

	public Money(String value) {
		this.value = value;
	}

	/**
	 * 加
	 */
	public Money add(String value) {
		return new Money(format(new BigDecimal(this.value).add(new BigDecimal(value)).doubleValue()));
	}

	/**
	 * 减
	 */
	public Money subtract(String value) {
		double result = new BigDecimal(this.value).subtract(new BigDecimal(value)).doubleValue();
		return new Money(format(result));
	}

	/**
	 * 乘
	 */
	public Money multiply(String value) {
		return new Money(format(new BigDecimal(this.value).multiply(new BigDecimal(value)).doubleValue()));
	}

	/**
	 * 除
	 */
	public Money divide(String value) {
		return new Money(format(new BigDecimal(this.value).divide(new BigDecimal(value), 2, RoundingMode.HALF_UP)
				.doubleValue()));
	}

	public Money add(Money money) {
		return add(money.toString());
	}

	public Money subtract(Money money) {
		return subtract(money.toString());
	}

	public Money multiply(Money money) {
		return multiply(money.toString());
	}

	public Money divide(Money money) {
		return divide(money.toString());
	}

	public Money add(Number value) {
		return add(String.valueOf(value));
	}

	public Money subtract(Number value) {
		return subtract(String.valueOf(value));
	}

	public Money multiply(Number value) {
		return multiply(String.valueOf(value));
	}

	public Money divide(Number value) {
		return divide(String.valueOf(value));
	}

	/**
	 * 求和
	 */
	public static Money sum(Number... values) {
		Money money = new Money("0");
		for (Number num : values) {
			money = money.add(num);
		}
		return money;
	}

	public static Money sum(String... values) {
		Money money = new Money("0");
		for (String num : values) {
			money = money.add(num);
		}
		return money;
	}

	/**
	 * 求平均值
	 */
	public static Money average(Number... values) {
		return Money.sum(values).divide(values.length);
	}

	/**
	 * 格式化金额，格式：0.00
	 */
	public static String format(Number value) {
		return df.format(value);
	}

	/**
	 * 获取小于等于原数字的符合整倍数的最大值
	 *
	 * @param origin 原数字
	 * @param times  倍数
	 */
	public static String maxOfTimes(String origin, String times) {
		BigDecimal money = new BigDecimal(origin);
		return format(money.subtract(money.remainder(new BigDecimal(times))).doubleValue());
	}

	@Override
	public String toString() {
		return this.value == null ? "0.00" : this.value;
	}

	public double doubleValue() {
		return this.value == null ? 0.0d : Double.parseDouble(this.value);
	}
}
