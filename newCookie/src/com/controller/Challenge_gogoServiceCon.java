package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.ChallengeDAO;
import com.model.ChallengeDTO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/Challenge_gogoServiceCon")
public class Challenge_gogoServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);

		int maxSize = 5 * 1024 * 1024;

		String encoding = "EUC-KR";

		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,
				new DefaultFileRenamePolicy());

		// �씠誘몄� �깭洹몄뿉 寃쎈줉 �옉�꽦 �떆 16吏꾩닔濡� �쟻�뼱以섏빞�빐�꽌 �씤肄붾뵫 吏꾪뻾

		int c_number = Integer.parseInt(multi.getParameter("c_number"));

		String content = multi.getParameter("content");
		String fileName = URLEncoder.encode(multi.getFilesystemName("fileName"), "EUC-KR");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String m_id = info.getM_id();

		System.out.println("number : " + c_number);
		System.out.println("fileName : " + fileName);
		System.out.println("content : " + content);
		System.out.println("id: " + m_id);

		ChallengeDTO dto = new ChallengeDTO(c_number, m_id, fileName, content);
		ChallengeDAO dao = new ChallengeDAO();
		int cnt = dao.challengegogo(dto);

		if (cnt > 0) {
			System.out.println("챌린지 인증 성공");
		} else {
			System.out.println("챌린지 인증 실패");
		}
		response.sendRedirect("30days.jsp");

	}

}