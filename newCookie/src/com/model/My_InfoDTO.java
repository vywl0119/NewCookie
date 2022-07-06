package com.model;

public class My_InfoDTO {

	private String m_id;
	private String title;
	private String date;
	private String filename;
	private String q1;
	private String a1;
	private String q2;
	private String a2;
	private String q3;
	private String a3;
	private String q4;
	private String a4;

	private String school;
	private String g_date;

	private String lisence;
	private String getdate;
	private String place;

	public My_InfoDTO(String m_id, String title, String q1, String a1, String q2, String a2, String q3, String a3,
			String q4, String a4) {

		this.m_id = m_id;
		this.title = title;
		this.q1 = q1;
		this.a1 = a1;
		this.q2 = q2;
		this.a2 = a2;
		this.q3 = q3;
		this.a3 = a3;
		this.q4 = q4;
		this.a4 = a4;
	}

	public My_InfoDTO(String filename, String title, String date, String q1, String a1, String q2, String a2, String q3,
			String a3, String q4, String a4) {
		super();
		this.filename = filename;
		this.title = title;
		this.date = date;
		this.q1 = q1;
		this.a1 = a1;
		this.q2 = q2;
		this.a2 = a2;
		this.q3 = q3;
		this.a3 = a3;
		this.q4 = q4;
		this.a4 = a4;
	}

	public My_InfoDTO(String school, String g_date) {
		super();
		this.school = school;
		this.g_date = g_date;
	}

	public My_InfoDTO(String lisence, String getdate, String place) {
		super();
		this.lisence = lisence;
		this.getdate = getdate;
		this.place = place;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getQ1() {
		return q1;
	}

	public void setQ1(String q1) {
		this.q1 = q1;
	}

	public String getA1() {
		return a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}

	public String getQ2() {
		return q2;
	}

	public void setQ2(String q2) {
		this.q2 = q2;
	}

	public String getA2() {
		return a2;
	}

	public void setA2(String a2) {
		this.a2 = a2;
	}

	public String getQ3() {
		return q3;
	}

	public void setQ3(String q3) {
		this.q3 = q3;
	}

	public String getA3() {
		return a3;
	}

	public void setA3(String a3) {
		this.a3 = a3;
	}

	public String getQ4() {
		return q4;
	}

	public void setQ4(String q4) {
		this.q4 = q4;
	}

	public String getA4() {
		return a4;
	}

	public void setA4(String a4) {
		this.a4 = a4;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getG_date() {
		return g_date;
	}

	public void setG_date(String g_date) {
		this.g_date = g_date;
	}

	public String getLisence() {
		return lisence;
	}

	public void setLisence(String lisence) {
		this.lisence = lisence;
	}

	public String getGetdate() {
		return getdate;
	}

	public void setGetdate(String getdate) {
		this.getdate = getdate;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

}
