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
<meta charset="utf-8" />
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
               

				<!-- Main -->
					<div id="main">
					
					<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="30days_check.html">하루에 재채기 3번 연속으로하기</a></h2>
										<p>여기에는 기간을 적을까요?</p>
									</div>
									
								</header>
								<a href="30days_check.html" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
								<p>사진을 눌러보세요! 인증하는 페이지가 뜰거예요! 푸항항 아직 안 만들었어요~ 기다려주세요 꺄항향</p>
								
							</article>

						<!-- Post -->
							<article class="post">
							
								<header>
									<div class="title">
									
										<h2>30days</a></h2>
										<p>30일동안 나만의 챌린지를 시작해보아요!</p>
									</div>
									
								</header>
								<a href="30days.html" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
								<p>여러분은 스스로를 게으르다고 생각하시나요? 아뇨 저희 페이지까지 찾아오신 거 보면 여러분은 정말 부지런하고 성실하고 착하고 성품좋으신 사람들이에요 꺄하항
								하지만 그런 자신을 조금 더 체계적으로 관리를 하면 어떨까요? 여기서 자신의 습관을 길들여보세요! 그리고 되도록이면 실패하셔서 저희에게 기부를 해주세요 감사합니다:)
								아참! 위에 사진을 눌러보세요! 새로운 페이지가 뜰거예요! 거기에 있는 계좌번호로 후원 부탁드립니다:)</p>
								
							</article>

						

						<!-- Post -->
							<article class="post">
							
								<header>
									<div class="title">
									
										<h2>30days</a></h2>
										<p>30일동안 나만의 챌린지를 시작해보아요!</p>
									</div>
									
								</header>
								<a href="30days.html" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
								<p>하잉:) 여기까지 내려왔다면 당신은 정말 착실하고 인성좋고 체계적인 사람이에요 짝짝짝 그런 김에 습관 하나 더 만들어 보는 건 어떠세요? 푸항
								여기까지 오셨으니까 재밌는 이야기 해드릴게요! 이 위에 이미지를 클릭하면 계좌번호가 나올거예요! 웃기죠? 푸항항 진짜 웃긴 이야기 해드릴게요
								사실은 저희 챌린지 4개까지 할 수 있게 했는데 귀찮기도 하고 안 예쁘기도 해서 3개로 하기로 했어요~~ 여러분도 좋으시죠? 꺄항항  </p>
								
							</article>
							
							

					
					
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
									<li>
										<article>
											<header>
												<h3><a href="30days_check.html">하루에 재채기 3번 연속으로 하기</a></h3>
												<time class="published" datetime="2015-10-20">October 20, 2015</time>
											</header>
											<a href="30days_check.html" class="image"><img src="images/pic08.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="30days.html">새로운 챌린지를 추가해보세요!</a></h3>
												<time class="published" datetime="2015-10-15">October 15, 2015</time>
											</header>
											<a href="30days.html" class="image"><img src="images/pic09.jpg" alt="" /></a>
										</article>
									</li>
									<li>
										<article>
											<header>
												<h3><a href="30days.html">새로운 챌린지를 추가해보세요!</a></h3>
												<time class="published" datetime="2015-10-10">October 10, 2015</time>
											</header>
											<a href="30days.html" class="image"><img src="images/pic10.jpg" alt="" /></a>
										</article>
									</li>
									
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