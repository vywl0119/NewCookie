package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.QnADAO;
import com.model.QnADTO;
import com.model.UpdateDTO;

@WebServlet("/UpdateServiceCon")
public class UpdateServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("EUC-KR");
		QnADAO dao = new QnADAO();
		ArrayList<QnADTO> qna_list = new ArrayList<QnADTO>();
		qna_list = dao.showQnA();

		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String m_id = info.getM_id();
		String url = request.getParameter("url");

		int cnt = dao.date();

		int number = qna_list.get(cnt).getNumber();
		String q_answer = request.getParameter("answer");

		System.out.println("num : " + number);
		System.out.println("answer : " + q_answer);

		UpdateDTO dto = new UpdateDTO(number, q_answer, m_id);

		int cntt = dao.update(dto);

		if (cnt > 0) {
			System.out.println("답변 수정 성공");
		} else {
			System.out.println("답변 수정 실패");
		}

		response.sendRedirect(url);
	}

}
