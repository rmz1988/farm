package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.Feedback;
import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.model.User;
import com.ingkoo.farm.utils.RandomCode;
import com.ingkoo.farm.vo.UeditorImgUploadResult;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.render.JsonRender;
import com.jfinal.upload.UploadFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
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

	@Before(Tx.class)
	public void uploadImg() throws IOException {
		UploadFile upFile = getFile();
		String newImgName =
				RandomCode.uuid() + upFile.getFileName().substring(upFile.getFileName().lastIndexOf("."));
		String imageUrl = OtherRate.dao.findById("img_url").getStr("rate");
		String imagePath = OtherRate.dao.findById("img_path").getStr("rate");
		File img = upFile.getFile();
		//写入指定目录
		FileOutputStream out = new FileOutputStream(imagePath + newImgName);
		Files.copy(img.toPath(), out);
		out.close();
		UeditorImgUploadResult result = new UeditorImgUploadResult();
		result.setUrl(imageUrl + newImgName);
		result.setTitle(newImgName);
		result.setOriginal(img.getName());
		result.setState(UeditorImgUploadResult.STATE_SUCCESS);
		render(new JsonRender(result).forIE());
	}

	@Before(Tx.class)
	public void deleteImg() throws IOException {
		String imgName = getPara("imgName");
		String imagePath = OtherRate.dao.findById("img_path").getStr("rate");
		File file = new File(imagePath + imgName);
		render(new JsonRender(file.delete()).forIE());
	}

	public void doPublish() {
		final User user = getSessionAttr("user");
		final Feedback feedback = getModel(Feedback.class, "feedback");
		boolean result = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				return feedback.set("feedbackId", RandomCode.uuid())
						.set("userId", user.getStr("userId"))
						.set("content",feedback.getStr("content").replaceAll("\n","<br/>"))
						.set("status", "0")
						.set("createTime", System.currentTimeMillis())
						.save();
			}
		});
		render(new JsonRender(result).forIE());
	}
}
