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
			
			String url = "jdbc:oracle:thin:@121.147.0.156:1521:xe";
			String dbid = "cookie";
			String dbpw = "cookie";
			
			conn = DriverManager.getConnection(url,dbid, dbpw);
		
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	// DB 문닫는 메소드
	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}catch (Exception e) {
            e.printStackTrace();
         }
	}
	
	
	// 회원가입 메소드
	public int join(MemberDTO dto) {	

		// DB 연결 메소드 호출
		try {
		conn();
		
		String sql = "insert into member values(?,?,?,?,?,?,?)";
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, dto.getM_id() );
		psmt.setString(2, dto.getM_pw());
		psmt.setString(3, dto.getName());
		psmt.setString(4, dto.getNickname());
		psmt.setString(5, dto.getBirth());
		psmt.setString(6, dto.getGender());
		psmt.setString(7, dto.getEmail());
		
		
		cnt = psmt.executeUpdate();
		
		}
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB 문 닫는 메소드 호출
			close();
		}
		return cnt;

	}

	
	// 로그인 메소드
	public MemberDTO login(String  m_id, String m_pw) {
	      try {
	         conn();
	         String sql = "select * from member where m_id = ? and m_pw = ?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, m_id);
	         psmt.setString(2, m_pw);
	         rs = psmt.executeQuery();
	         
	         if(rs.next()) {
	        	String id = rs.getString("m_id");
	            String nickname = rs.getString("nickname");
	            
	            info = new MemberDTO(id,nickname);
	            		

	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      } return info;
	   }
	
}
