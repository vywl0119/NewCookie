package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class InfoDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	MemberDTO info = null;

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

	public int itdinsert(InfoDTO dto) {

		try {
			conn();

			String sql = "insert into itd values(?,?,sysdate,?,?,?,?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getM_id());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getQ1());
			psmt.setString(4, dto.getA1());
			psmt.setString(5, dto.getQ2());
			psmt.setString(6, dto.getA2());
			psmt.setString(7, dto.getQ3());
			psmt.setString(8, dto.getA3());
			psmt.setString(9, dto.getQ4());
			psmt.setString(10, dto.getA4());
			psmt.setString(11, dto.getFilename());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;

	}

	public int lisenceinsert(InfoDTO dto) {

		try {
			conn();

			String sql = "insert into lisence values (?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getM_id());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getLisence());
			psmt.setString(4, dto.getGetdate());
			psmt.setString(5, dto.getPlace());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;

	}

	public int schoolinsert(InfoDTO dto) {

		try {
			conn();

			String sql = "insert into school values (?,?,?,?) ";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getM_id());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getSchool());
			psmt.setString(4, dto.getG_date());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;

	}

	public ArrayList<My_InfoDTO> my_itd(String title) {
		ArrayList<My_InfoDTO> itd_list = new ArrayList<My_InfoDTO>();
		try {
			conn();
			String sql = "select * from itd where title = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String date = rs.getString("itd_date");
				String q1 = rs.getString("q1");
				String a1 = rs.getString("a1");
				String q2 = rs.getString("q2");
				String a2 = rs.getString("a2");
				String q3 = rs.getString("q3");
				String a3 = rs.getString("a3");
				String q4 = rs.getString("q4");
				String a4 = rs.getString("a4");
				String filename = rs.getString("filename");

				My_InfoDTO dtoa = new My_InfoDTO(filename, title, date, q1, a1, q2, a2, q3, a3, q4, a4);

				itd_list.add(dtoa);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return itd_list;
	}

	public ArrayList<My_InfoDTO> my_school(String title) {
		ArrayList<My_InfoDTO> school_list = new ArrayList<My_InfoDTO>();
		try {
			conn();
			String sql = "select * from school where title = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String school = rs.getString("school");
				String g_date = rs.getString("g_date");

				My_InfoDTO dto = new My_InfoDTO(school, g_date);
				school_list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return school_list;
	}

	public ArrayList<My_InfoDTO> my_lisence(String title) {
		ArrayList<My_InfoDTO> lisence_list = new ArrayList<My_InfoDTO>();
		try {
			conn();
			String sql = "select * from lisence where title = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String lisence = rs.getString("lisence");
				String getdate = rs.getString("getdate");
				String place = rs.getString("place");

				My_InfoDTO dto = new My_InfoDTO(lisence, getdate, place);

				lisence_list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return lisence_list;
	}

	public ArrayList<InfoDTO> itd(String m_id) {
		ArrayList<InfoDTO> itd = new ArrayList<InfoDTO>();
		try {
			conn();
			String sql = "select * from itd where m_id = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String title = rs.getString("title");
				String date = rs.getString("itd_date");

				InfoDTO dto = new InfoDTO(title, date);

				itd.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return itd;
	}

	public int deleteschool(String title) {

		try {
			conn();

			String sql = "delete from school where title = ?  ";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, title);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}

	public int deletelisence(String title) {

		try {
			conn();

			String sql = "delete from lisence where title = ?  ";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, title);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}

	public int deleteitd(String title) {

		try {
			conn();

			String sql = "delete from itd where title = ?  ";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, title);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}

}
