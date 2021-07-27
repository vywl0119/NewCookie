package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ChallengeDAO {
	
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
	   
	   public int insert(ChallengeDTO dto) {   

		      // DB 연결 메소드 호출
		      try {
		      conn();
		      
		      String sql = "insert into my_challenge values (challenge_seq.nextval,?,?,?,?,?,?)";
		      
		      psmt = conn.prepareStatement(sql);
		      
		      psmt.setString(1, dto.getM_id() );
		      psmt.setString(2, dto.getHabit());
		      psmt.setInt(3, dto.getMoney());
		      psmt.setString(4, dto.getAccount());
		      psmt.setString(5, dto.getStart_date());
		      psmt.setString(6, dto.getEnd_date());

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
}
