package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.InfoDAO;

@WebServlet("/DeleteOneServiceCon")
public class DeleteOneServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		int icnt = 0;
		int scnt = 0;
		int lcnt = 0;
		String title = request.getParameter("title");

		System.out.println("삭제할 자소서 고유 제목 :   " + title);

		InfoDAO dao = new InfoDAO();

		lcnt = dao.deletelisence(title);
		scnt = dao.deleteschool(title);
		if (lcnt > 0 && scnt > 0) {
			System.out.println("학교랑 라이센스 삭제 성공");
			icnt = dao.deleteitd(title);
		}
		if (icnt > 0) {
			System.out.println("itd삭제 성공");
		}

		if (icnt > 0 && scnt > 0 && lcnt > 0) {
			System.out.println("자소서 삭제 성공");
		}
		response.sendRedirect("info.jsp");
	}

}
