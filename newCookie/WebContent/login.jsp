<%@page import="com.model.KeywordDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css_newMain/main.css" />
</head>
<style>
      #wrapper{width: 800px; !important }
      
</style>
<body class="single is-preload">
<%

MemberDTO info = (MemberDTO)session.getAttribute("info");
KeywordDAO kdao = new KeywordDAO();
String mbti = null;
String url = request.getParameter("url");

if(info != null){
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

            
            <!-- Main -->
               <div id="main">

                  <!-- Post -->
                     <article class="post">
                        <header>
                           <div class="title" align="center">
                              <h2><a href="#">OBO Diary</a></h2>
                              <h3>LOGIN</h3>
                           </div>
                           
                        </header>
                        <form  action="LoginServiceCon" method = "post" accept-charset="EUC-KR" align="center">
                        	아이디<input type="text" name="id" placeholder="아이디를 입력해주세요" ><br>
                        	비밀번호<input type="password" name="pw" placeholder="비밀번호를 입력해주세요"><br><br>
                        	<input type="hidden" value=<%=url%> name="url"> 
                        	<input type="submit"  value="login" onclick="alert('로그인 성공!')">
                        </form>
                     </article>

               </div>

            <!-- Footer -->
               <section id="footer">
                  <ul class="icons">
                     <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                     <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                     <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                     <li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
                     <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
                  </ul>
                  <p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
               </section>

         </div>

      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

   </body>
</html>