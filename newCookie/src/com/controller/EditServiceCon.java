package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/EditServiceCon")
public class EditServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		String savePath = request.getServletContext().getRealPath("infoimg");
		System.out.println(savePath);

		int maxSize = 5 * 1024 * 1024;

		String encoding = "EUC-KR";

		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,
				new DefaultFileRenamePolicy());

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");

		String m_id = info.getM_id();
		String filename = URLEncoder.encode(multi.getFilesystemName("filename"), "EUC-KR");
		String nickname = multi.getParameter("nickname");
		String email = multi.getParameter("email");

		System.out.println("filename : " + filename);
		System.out.println("nickname : " + nickname);
		System.out.println("email : " + email);

		MemberDTO dto = new MemberDTO(m_id, nickname, email, filename);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.edit(dto);

		if (cnt > 0) {
			System.out.println("회원정보 수정 성공");
		} else {
			System.out.println("회원정보 수정 실패");
		}
		response.sendRedirect("main.jsp");

	}

}
