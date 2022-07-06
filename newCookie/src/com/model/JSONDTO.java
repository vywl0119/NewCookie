package com.model;

public class JSONDTO {
	String title;
	String start;

	public JSONDTO(String title, String start) {
		super();
		this.title = title;
		this.start = start;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

}