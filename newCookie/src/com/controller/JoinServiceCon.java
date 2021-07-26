package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/JoinSeviceCon")
public class JoinServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// POST방식 인코딩
		request.setCharacterEncoding("EUC-KR");
		
		// email, pw, name, tel, address 받아오기
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		
		System.out.println("email :"+ email);
		System.out.println("pw :"+ pw);
		System.out.println("tel :"+ tel);
		System.out.println("addr :"+ addr);
		

		
	}

}
