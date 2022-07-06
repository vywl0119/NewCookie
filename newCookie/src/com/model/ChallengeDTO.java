package com.model;

public class ChallengeDTO {
	private int c_number;
	private String m_id;
	private String habit;
	private int money;
	private String account;
	private String start_date;
	private String end_date;
	private String fileName;;
	private String content;
	private String today;

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public ChallengeDTO(int c_number, String m_id, String fileName, String content) {
		super();
		this.c_number = c_number;
		this.m_id = m_id;
		this.fileName = fileName;
		this.content = content;
	}

	public ChallengeDTO(int c_number, String m_id, String habit, int money, String account, String start_date,
			String end_date) {

		this.c_number = c_number;
		this.m_id = m_id;
		this.habit = habit;
		this.money = money;
		this.account = account;
		this.start_date = start_date;
		this.end_date = end_date;
	}

	public ChallengeDTO(String m_id, String habit, int money, String account, String start_date, String end_date) {

		this.m_id = m_id;
		this.habit = habit;
		this.money = money;
		this.account = account;
		this.start_date = start_date;
		this.end_date = end_date;
	}

	public ChallengeDTO(int c_number, String habit, String start_date, String end_date, String m_id) {

		this.c_number = c_number;
		this.habit = habit;
		this.start_date = start_date;
		this.end_date = end_date;
		this.m_id = m_id;
	}

	public ChallengeDTO(String fileName, String today) {

		this.fileName = fileName;
		this.today = today;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getC_number() {
		return c_number;
	}

	public void setC_number(int c_number) {
		this.c_number = c_number;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getHabit() {
		return habit;
	}

	public void setHabit(String habit) {
		this.habit = habit;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

}
