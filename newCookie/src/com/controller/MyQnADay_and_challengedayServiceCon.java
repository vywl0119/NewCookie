package com.controller;

import java.awt.List;
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

import com.google.gson.Gson;
import com.model.ChallengeDAO;
import com.model.ChallengeDTO;
import com.model.JSONDTO;
import com.model.MemberDTO;
import com.model.QnADAO;
import com.model.QnADTO;

@WebServlet("/MyQnADay_and_challengedayServiceCon")
public class MyQnADay_and_challengedayServiceCon extends HttpServlet {

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
		int q_number = myqna_answer_day.get(cnt).getNumber();
		String date1 = date.format(today);
		String m_id = info.getM_id();
		String q_date = request.getParameter("q_date");

		PrintWriter out = response.getWriter();

		QnADTO dto = new QnADTO(q_date, m_id);

		ArrayList<QnADTO> list_day = dao.showmy_QnA_date(m_id);

		String result = "[";

		ArrayList<JSONDTO> jsonArray = new ArrayList<JSONDTO>();

		if (list_day.size() > 0) {
			int i = 0;
			System.out.println(list_day.size());
			for (; i < list_day.size() - 1; i++) {

				JSONDTO j_dto = new JSONDTO("simple event", list_day.get(i).getQ_date());
				jsonArray.add(j_dto);

			}
			JSONDTO j_dto = new JSONDTO("simple event", list_day.get(i).getQ_date());
			jsonArray.add(j_dto);

		}

		JSONDTO j_dto3 = new JSONDTO("middle1", "");
		jsonArray.add(j_dto3);

		ChallengeDAO c_dao = new ChallengeDAO();
		ArrayList<ChallengeDTO> challenge_list = new ArrayList<ChallengeDTO>();
		ArrayList<ChallengeDTO> datephoto = new ArrayList<ChallengeDTO>();

		challenge_list = c_dao.today_challenge(info.getM_id());

		int[] c_num = new int[3];

		for (int i = 0; i < challenge_list.size(); i++) {
			c_num[i] = challenge_list.get(i).getC_number();
		}

		if (c_num[0] != 0) {
			datephoto.addAll(c_dao.datephoto(c_num[0]));
			if (datephoto.size() > 0) {
				int i = 0;
				for (; i < datephoto.size() - 1; i++) {

					JSONDTO j_dto = new JSONDTO("simple event", datephoto.get(i).getToday());
					jsonArray.add(j_dto);
				}

				JSONDTO j_dto = new JSONDTO("simple event", datephoto.get(i).getToday());
				jsonArray.add(j_dto);

			}
		}

		JSONDTO j_dto4 = new JSONDTO("middle2", "");
		jsonArray.add(j_dto4);

		if (c_num[1] != 0) {
			datephoto.addAll(c_dao.datephoto(c_num[1]));
			if (datephoto.size() > 0) {
				int i = 0;
				for (; i < datephoto.size() - 1; i++) {

					JSONDTO j_dto = new JSONDTO("simple event", datephoto.get(i).getToday());
					jsonArray.add(j_dto);
				}

				JSONDTO j_dto = new JSONDTO("simple event", datephoto.get(i).getToday());
				jsonArray.add(j_dto);

			}
		}

		JSONDTO j_dto5 = new JSONDTO("middle3", "");
		jsonArray.add(j_dto5);

		if (c_num[2] != 0) {
			datephoto.addAll(c_dao.datephoto(c_num[2]));
			if (datephoto.size() > 0) {
				int i = 0;
				for (; i < datephoto.size() - 1; i++) {

					JSONDTO j_dto = new JSONDTO("simple event", datephoto.get(i).getToday());
					jsonArray.add(j_dto);
				}

				JSONDTO j_dto = new JSONDTO("simple event", datephoto.get(i).getToday());
				jsonArray.add(j_dto);

			}
		}

		String resultJson = new Gson().toJson(jsonArray);
		System.out.println(resultJson);
		out.print(resultJson);

	}

}