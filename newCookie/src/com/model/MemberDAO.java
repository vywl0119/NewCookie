package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

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

	public int join(MemberDTO dto) {

		try {
			conn();

			String sql = "insert into member(m_id, m_pw, name, nickname, birth, gender, email) values(?,?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getM_id());
			psmt.setString(2, dto.getM_pw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNickname());
			psmt.setString(5, dto.getBirth());
			psmt.setString(6, dto.getGender());
			psmt.setString(7, dto.getEmail());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;

	}

	public MemberDTO login(String m_id, String m_pw) {
		try {
			conn();
			String sql = "select * from member where m_id = ? and m_pw = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);
			psmt.setString(2, m_pw);
			rs = psmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String gender = rs.getString("gender");
				String email = rs.getString("email");

				String nickname = rs.getString(4);
				String pw = rs.getString(2);

				info = new MemberDTO(id, pw, name, nickname, birth, gender, email);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return info;
	}

	public int pwupdate(MemberDTO dto) {
		try {
			conn();

			String sql = "update member set m_pw = ? where m_id = ? ";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getM_pw());
			psmt.setString(2, dto.getM_id());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}

		return cnt;
	}

	public int edit(MemberDTO dto) {
		try {
			conn();

			String sql = "update member set filename = ? ,nickname = ? ,email = ?  where m_id = ? ";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getFilename());
			psmt.setString(2, dto.getNickname());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getM_id());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}

		return cnt;
	}
}
