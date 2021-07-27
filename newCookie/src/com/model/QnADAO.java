package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QnADAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	MemberDTO info = null;
	
	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
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

	public ArrayList<QnADTO> showQnA(){
		ArrayList<QnADTO> qna_list = new ArrayList<QnADTO>();
		try {		
			conn();
			String sql = "select * from qna";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int number = rs.getInt("q_number");
				String main = rs.getString("q_main");
				String sub = rs.getString("q_sub");
				
				QnADTO dto = new QnADTO(number, main, sub);
				qna_list.add(dto);
				
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return qna_list;
	}
	

}
