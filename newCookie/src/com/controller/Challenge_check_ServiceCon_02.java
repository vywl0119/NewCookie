package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ChallengecheckServiceCon02")
public class Challenge_check_ServiceCon_02 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String m_id = info.getM_id();

		ChallengeDAO c_dao = new ChallengeDAO();
		ArrayList<ChallengeDTO> challenge_list = new ArrayList<ChallengeDTO>();
		ArrayList<ChallengeDTO> datephoto = new ArrayList<ChallengeDTO>();

		challenge_list = c_dao.today_challenge(info.getM_id());

		int c_number = challenge_list.get(1).getC_number();

		System.out.println("number : " + c_number);

		ChallengeDAO dao = new ChallengeDAO();

		datephoto.addAll(dao.datephoto(c_number));

		String result = "[";
		if (datephoto.size() > 0) {
			int i = 0;
			for (; i < datephoto.size() - 1; i++) {
				result += String.format("{\"title\":\"%s\", \"start\":\"%s\"}", datephoto.get(i).getFileName(),
						datephoto.get(i).getToday());
				result += ",";
			}
			result += String.format("{\"title\":\"%s\", \"start\":\"%s\"}", datephoto.get(i).getFileName(),
					datephoto.get(i).getToday());
			result += "]";
			System.out.print(result);
			out.print(result);
		} else {
			System.out.println("챌린지 사진 가져오기 실패");
		}

	}

}