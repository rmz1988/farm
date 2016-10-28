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
		setAttr("current","trade");
		render("withdraw.jsp");
	}

	/**
	 * 互转
	 */
	public void transfer() {
		setAttr("current","trade");
		render("transfer.jsp");
	}
}
