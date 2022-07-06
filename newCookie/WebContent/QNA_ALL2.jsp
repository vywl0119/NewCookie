<%@page import="com.model.KeywordDAO"%>
<%@page import="com.model.QnADTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.QnADAO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>

<html>
   <head>
      <title>Future Imperfect by HTML5 UP</title>
      <meta charset="EUC-KR" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css_newMain/main.css" />
      
   </head>
   <body class="is-preload">
<%
   
   // 로그인한 닉네임 가져오기
   MemberDTO info = (MemberDTO)session.getAttribute("info");
   QnADAO dao = new QnADAO();
   ArrayList<QnADTO> qna_list = new ArrayList<QnADTO>();
   qna_list = dao.showQnA();
   KeywordDAO kdao = new KeywordDAO();
   String mbti = null;
   
   int cnt = dao.date();
   
   String today[] = dao.today();
   String today_answer = null;

   
   
   ArrayList<QnADTO> my_qnalist = new ArrayList<QnADTO>();
   

   if(info != null){
      today_answer  = dao.answer(info.getM_id(),qna_list.get(cnt).getNumber());
      my_qnalist = dao.showmy_QnA(info.getM_id());
      mbti = kdao.idmbti(info.getM_id());
   }
   
   
%>
      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Header -->
               <header id="header">
                  <h1><a href="main.jsp">OBO Diary</a></h1>
                  <nav class="links">
                     <ul>
                     		<li><a href="Calender.jsp">달력</a></li>
                            <li><a href="QNA.jsp">Q&A</a></li>
                            <li><a href="30days.jsp">30 Days</a></li>
                            <li><a href="info.jsp">자기소개서</a></li>
                            <%if(mbti != null){ %>
                            	<li><a href="keyword_result.jsp">키워드</a></li>
                            <%}else{ %>
                             	<li><a href="keyword.jsp">키워드</a></li>
                            <%} %>
                             
                              
                     </ul>
                  </nav>
                  
               </header>
               
               


            <!-- Menu -->


            <!-- Main -->
               <div id="main">
               <article class="post"  style="margin-bottom: 0px;">
                    
                        <header align ="center">
                           <div class="title">
                              <h2><a href="main.jsp">OBO Diary</a></h2>
                              <h3><a href="QNA_ALL">[ QNA 보관함  ]</a></h3>
                              <h3><%=info.getNickname() %>님의 지난 QNA를 보관하고 있어요. </h3>
                           </div>
                           
                        </header>
                 </article>
               
                  <!-- Post -->
                    <%if(info != null){%>
                       <article class="post" style= align=center>
	                       
	                              <h1 style="margin-top: 10px;" align=center><%=my_qnalist.get(15).getMain() %></h1>
	                    
	                                 
	                     <div class="jb-text">      
	                        <p align=center><%=my_qnalist.get(15).getQ_answer() %></p>
	                     </div>
	                     
	                     </article>
	                     
	                     
                       <article class="post" style= align=center>
	                      
	                         
	                              <h1 style="margin-top: 10px;" align=center><B><%=my_qnalist.get(14).getMain() %></B></h1>
	                        
	                                 
	                     <div class="jb-text">      
	                        <p align=center><%=my_qnalist.get(14).getQ_answer() %></p>
	                     </div>
	                     
	                     </article>
	                     
	                     <article class="post" style= align=center>
	                       
	                              <h1 style="margin-top: 10px;" align=center><%=my_qnalist.get(11).getMain() %></h1>
	                      
	                                 
	                     <div class="jb-text">      
	                        <p align=center><%=my_qnalist.get(11).getQ_answer() %></p>
	                     </div>
	                     
	                     </article>
	                     
	                     
                     <%}%>
                     
         </div>

         

      

      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

   </body>
</html>