package com.ingkoo.farm.controller;

import com.ingkoo.farm.model.OtherRate;
import com.ingkoo.farm.utils.RandomCode;
import com.ingkoo.farm.vo.UeditorImgUploadResult;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

import java.io.File;
import java.io.FileOutputStream;
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
				String newImgName =
						RandomCode.uuid() + upFile.getFileName().substring(upFile.getFileName().lastIndexOf("."));
				String imageUrl = OtherRate.dao.findById("img_url").getStr("rate");
				String imagePath = OtherRate.dao.findById("img_path").getStr("rate");
				File img = upFile.getFile();
				//写入指定目录
				Files.copy(img.toPath(), new FileOutputStream(imagePath + newImgName));
				UeditorImgUploadResult result = new UeditorImgUploadResult();
				result.setUrl(imageUrl + newImgName);
				result.setTitle(newImgName);
				result.setOriginal(img.getName());
				result.setState(UeditorImgUploadResult.STATE_SUCCESS);
				renderText(result.toString());
				break;
			default:
				renderNull();
		}
	}
}
