package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.KeywordDAO;
import com.model.MemberDTO;

@WebServlet("/KeywordServiceCon")
public class KeywordServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String m_id = info.getM_id();

		// keyword.jsp 에서 선택한 키워드 my_keyword에 저장
		String[] my_keyword = request.getParameterValues("keyword");

		ArrayList<String> my_mbti = new ArrayList<String>();
		KeywordDAO dao = new KeywordDAO();

		// 저장된 키워드 확인
		for (int i = 0; i < my_keyword.length; i++) {
			System.out.println(my_keyword[i] + " ");
		}

		int INFP = 0;
		int ENFP = 0;
		int ESTP = 0;
		int INTJ = 0;
		int ISTP = 0;
		int ENTJ = 0;
		int INFJ = 0;
		int ESFP = 0;
		int ISTJ = 0;
		int ESFJ = 0;
		int ISFJ = 0;
		int INTP = 0;
		int ISFP = 0;
		int ESTJ = 0;
		int ENFJ = 0;
		int ENTP = 0;
		int max = 0;
		int index = 0;

		// 내가 선택한 키워드에 상응하는 mbti db에서 가져온 뒤 my_mbti에 하나하나 저장
		for (int i = 0; i < my_keyword.length; i++) {
			my_mbti.addAll(dao.my_mbti(my_keyword[i]));

			System.out.print(dao.my_mbti(my_keyword[i]) + " ");
		}

		// 가장 많이 들어있는 mbti 찾기
		for (int i = 0; i < my_mbti.size(); i++) {

			if (my_mbti.get(i).equals("INFP")) {
				INFP++;
			}
			if (my_mbti.get(i).equals("ENFP")) {
				ENFP++;
			}
			if (my_mbti.get(i).equals("ESTP")) {
				ESTP++;
			}
			if (my_mbti.get(i).equals("INTJ")) {
				INTJ++;
			}
			if (my_mbti.get(i).equals("ISTP")) {
				ISTP++;
			}
			if (my_mbti.get(i).equals("ENTJ")) {
				ENTJ++;
			}
			if (my_mbti.get(i).equals("INFJ")) {
				INFJ++;
			}
			if (my_mbti.get(i).equals("ESFP")) {
				ESFP++;
			}
			if (my_mbti.get(i).equals("ISTJ")) {
				ISTJ++;
			}
			if (my_mbti.get(i).equals("ESFJ")) {
				ESFJ++;
			}
			if (my_mbti.get(i).equals("ISFJ")) {
				ISFJ++;
			}
			if (my_mbti.get(i).equals("INTP")) {
				INTP++;
			}
			if (my_mbti.get(i).equals("ISFP")) {
				ISFP++;
			}
			if (my_mbti.get(i).equals("ESTJ")) {
				ESTJ++;
			}
			if (my_mbti.get(i).equals("ENFJ")) {
				ENFJ++;
			}
			if (my_mbti.get(i).equals("ENTP")) {
				ENTP++;
			}
		}

		int[] mbticnt = { INFP, ENFP, ESTP, INTJ, ISTP, ENTJ, INFJ, ESFP, ISTJ, ESFJ, ISFJ, INTP, ISFP, ESTJ, ENFJ,
				ENTP };
		String[] mbti = { "INFP", "ENFP", "ESTP", "INTJ", "ISTP", "ENTJ", "INFJ", "ESFP", "ISTJ", "ESFJ", "ISFJ",
				"INTP", "ISFP", "ESTJ", "ENFJ", "ENTP" };

		for (int i = 0; i < mbticnt.length; i++) {

			if (max <= mbticnt[i]) {
				max = mbticnt[i];
				index = i;
			}
		}

		for (int i : mbticnt) {
			System.out.print(i + " ");
		}
		System.out.println(max);
		System.out.println(mbti[index]);

		int cnt = dao.mbtiupdate(mbti[7], m_id);

	

		if (cnt > 0) {
			System.out.println("키워드 입력 성공");
		} else {
			System.out.println("키워드 입력 실패");
		}

		session.setAttribute("my_keyword", my_keyword);
		session.setAttribute("mbti", mbti[7]);
		// keyword_result 창으로 이동
		response.sendRedirect("keyword_result.jsp");
	}

}
