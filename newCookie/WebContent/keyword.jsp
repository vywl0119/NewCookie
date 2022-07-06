<%@page import="com.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.KeywordDAO"%>
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
<style>
label{ display:inline-block; width:210px; line-height:50px; }



</style>
</head>
<body class="single is-preload">
<%
   KeywordDAO dao = new KeywordDAO();
   MemberDTO info = (MemberDTO)session.getAttribute("info");
   ArrayList<String> keyword_list = dao.keyword(); 
  
   String mbti = null;

 if(info != null){
    mbti = dao.idmbti(info.getM_id());
 }
  

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
                              <h3>Ű���� ���� �˻�</h3>
                           </div>
                           
                        </header>
                        
                        <%if(info == null){ %>
                          
                           
                            <article class="post">
                     
                        <header>
                           <div class="title" align="center">
                           
                              <h2>���� �ڽŰ� ����� �� ���� Ű������� �������ּ��� :)</h2>
                              <p></p>
                           </div>
                           
                        </header>
                        
                        <fieldset align = "center">
                        <%for (int i = 0; i < 30; i++){ %>
                              <input type="checkbox"  name="keyword" id=<%=keyword_list.get(i) %> value=<%=keyword_list.get(i) %> onclick="return false;"> <label for=<%=keyword_list.get(i) %>><%=keyword_list.get(i) %></label> 
                        <%} %>
                          
                              <br><br><br>
                              
                              <p>�α����� �ϼž� ����Ͻ� �� �ֽ��ϴ� :)</p>
                                            
                           </fieldset>
                           <section>
                              <ul class="actions stacked">
                                 <li><a href="login.jsp?url=keyword.jsp" 
                                 style="background-color : rgba(160, 160, 160, 0.095); " class="button large fit" >Log In</a></li>
                              </ul>
                           </section>
                        </form>
                        
                     </article>
                     
                     
                           
                           
                        <%}else{ %>
                           
                           
                            <article class="post">
                     
                        <header>
                           <div class="title" align="center">
                           
                              <h2><%=info.getNickname() %>�԰� ���� ����� �� ���� Ű������� �������ּ��� :)</h2>
                              <p></p>
                           </div>
                           
                        </header>
                        <form action="KeywordServiceCon" method="post">
                        <fieldset align = "center">
                        <%for (int i = 0; i < keyword_list.size(); i++){ %>
                              <input type="checkbox"  name="keyword" id=<%=keyword_list.get(i) %> value=<%=keyword_list.get(i) %>> <label for=<%=keyword_list.get(i) %>><%=keyword_list.get(i) %></label> 
                        <%} %>
                          
                              <br><br><br><br><br>
                              <br>
                              <input type="submit" value = "�����ϱ�" onclick="alert('�ð� �������ּż� �����մϴ� :)')">               
                           </fieldset>
                        </form>
                        
                     </article>
                     
                     
                        <%} %>
                              
                            
                        
                        
                        
                              
                              
                              
                              
                              
                              
                       
                        
                           
                        
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