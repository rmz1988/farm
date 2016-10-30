package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.Goods;
import com.jfinal.core.Controller;

/**
 * shangcheng
 *
 * @author lichen
 */
public class ShopController extends Controller {

	public void index() {
		setAttr("current", "shop");
		render("shop.jsp");
	}

	public void queryShopList() {
		setAttr("page", Goods.dao
				.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 40), "select *", "from goods"));
		render("shop_list.jsp");
	}

}
