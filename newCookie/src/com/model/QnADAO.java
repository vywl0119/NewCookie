package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpSession;

public class QnADAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	MemberDTO info = null;
	String[] to_day = new String[3];
	String today_answer = null;

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@59.0.236.156:1521:xe";
			String dbid = "cookie";
			String dbpw = "cookie";

			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// DB 문닫는 메소드
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<QnADTO> showQnA() {
		ArrayList<QnADTO> qna_list = new ArrayList<QnADTO>();
		try {
			conn();
			String sql = "select * from qna ";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int number = rs.getInt("q_number");
				String main = rs.getString("q_main");
				String sub = rs.getString("q_sub");

				QnADTO dto = new QnADTO(number, main, sub);
				qna_list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return qna_list;
	}

	public int date() {

		String data_end = "20210730";

		try {

			SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");

			final Date todayDate = new Date();
			final String todayDay = yyyyMMdd.format(todayDate);

			final Date targetDate = yyyyMMdd.parse(data_end);

			long gap = todayDate.getTime() - targetDate.getTime();

			cnt = (int) (gap / (24 * 60 * 60 * 1000) + 1);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public String[] today() {

		Date today = new Date();

		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

		String date1 = date.format(today);

		to_day = date1.split("-");

		return to_day;
	}

	public int my_qna(QnADTO dto) {
		try {
			conn();

			String sql = "insert into my_qna values(?,?,?,sysdate)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getM_id());
			psmt.setInt(2, dto.getNumber());
			psmt.setString(3, dto.getQ_answer());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;

	}

	public ArrayList<QnADTO> showmy_QnA(String m_id) {
		ArrayList<QnADTO> myqna_list = new ArrayList<QnADTO>();
		try {
			conn();
			String sql = "select m.m_id, m.q_number, a.q_main, m.q_answer, m.q_date, a.q_sub "
					+ "from qna a , my_qna m " + "where a.q_number = m.q_number " + "and m.m_id = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int number = rs.getInt("q_number");
				String main = rs.getString("q_main");
				String id = rs.getString("m_id");
				String q_date = rs.getString("q_date");
				String q_answer = rs.getString("q_answer");
				String sub = rs.getString("q_sub");

				QnADTO dto = new QnADTO(number, main, sub, q_answer, q_date, m_id);
				myqna_list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return myqna_list;
	}

	public String answer(String id, int num) {

		try {
			conn();
			String sql = "select * from my_qna where m_id= ? and q_number = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, num);
			rs = psmt.executeQuery();

			while (rs.next()) {

				today_answer = rs.getString("q_answer");

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return today_answer;
	}

	public int update(UpdateDTO dto) {
		try {
			conn();

			String sql = "update my_qna set q_answer = ? where q_number = ? and m_id = ? ";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getQ_answer());
			psmt.setInt(2, dto.getNumber());
			psmt.setString(3, dto.getM_id());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;

	}

	public ArrayList<QnADTO> showmy_QnA_date(String m_id) {
		ArrayList<QnADTO> myqna_answer_day = new ArrayList<QnADTO>();
		try {
			conn();
			String sql = "select q_date from my_qna where Q_ANSWER is not null and m_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				// String id = rs.getString("m_id");
				String q_date = rs.getString("q_date");

				QnADTO dto = new QnADTO(q_date, m_id);
				myqna_answer_day.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return myqna_answer_day;
	}

	public String[] day(int i) {
		Date today = new Date();

		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

		today = new Date(today.getTime() + (1000 * 60 * 60 * 24 * -i));

		String date1 = date.format(today);

		to_day = date1.split("-");

		return to_day;
	}

}
