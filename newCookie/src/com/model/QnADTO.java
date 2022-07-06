package com.model;

public class QnADTO {

	private int number;
	private String main;
	private String sub;
	private String q_answer;
	private String q_date;
	private String m_id;

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getMain() {
		return main;
	}

	public void setMain(String main) {
		this.main = main;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getQ_answer() {
		return q_answer;
	}

	public void setQ_answer(String q_answer) {
		this.q_answer = q_answer;
	}

	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public QnADTO(int number, String main, String sub) {

		this.number = number;
		this.main = main;
		this.sub = sub;
	}

	public QnADTO(int number, String q_answer, String q_date, String m_id) {

		this.number = number;
		this.q_answer = q_answer;
		this.q_date = q_date;
		this.m_id = m_id;
	}

	public QnADTO(int number, String main, String sub, String q_answer, String q_date, String m_id) {
		super();
		this.number = number;
		this.main = main;
		this.sub = sub;
		this.q_answer = q_answer;
		this.q_date = q_date;
		this.m_id = m_id;
	}

	public QnADTO(int number, String q_answer) {

		this.number = number;
		this.q_answer = q_answer;
	}

	public QnADTO(String q_date, String m_id) {
		super();
		this.q_date = q_date;
		this.m_id = m_id;
	}

}