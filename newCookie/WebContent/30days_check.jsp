<%@page import="com.model.KeywordDAO"%>
<%@page import="com.model.ChallengeDTO"%>
<%@page import="com.model.ChallengeDAO"%>
<%@page import="com.model.QnADTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.QnADAO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css_newMain/main.css" />

</head>
   <body class="single is-preload" align="center">
<%
   
   // �α����� �г��� ��������
   MemberDTO info = (MemberDTO)session.getAttribute("info");
	KeywordDAO kdao = new KeywordDAO();
	String mbti = null;
   ChallengeDAO c_dao = new ChallengeDAO();
   ArrayList<ChallengeDTO> challenge_list = new ArrayList<ChallengeDTO>();
   
   if(info != null){
      challenge_list = c_dao.today_challenge(info.getM_id());
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


            <!-- Main -->
               <div id="main">

                  <!-- Post -->
                     <article class="post">
               <form action="Challenge_gogoServiceCon" method = "post" accept-charset="EUC-KR" enctype="multipart/form-data" >
                        <header align ="center">
                           <div class="title">
                              <h2><a href="#">OBO Diary</a></h2>
                              <p>30 days</p>
                              <p>���� ç������ �������ּ���:)</p>
                           </div>
                           
                        </header>
                        
                           <div id = "board">
            <table id="list">
               
               <tr>
                  
                  <td>
                  <select id="challenge" name="c_number" aria-label="�ݾ�">
                                      <option value="" selected="ç������ �������ּ��� :)">ç������ �������ּ��� :)</option>
                                        <%for(int i = 0; i < challenge_list.size(); i++){ %>
                                           <option value=<%=challenge_list.get(i).getC_number() %>><%=challenge_list.get(i).getHabit() %></option>
                                        <%} %>
             
                                        
                        </select> 
                        </td>
               </tr>
               <tr>
                  <td colspan="2">����</td>
               </tr>
               <tr>
                  <td colspan="2">
                     <input  type="file" name="fileName" style="float: right;">
                     
                     <textarea name="content" rows="10" style="resize: none;"  placeholder="������ �ڽſ��� ������ �޽����� ���ܺ�����:)" ></textarea>         
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <input type="reset" value="�ʱ�ȭ" onclick="alert('�ʱ�ȭ ����!')">
                     <input type="submit" value="�����ϱ�" onclick="alert('���� ����!')">
                  </td>
               </tr>
            </table>
            </form>
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

</body>
</html>