<%@page import="com.model.KeywordDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css_newMain/main.css" />
<title>Insert title here</title>
<style type="text/css">
.actions stacked{
float: left;
}
</style>
</head>
<body class="single is-preload">
<% 
   MemberDTO info = (MemberDTO)session.getAttribute("info");
   ArrayList<String> key = new ArrayList<String>();
   
   String[] my_keyword = (String[])session.getAttribute("my_keyword");
   String mbti = (String)session.getAttribute("mbti");
   KeywordDAO dao = new KeywordDAO();
   ArrayList<String> sample_list = dao.sample(mbti);
   
%>
      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Header -->
               <header id="header">
                  <h1><a href="main.jsp">OBO Diary</a></h1>
                  <nav class="links">
                     <ul>
                           <%if(mbti != null){ %>
                               <li><a href="keyword_result.jsp">������ �´� �ڼҼ� ã��</a></li>
                            <%}else{ %>
                                <li><a href="keyword.jsp">������ �´� �ڼҼ� ã��</a></li>
                            <%} %>
                            <li><a href="QNA.jsp">���� ���� ������ ��</a></li>
                            <li><a href="info.jsp">�ڱ�Ұ���</a></li>
                            <li><a href="30days.jsp">30 Days</a></li>
                   
                             
                              
                     </ul>
                  </nav>
                  
               </header>

            <!-- Menu -->
               <section id="menu">

                  

               </section>

            <!-- Main -->
               <div id="main">

                  <!-- Post -->
                     <article class="post">
                        <header>
                           <div class="title" align="center">
                              <h2><a href="#">OBO Diary</a></h2>
                              <h3>Ű���� ���� �˻� ���</h3>
                           </div>
                           
                        </header>
                        
                        
                              
                              
                   
                              <br><br>
                  
                  <article class="post">
                           
                              <header>
                                 <div class="title" align="center" style="background-color : rgba(160, 160, 160, 0.075); ">
                                 
                                    <%if(info != null){ %>
                                    <h2><%=info.getNickname() %> ���� ������ Ű���� �Դϴ� :)</h2>
                                  <%}else{ %>
                                    <h2> ��Ű ���� ������ Ű���� �Դϴ� :)</h2>
                                  <%} %>
                                  
                                 </div>
                                 
                              </header>
                              <div align="center">
                              <%  for(int i = 0; i < my_keyword.length; i++){ %>
                                 / <%= my_keyword[i] %>
                              <%} %>
                             </div>
                              
                              
                           </article>
                  
                  
                  
                  
                  
                  
                             
                        
                         <%if(sample_list.size() > 0){ %>
                           <% for(int i = 0 ,j =1; i < sample_list.size() && j < sample_list.size(); i+=2, j+=2){ %>
                              <article class="post">
                           
                              <header>
                                 <div class="title" align="center" style="background-color : rgba(160, 160, 160, 0.075); ">
                                 
                                    <%if(info != null){ %>
                                    <h2><%=info.getNickname() %> �԰� ��︮��  �ڱ�Ұ��� �����Դϴ� :)</h2>
                                  <%}else{ %>
                                    <h2> ��Ű �԰� ��︮�� ù ��° �ڱ�Ұ��� �����Դϴ� :)</h2>
                                  <%} %>
                                  
                                 </div>
                                 
                              </header>
                              <p align=center><%=sample_list.get(i) %></p>
                              <p align=center><%=sample_list.get(j) %></p>
                              
                              
                           </article>
                     <%}}else{ %>
                        <article class="post">
                     
                        <header>
                           <div class="title" align="center">
                           
                              <h2>��Ű �԰� ��︮�� �� ��° �ڱ�Ұ��� �����Դϴ� :)</h2>
                              
                           </div>
                           
                        </header>
                        <p>����� �����? ����� ���ݰ� ��︮�� �ڱ�Ұ��� ���ô� �̰ſ���! Ǫ���� 
                        ��~ ������� ���� �� ���� ����� ������ �ְ� ���ϰ� �Ǹ��� �����ñ���? ������ �̰� ���� �ڱ�Ұ��� ���� �����Ƿ���? Ǫ��</p>
                        
                        
                     </article>
                     
                     
                     <%} %>
         
                     
                     
                     
                        <br><br><br>
                           <section>
                        <div class="actions stacked" align = center>
                           <a href="keyword.jsp" class="button" style="background-color : rgba(160, 160, 160, 0.075); " >�ٽ� �˻��ϱ�</a>
                          
                           <a href="info.jsp" class="button" style="background-color : rgba(160, 160, 160, 0.075); " >�ڱ�Ұ��� ��������</a>
                           
                       
                        </div>
                        
                              </section>
                              <br>
                        
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