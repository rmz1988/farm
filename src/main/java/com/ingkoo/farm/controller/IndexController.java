package com.ingkoo.farm.controller;

import com.jfinal.core.Controller;

/**
 * @author lichen
 */
public class IndexController extends Controller {

	public void index() {
		render("/index.jsp");
	}

}
