package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/MyQnADayServiceCon")
public class MyQnADayServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		QnADAO dao = new QnADAO();
		ArrayList<QnADTO> myqna_answer_day = new ArrayList<QnADTO>();
		myqna_answer_day = dao.showQnA();
		int cnt = dao.date();
		Date today = new Date();

		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

		String date1 = date.format(today);

		int q_number = myqna_answer_day.get(cnt).getNumber();
		String m_id = info.getM_id();
		String q_date = request.getParameter("q_date");

		PrintWriter out = response.getWriter();
		System.out.println("m_id : " + m_id);
		System.out.println("q_date : " + q_date);

		QnADTO dto = new QnADTO(q_date, m_id);

		ArrayList<QnADTO> list_day = dao.showmy_QnA_date(m_id);
		String result = "[";
		if (list_day.size() > 0) {
			int i = 0;
			for (; i < list_day.size() - 1; i++) {
				result += String.format("{\"title\":\"simple event\", \"start\":\"%s\"}", list_day.get(i).getQ_date());
				result += ",";
			}
			result += String.format("{\"title\":\"simple event\", \"start\":\"%s\"}", list_day.get(i).getQ_date());
			result += "]";
			out.print(result);
		} else {
			System.out.println("QnADAy 실패");
		}

	}

}