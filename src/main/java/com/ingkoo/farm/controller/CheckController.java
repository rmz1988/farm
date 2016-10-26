package com.ingkoo.farm.controller;

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
}
