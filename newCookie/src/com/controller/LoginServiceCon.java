package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;


@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("EUC-KR");
      
      // email, pw, name, tel, address 받아오기
      String m_id = request.getParameter("id");
      String m_pw = request.getParameter("pw");
      
      System.out.println("id : "+ m_id);
      System.out.println("pw : "+ m_pw);
      
      
      MemberDAO dao = new MemberDAO();
      MemberDTO info = dao.login(m_id, m_pw);
      
      if(info != null) {
         System.out.println("로그인 성공");
         HttpSession session = request.getSession();
         session.setAttribute("info", info);
      }else {
         System.out.println("로그인 실패");
      }
      
      response.sendRedirect("main.jsp");
   }

}