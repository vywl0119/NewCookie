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
<body class="is-preload">
<%
   
   // 로그인한 닉네임 가져오기
   MemberDTO info = (MemberDTO)session.getAttribute("info");
   QnADAO dao = new QnADAO();
   ArrayList<QnADTO> qna_list = new ArrayList<QnADTO>();
   qna_list = dao.showQnA();
   
   int cnt = dao.date();
   
   String today[] = dao.today();
   
   ArrayList<QnADTO> my_qnalist = new ArrayList<QnADTO>();
   

   if(info != null){
      my_qnalist = dao.showmy_QnA(info.getM_id());
   }
   
   
%>
      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Header -->
               <header id="header">
                  <h1><a href="main.jsp">OBO Diary</a></h1>
                  <nav class="links">
                     <ul>
                      <li><a href="#">달력</a></li>
                            <li><a href="#">Q&A</a></li>
                            <li><a href="30days.jsp">30 Days</a></li>
                               <li><a href="#">자기소개서</a></li>
                            <li><a href="#">키워드</a></li>
                              <li><a href="#">릴레이</a></li>
                              
                     </ul>
                  </nav>
                  
               </header>
               
               


            <!-- Menu -->
               <section id="menu">

                  <!-- Search -->
                     <section>
                        <form class="search" method="get" action="#">
                           <input type="text" name="query" placeholder="Search" />
                        </form>
                     </section>

                  <!-- Links -->
                     <section>
                        <ul class="links">
                           <li>
                              <a href="#">
                                 <h3>Lorem ipsum</h3>
                                 <p>Feugiat tempus veroeros dolor</p>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <h3>Dolor sit amet</h3>
                                 <p>Sed vitae justo condimentum</p>
                              </a>
                           </li>
                           <li>
                              <a href="#">
                                 <h3>Feugiat veroeros</h3>
                                 <p>Phasellus sed ultricies mi congue</p>
                              </a>
                           </li>
                           
                           <li>
                              <a href="#">
                                 <h3>Etiam sed consequat</h3>
                                 <p>Porta lectus amet ultricies</p>
                              </a>
                           </li>
                        </ul>
                     </section>

                  <!-- Actions -->
                     <section>
                        <ul class="actions stacked">
                           <li><a href="#" class="button large fit">Log In</a></li>
                        </ul>
                     </section>

               </section>

            <!-- Main -->
               <div id="main">

                  <!-- Post -->
                     <article class="post">
                        <header>
                           <div class="title">
                              
                              <h2><%=qna_list.get(cnt).getMain()%></h2>
                              <% if(qna_list.get(cnt).getSub()!=null){%>
                              
                                          <p><%=qna_list.get(cnt).getSub()%> </p>
                                 
                                       <%}else{ %>
                                          <p></p>
                                       <%} %>
                              
                           </div>
                           <div class="meta">
                              <a href="single.html"><%=qna_list.get(cnt).getNumber() %></a>
                              <time class="published"  style="margin-top: 70px; datetime="2015-11-01"><%=today[1]%> <%=today[2]%>, <%=today[0]%></time>
                              <a href="#" class="author"><span  class="name">1번째  <%=today[1]%>월</span></a>
                           </div>
                        </header>
                        <form action = "MyQnAServiceCon" mthod ="post" accept-charset="EUC-KR">
                        <table>
                        <tr>
                        <td> <input type="text"  name="answer" ></td>
                        </tr>
                        </table>
                        
                        <footer>
                           <ul class="actions">
                              <li> <input style="margin-left: 390px;  class="button large" type="submit" id="btn_login" value="제출하기"> </li>
                           </ul>
                           
                        </footer>
                        </form>
                     </article>

                  <!-- Post -->
                  
                  <%if(info != null) {  %>
                     <article class="post">
                        <header>
                           <div class="title">
                              
                              <h2><%=my_qnalist.get(0).getMain() %></h2>
                              <%if(my_qnalist.get(0).getSub() != null){ %>
                                 <p><%=my_qnalist.get(0).getSub() %></p>
                              <%}else{ %>
                                 <p></p>
                              <%} %>
                              
                           </div>
                           <div class="meta">
                              <a href="single.html"><%=my_qnalist.get(0).getNumber() %></a>
                              <time class="published"  style="margin-top: 70px; datetime="2015-11-01">07 26, 2021</time>
                              <a href="#" class="author"><span  class="name">1번째  7월</span></a>
                           </div>
                        </header>
                        <a href="single.html" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
                        <p><%=my_qnalist.get(0).getQ_answer() %> </p>
                        <footer>
                           <ul class="actions">
                              <li><a   style="margin-left: 390px; href="single.html" class="button large">수정하기</a></li>
                           </ul>
                           
                        </footer>
                     </article>
                  <%}else{ %>
                     <article class="post">
                           <header>
                              <div class="title">
                                 
                                 <h2>당신은 친구에게 얼마나 돈을 빌려주실 수 있나요?</h2>
                                 <p>오늘 친구에게 빌려줄 수 있는 금액은?</p>
                                 
                              </div>
                              <div class="meta">
                                 <a href="single.html">질문번호</a>
                                 <time class="published"  style="margin-top: 70px; datetime="2015-11-01">07 26, 2021</time>
                                 <a href="#" class="author"><span  class="name">1번째  7월</span></a>
                              </div>
                           </header>
                           <a href="single.html" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
                           <p>유저의 답변을 받아 적는 곳이에요. </p>
                           <footer>
                              <ul class="actions">
                                 <li><a   style="margin-left: 390px; href="single.html" class="button large">수정하기</a></li>
                              </ul>
                              
                           </footer>
                        </article>
                  <%} %>
                  <!-- Post -->
                     <article class="post">
                        <header>
                           <div class="title">
                              
                              <h2>당신은 친구에게 얼마나 돈을 빌려주실 수 있나요?</h2>
                              <p>오늘 친구에게 빌려줄 수 있는 금액은?</p>
                              
                           </div>
                           <div class="meta">
                              <a href="single.html">질문번호</a>
                              <time class="published"  style="margin-top: 70px; datetime="2015-11-01">07 26, 2021</time>
                              <a href="#" class="author"><span  class="name">1번째  7월</span></a>
                           </div>
                        </header>
                        <a href="single.html" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
                        <p>유저의 답변을 받아 적는 곳이에요. </p>
                        <footer>
                           <ul class="actions">
                              <li><a   style="margin-left: 390px; href="single.html" class="button large">수정하기</a></li>
                           </ul>
                           
                        </footer>
                     </article>

               

                  <!-- Pagination -->
                     <ul style="margin-left: 440px; margin-TOP: 90px;" class="actions pagination">
                        <li><a href="#" class="button large next">MORE</a></li>
                     </ul>

               </div>

            <!-- Sidebar -->
               <section id="sidebar">

                  <!-- Intro -->
                     <section id="intro">
                        <a href="#" class="logo"><img src="images/logo.jpg" alt="" /></a>
                        <header>
                        
                        <% if(info==null){%>
                           <form action="LoginServiceCon" method = "post" accept-charset="EUC-KR">
                                     <input width="300px" placeholder="ID를 입력하세요." style="margin-top: 2px;" type="text" id="id" name="id" >
                                     <br>
                                     <input placeholder="PW를 입력하세요." style="margin-top: 2px;" type="password" id="pw" name="pw"> 
                                     <br>
                                    <input style="width:410px"  type="submit" id="btn_login" value="로그인">
                                      <a href="#"  style="font-size: 2px"> 아이디 찾기   </a> <a href="#"  style="margin-left: 10px; font-size: 2px"> 비밀번호 찾기  </a>
                                      <a href="join.html"  style="margin-left: 10px; font-size: 2px"> 회원가입  </a>
                  
                               </form>
                        <%}else{ %>
                        
                        
                        
                        
                           <h2><%=info.getNickname() %>, 님<br>어서오세요</h2>
                           <p>오늘도  <a href="http://html5up.net"> OBO Diary</a>를 찾아주셔서 감사합니다.</p>
                             <a  href="LogoutServiceCon"  style="font-size: 4px; margin-left:350px"> 로그아웃    </a>
                        <%} %>
                        </header>
                     </section>

                  <!-- Mini Posts -->
                     <section>
                        <div class="mini-posts">

                           <!-- Mini Post -->
                              <article class="mini-post">
                                 <header>
                                    <h3><a href="single.html">프로필 수정</a></h3>
                                    <time class="published" datetime="2015-10-20">October 20, 2015</time>
                                    <a href="#" class="author"><img src="images/avatar.jpg" alt="" /></a>
                                 </header>
                                 <a href="single.html" class="image"><img src="images/pic04.jpg" alt="" /></a>
                              </article>

                           <!-- Mini Post -->
                              <article class="mini-post">
                                 <header>
                                    <h3><a href="single.html">개인정보 수정</a></h3>
                                    <time class="published" datetime="2015-10-19">October 19, 2015</time>
                                    <a href="#" class="author"><img src="images/avatar.jpg" alt="" /></a>
                                 </header>
                                 <a href="single.html" class="image"><img src="images/pic05.jpg" alt="" /></a>
                              </article>

                        
                        </div>
                     </section>

                  <!-- Posts List -->
                     <section>
                        <ul class="posts">
                        <%if(info != null){
                           for(int i = my_qnalist.size()-1; i >= my_qnalist.size()-5; i--){ %>
                        
                              <li>
                                 <article>
                                    <header>
                                       <h3><a href="single.html"><%=my_qnalist.get(i).getMain() %></a></h3>
                                       <time class="published" datetime="2015-10-20"><%=my_qnalist.get(i).getQ_date() %></time>
                                    </header>
                                    <a href="single.html" class="image"><img src="images/pic08.jpg" alt="" /></a>
                                 </article>
                              </li>
                        <%}}else{ %>
                           <li>
                              <article>
                                 <header>
                                    <h3><a href="single.html">최근에 작성한 글의 질문1</a></h3>
                                    <time class="published" datetime="2015-10-20">October 20, 2015</time>
                                 </header>
                                 <a href="single.html" class="image"><img src="images/pic08.jpg" alt="" /></a>
                              </article>
                           </li>
                           
                           <li>
                              <article>
                                 <header>
                                    <h3><a href="single.html">최근에 작성한 글의 질문2</a></h3>
                                    <time class="published" datetime="2015-10-15">October 15, 2015</time>
                                 </header>
                                 <a href="single.html" class="image"><img src="images/pic09.jpg" alt="" /></a>
                              </article>
                           </li>
                           <li>
                              <article>
                                 <header>
                                    <h3><a  href="single.html">최근에 작성한 글의 질문3</a></h3>
                                    <time class="published" datetime="2015-10-10">October 10, 2015</time>
                                 </header>
                                 <a href="single.html" class="image"><img src="images/pic10.jpg" alt="" /></a>
                              </article>
                           </li>
                           <li>
                              <article>
                                 <header>
                                    <h3><a href="single.html">최근에 작성한 글의 질문4</a></h3>
                                    <time class="published" datetime="2015-10-08">October 8, 2015</time>
                                 </header>
                                 <a href="single.html" class="image"><img src="images/pic11.jpg" alt="" /></a>
                              </article>
                           </li>
                           <li>
                              <article>
                                 <header>
                                    <h3><a href="single.html">최근에 작성한 글의 질문5</a></h3>
                                    <time class="published" datetime="2015-10-06">October 7, 2015</time>
                                 </header>
                                 <a href="single.html" class="image"><img src="images/pic12.jpg" alt="" /></a>
                              </article>
                           </li>
                        <%} %>
                        </ul>
                     </section>

                  <!-- About -->
                     <section class="blurb">
                        <h2>About</h2>
                        <p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at phasellus sed ultricies.</p>
                        <ul class="actions">
                           <li><a href="#" class="button">Learn More</a></li>
                        </ul>
                     </section>

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