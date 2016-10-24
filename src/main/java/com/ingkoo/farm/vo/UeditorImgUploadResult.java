package com.ingkoo.farm.vo;

import java.io.Serializable;

/**
 * Ueditor图片上传结果
 *
 * @author lichen
 */
public class UeditorImgUploadResult implements Serializable {

	private static final long serialVersionUID = 474217537046717062L;

	public static final String STATE_SUCCESS = "SUCCESS";
	public static final String STATE_FAILED = "FAILED";

	private String url;
	private String title;
	private String original;
	private String state;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOriginal() {
		return original;
	}

	public void setOriginal(String original) {
		this.original = original;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String toString() {
		return "{\"url\":\"" + url + "\",\"title\":\"" + title + "\",\"original\":\"" + original +
				"\",\"state\":\"" +
				state + "\"}";
	}
}
