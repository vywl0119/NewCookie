package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.ChallengeDAO;
import com.model.ChallengeDTO;
import com.model.MemberDTO;

@WebServlet("/ChallengeServiceCon")
public class ChallengeServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("EUC-KR");
		 
		 int money = Integer.parseInt(request.getParameter("money"));
		 String habit = request.getParameter("field");
		 String start_date = request.getParameter("start");
		 String end_date = request.getParameter("end");
		 String account = request.getParameter("account");
		 
		 
		 System.out.println("money : "+ money);
		 System.out.println("habit : "+ habit);
		 System.out.println("start_date : "+ start_date);
		 System.out.println("end_date : "+ end_date);
		 System.out.println("account : "+ account);
		 
		 HttpSession session = request.getSession();
		 MemberDTO info = (MemberDTO)session.getAttribute("info");
		 String m_id = info.getM_id(); 
		 
		 ChallengeDTO dto = new ChallengeDTO(m_id, habit, money, account, start_date, end_date);
		 
		 ChallengeDAO dao = new ChallengeDAO();
		 int cnt = dao.insert(dto);
		 
		 if(cnt > 0 ) {
			 System.out.println("챌린지 가입 성공");
		 }else {
			 System.out.println("챌린지 가입 실패");
		 }
		 
		 
		 response.sendRedirect("30days.jsp");
		 
	}

}
