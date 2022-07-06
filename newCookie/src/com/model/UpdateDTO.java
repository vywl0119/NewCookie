package com.model;

public class UpdateDTO {
	private int number;
	private String q_answer;
	private String m_id;

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getQ_answer() {
		return q_answer;
	}

	public void setQ_answer(String q_answer) {
		this.q_answer = q_answer;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public UpdateDTO(int number, String q_answer, String m_id) {
		super();
		this.number = number;
		this.q_answer = q_answer;
		this.m_id = m_id;
	}
}
