package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class ChallengeDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	MemberDTO info = null;
	ArrayList<ChallengeDTO> datefile = new ArrayList<ChallengeDTO>();
	ArrayList<String> datefilel = new ArrayList<String>();
	String detefilel = null;

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

	public int insert(ChallengeDTO dto) {

		try {
			conn();

			String sql = "insert into my_challenge values (challenge_seq.nextval,?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getM_id());
			psmt.setString(2, dto.getHabit());
			psmt.setInt(3, dto.getMoney());
			psmt.setString(4, dto.getAccount());
			psmt.setString(5, dto.getStart_date());
			psmt.setString(6, dto.getEnd_date());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;

	}

	public ArrayList<ChallengeDTO> today_challenge(String id) {
		ArrayList<ChallengeDTO> challenge_list = new ArrayList<ChallengeDTO>();
		try {
			conn();
			String sql = "select * from my_challenge where m_id = ? and end_date > sysdate ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int c_number = rs.getInt("c_number");
				String habit = rs.getString("habit");
				String start_date = rs.getString("start_date");
				String end_date = rs.getString("end_date");

				ChallengeDTO dto = new ChallengeDTO(c_number, habit, start_date, end_date, id);

				challenge_list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return challenge_list;
	}

	public int challenge_date(String end) {

		String res_end = end.replace("-", "");
		String data_end = res_end.substring(0, 9);

		try {

			SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");

			final Date todayDate = new Date();
			final String todayDay = yyyyMMdd.format(todayDate);

			final Date targetDate = yyyyMMdd.parse(data_end);

			long gap = targetDate.getTime() - todayDate.getTime();

			cnt = (int) (gap / (24 * 60 * 60 * 1000) + 1);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int challengegogo(ChallengeDTO dto) {

		try {
			conn();

			String sql = "insert into challenge_gogo values(?,?,sysdate,?,? )";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getC_number());
			psmt.setString(2, dto.getM_id());
			psmt.setString(3, dto.getFileName());
			psmt.setString(4, dto.getContent());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;

	}

	public ArrayList<ChallengeDTO> datephoto(int num) {

		try {
			conn();
			String sql = "select filename, today from challenge_gogo where c_number = ? order by today ";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String today = rs.getString("today");
				String fileName = rs.getString("filename");

				ChallengeDTO dto = new ChallengeDTO(fileName, today);

				datefile.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return datefile;
	}

	public ArrayList<String> date(int num) {

		try {
			conn();
			String sql = "select today from challenge_gogo where c_number = ? order by today ";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String today = rs.getString("today");

				datefilel.add(today);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return datefilel;
	}

}
