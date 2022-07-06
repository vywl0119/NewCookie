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

@WebServlet("/PwServiceCon")
public class PwServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		int cnt = 0;

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");

		String m_id = info.getM_id();
		String pw1 = request.getParameter("pw1");
		String pw2 = request.getParameter("pw2");

		System.out.println("pw1 : " + pw1);
		System.out.println("pw2 : " + pw2);

		MemberDTO dto = new MemberDTO(m_id, pw1);
		MemberDAO dao = new MemberDAO();

		if (pw1.equals(pw2)) {
			System.out.println("비밀번호 일치");
			cnt = dao.pwupdate(dto);
		}

		if (cnt > 0) {
			System.out.println("비밀번호 수정 성공");
		} else {
			System.out.println("비밀번호 수정 실패");
		}
		response.sendRedirect("main.jsp");

	}

}
