package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KeywordDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;

	String mbti = null;;

	ArrayList<String> keyword_list = new ArrayList<String>();
	ArrayList<String> mbti_list = new ArrayList<String>();
	ArrayList<String> sample_list = new ArrayList<String>();

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

	public ArrayList<String> keyword() {

		try {
			conn();
			String sql = "select distinct keyword from keyword ";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String keywords = rs.getString("keyword");
				keyword_list.add(keywords);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return keyword_list;
	}

	public ArrayList<String> my_mbti(String keyword) {

		try {
			conn();
			String sql = "select mbti from keyword where keyword = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, keyword);
			rs = psmt.executeQuery();

			while (rs.next()) {

				mbti = rs.getString("mbti");
				mbti_list.add(mbti);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mbti_list;
	}

	public ArrayList<String> sample(String mbti) {

		try {
			conn();
			String sql = "select sample from keyword where mbti = ? and not sample is null ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mbti);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String sample = rs.getString("sample");
				sample_list.add(sample);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return sample_list;
	}

	public int mbtiupdate(String mbti, String id) {
		try {
			conn();

			String sql = "update member set mbti = ? where m_id = ? ";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, mbti);
			psmt.setString(2, id);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;

	}

	public String idmbti(String m_id) {

		try {
			conn();
			String sql = "select mbti from member where m_id = ?  ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);
			rs = psmt.executeQuery();

			while (rs.next()) {

				mbti = rs.getString("mbti");

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mbti;
	}
}
