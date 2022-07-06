package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.ChallengeDAO;
import com.model.ChallengeDTO;
import com.model.MemberDTO;
import com.model.QnADAO;
import com.model.QnADTO;

@WebServlet("/test")
public class test extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		ChallengeDAO c_dao = new ChallengeDAO();
		ArrayList<ChallengeDTO> challenge_list = new ArrayList<ChallengeDTO>();
		ArrayList<ChallengeDTO> datephoto = new ArrayList<ChallengeDTO>();

		challenge_list = c_dao.today_challenge(info.getM_id());

		int[] c_num = new int[3];
		for (int i = 0; i < challenge_list.size(); i++) {
			c_num[i] = challenge_list.get(i).getC_number();
			System.out.println(c_num[i]);
		}

		QnADAO dao = new QnADAO();
		ArrayList<QnADTO> list_day = dao.showmy_QnA_date(info.getM_id());

		if (list_day.size() > 0) {
			System.out.println("잘가져옴");
		} else {
			System.out.println("실패");
		}
	}

}
