package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.Notice;
import com.jfinal.core.Controller;

/**
 * 公告
 *
 * @author lichen
 */
public class NoticeController extends Controller {

	public void index() {
		setAttr("current", "index");
		render("notice.jsp");
	}

	public void queryNoticeList() {
		setAttr("page", Notice.dao.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
				"from notice order by createTime desc"));
		render("notice_list.jsp");
	}

	public void detail() {
		setAttr("notice", Notice.dao.findById(getPara("noticeId")));

		render("notice_detail.jsp");
	}
}
