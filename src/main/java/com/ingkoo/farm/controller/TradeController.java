package com.ingkoo.farm.controller;

import com.jfinal.core.Controller;

/**
 * 交易管理
 *
 * @author lichen
 */
public class TradeController extends Controller {

	/**
	 * 提现
	 */
	public void withdraw() {
		render("withdraw.jsp");
	}

	/**
	 * 互转
	 */
	public void transfer() {
		render("transfer.jsp");
	}
}
