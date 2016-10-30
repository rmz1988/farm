package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.Feedback;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.RandomCode;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.render.JsonRender;

import java.sql.SQLException;
import java.util.Random;

/**
 * 反馈
 *
 * @author lichen
 */
public class FeedbackController extends Controller {

	public void index() {
		setAttr("current", "index");
		render("feedback.jsp");
	}

	/**
	 * 查询反馈列表
	 */
	public void queryFeedbackList() {
		User user = getSessionAttr("user");
		setAttr("page", Feedback.dao.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 20), "select *",
				"from feedback where userId = ? order by createTime desc", user.getStr("userId")));
		render("feedback_list.jsp");
	}

	/**
	 * 反馈详情
	 */
	public void detail() {
		setAttr("current", "index");
		setAttr("feedback", Feedback.dao.findById(getPara("feedbackId")));
		render("feedback_detail.jsp");
	}

	/**
	 * 发布
	 */
	public void publish() {
		setAttr("current", "index");
		render("feedback_send.jsp");
	}

	public void doPublish() {
		final User user = getSessionAttr("user");
		final Feedback feedback = getModel(Feedback.class, "feedback");
		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				return feedback.set("feedbackId", RandomCode.uuid())
						.set("userId", user.getStr("userId"))
						.set("status", "0")
						.set("createTime", System.currentTimeMillis())
						.save();
			}
		});
		render(new JsonRender(result).forIE());
	}
}
