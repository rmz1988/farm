package com.ingkoo.farm.controller;

import com.ingkoo.farm.vo.UeditorImgUploadResult;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

/**
 * @author lichen
 */
public class UeditorController extends Controller {

	/**
	 * 上传图片
	 */
	public void uploadImg() throws IOException {
		String action = getPara("action");
		switch (action) {
			case "config":
				String path = Thread.currentThread().getContextClassLoader().getResource("config.json").getFile();
				String config = new String(Files.readAllBytes(new File(path).toPath()), "utf-8");
				renderText(config);
				break;
			case "uploadimage":
				UploadFile upFile = getFile("upfile");
				renderText(new UeditorImgUploadResult().toString());
				break;
			default:
				renderNull();
		}
	}
}
