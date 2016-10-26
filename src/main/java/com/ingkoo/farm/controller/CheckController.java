package com.ingkoo.farm.controller;

import com.ingkoo.farm.utils.Validator;
import com.jfinal.core.Controller;
import com.jfinal.render.JsonRender;

/**
 * 校验
 *
 * @author lichen
 */
public class CheckController extends Controller {

	/**
	 * 唯一用户Id
	 */
	public void uniqueUserId() {
		render(new JsonRender(true).forIE());
	}

	/**
	 * 合法身份证号码
	 */
	public void validIdCard() {
		render(new JsonRender(Validator.checkIdCard(getPara("idCard"))).forIE());
	}
}
