package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.InfoDAO;
import com.model.InfoDTO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/InfoServiceCon")
public class InfoServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		int icnt = 0;
		int scnt = 0;
		int lcnt = 0;

		String savePath = request.getServletContext().getRealPath("infoimg");
		System.out.println(savePath);

		int maxSize = 5 * 1024 * 1024;

		String encoding = "EUC-KR";

		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,
				new DefaultFileRenamePolicy());

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");

		String m_id = info.getM_id();
		String title = multi.getParameter("title");

		String q1 = multi.getParameter("q1");
		String a1 = multi.getParameter("a1");
		String q2 = multi.getParameter("q2");
		String a2 = multi.getParameter("a2");
		String q3 = multi.getParameter("q3");
		String a3 = multi.getParameter("a3");
		String q4 = multi.getParameter("q4");
		String a4 = multi.getParameter("a4");
		String filename = URLEncoder.encode(multi.getFilesystemName("filename"), "EUC-KR");

		String school = multi.getParameter("school");
		String g_date = multi.getParameter("gdate");

		String lisence = multi.getParameter("lisence");
		String getdate = multi.getParameter("getdate");
		String place = multi.getParameter("place");

		InfoDAO dao = new InfoDAO();

		InfoDTO dto = new InfoDTO(filename, m_id, title, q1, a1, q2, a2, q3, a3, q4, a4);
		InfoDTO sdto = new InfoDTO(m_id, title, school, g_date);
		InfoDTO ldto = new InfoDTO(m_id, title, lisence, getdate, place);

		icnt = dao.itdinsert(dto);
		if (icnt > 0) {
			System.out.println("itd 가입 성공");
			scnt = dao.schoolinsert(sdto);
			lcnt = dao.lisenceinsert(ldto);

			if (scnt > 0) {
				System.out.println("school 가입 성공");
			}
			if (scnt < 1) {
				System.out.println("school 가입 실패");
			}
			if (lcnt > 0) {
				System.out.println("lisence 가입 성공");
			}
			if (lcnt < 1) {
				System.out.println("lisence 가입 실패");
			}

		} else {
			System.out.println("itd 가입 실패");
		}

		System.out.println(m_id + " " + title + " " + q1 + " " + a1 + " " + q2 + " " + a2 + " " + q3 + " " + a3 + " "
				+ q4 + " " + a4 + " " + school + " " + g_date + " " + lisence + " " + getdate + " " + place + " "
				+ filename);

		if (icnt > 0 && scnt > 0 && lcnt > 0) {
			System.out.println("자소서 기입 성공");
		} else {
			System.out.println("자소서 기입 실패");
		}
		response.sendRedirect("info.jsp");
	}

}
