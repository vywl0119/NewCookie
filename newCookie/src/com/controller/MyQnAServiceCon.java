package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.QnADAO;
import com.model.QnADTO;

@WebServlet("/MyQnAServiceCon")
public class MyQnAServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		QnADAO dao = new QnADAO();
		ArrayList<QnADTO> qna_list = new ArrayList<QnADTO>();
		qna_list = dao.showQnA();
		int cnt = dao.date();
		Date today = new Date();

		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

		String date1 = date.format(today);
		String url = request.getParameter("url");

		int q_number = qna_list.get(cnt).getNumber();
		String m_id = info.getM_id();
		String answer = request.getParameter("answer");

		System.out.println("q_number : " + q_number);
		System.out.println("m_id : " + m_id);
		System.out.println("answer : " + answer);

		QnADTO dto = new QnADTO(q_number, answer, date1, m_id);

		int q_cnt = dao.my_qna(dto);

		if (q_cnt > 0) {
			System.out.println("QnA기입 성공");
		} else {
			System.out.println("QnA기입 실패");
		}
		response.sendRedirect(url);

	}

}
