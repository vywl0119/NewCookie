package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;



@WebServlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// POST방식 인코딩
		request.setCharacterEncoding("EUC-KR");
		
		// email, pw, name, tel, address 받아오기
		String m_id = request.getParameter("id");
		String m_pw = request.getParameter("pswd1");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");	
		String email = request.getParameter("email");

		
		
		System.out.println("id : "+ m_id);
		System.out.println("pw : "+ m_pw);
		System.out.println("name :"+ name);
		System.out.println("nickname :"+ nickname);
		System.out.println("birth :"+ birth);
		System.out.println("gender :"+ gender);
		System.out.println("email :"+ email);
		
		MemberDTO dto = new MemberDTO(m_id, m_pw, name, nickname, birth, gender, email);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(dto);
		
		if(cnt > 0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패..");
		}
		
	}

}
