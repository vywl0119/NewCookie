package com.model;

public class KeywordDTO {

	private String mbti;
	private String keyword;
	private String sample;

	public KeywordDTO(String mbti, String keyword, String sample) {
		super();
		this.mbti = mbti;
		this.keyword = keyword;
		this.sample = sample;
	}

	public String getMbti() {
		return mbti;
	}

	public void setMbti(String mbti) {
		this.mbti = mbti;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSample() {
		return sample;
	}

	public void setSample(String sample) {
		this.sample = sample;
	}

}
