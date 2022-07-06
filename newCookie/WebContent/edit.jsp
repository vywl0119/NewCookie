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
<style type="text/css">
      #wrapper{width: 800px; !important }
      
      </style>
</head>
<body class="single is-preload">
<%
MemberDTO info = (MemberDTO)session.getAttribute("info");
KeywordDAO kdao = new KeywordDAO();
String mbti = null;

if(info != null){
	mbti = kdao.idmbti(info.getM_id());
}


%>
      <!-- Wrapper -->
         <form action="updateServiceCon" method = "post" accept-charset="EUC-KR">
         <div id="wrapper">

            <!-- Header -->
               <header id="header">
                  <h1><a href="main.jsp">OBO Diary</a></h1>
                  <nav class="links">
                     <ul>
                     		<li><a href="Calender.jsp">달력</a></li>
                            <li><a href="QNA.jsp">Q&A</a></li>
                            <li><a href="30days.jsp">30 Days</a></li>
                            <li><a href="info_main.jsp">자기소개서</a></li>
                            <%if(mbti != null){ %>
                            	<li><a href="keyword_result.jsp">키워드</a></li>
                            <%}else{ %>
                             	<li><a href="keyword.jsp">키워드</a></li>
                            <%} %>
                             
                              
                     </ul>
                  </nav>
                  
               </header>

            <!-- Main -->
               <div id="main" align="center">

                  <!-- Post -->
                     <article class="post">
                        <header>
                           <div class="title">
                              <h2 align ="center"><a href="#"> OBO Diary </a></h2>
                              <p align="center">개인 정보 수정</p>
                           </div>
                           
                        </header>
                        <!-- container -->
    <div id="container" role="main">
        <div id="content">
            <!-- tg-text=title -->
           
            <div class="update_content">
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    
                    <div class="update_row">
                    <h2>[ 비밀번호 변경 ]</h2>
                    <br><br><br>
                        <h3 class="update_title"><label for="pswd1">수정할 비밀번호 </label></h3>
                        <span class="ps_box int_pass" id="pswd1Img">
                     <input type="password" id="pswd1" name="pswd1" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                            <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
                  </span>
                        <span class="error_next_box" id="pswd1Msg" style="display:none" aria-live="assertive">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>
                  <br><br>
                        <h3 class="update_title"><label for="pswd2"> 비밀번호  확인</label></h3>
                        <span class="ps_box int_pass_check" id="pswd2Img">
                     <input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20">
                  </span>
                        <span class="error_next_box" id="pswd2Msg" style="display:none" aria-live="assertive"></span>
                        <br><br>
                          <div class="btn_area">
                    <input type="submit" id="btn_pw_update"class="button large next" value="비밀번호 수정">
                     <br><br><br><br><br><br>
                </div>
                    </div>
                </div>


                    <!-- lang = ko_KR -->
                    <div class="update_row">
                     <h2>[ 프로필 변경 ]</h2>
                      <br>
                      
     
    
</form>
 <br><br>
 </div>
                <div class="update_row update_mobile" id="mobDiv">

                    <h3 class="update_title"><label for="nickname">닉네임</label></h3>

                   

                   
                    <div class="int_mobile_area">

                  <span class="ps_box int_mobile">
                     <input type="text" id="nickname" name="nickname" placeholder="닉네임 입력" aria-label="닉네임 입력" class="int" maxlength="16">
                     <label for="nickname" class="lbl"></label>
                  </span>

               
                       <br><br>
                            </div>
                
                    <div class="update_row update_email">
                        <h3 class="update_title"><label for="gender">이메일</label></h3>
                     <input type="text" id="email" name="email" placeholder="이메일 입력" aria-label="이메일 입력" class="int" maxlength="100">
                  </span>
                    </div>
                    <span class="error_next_box" id="emailMsg" style="display:none" aria-live="assertive"></span>
                </div>
                <br><br>
                <div class="btn_area">
                    <input type="submit" id="btn_private_update"class="button large next" value="프로필 수정">
                    
                </div>
               <br><br>
               <br><br>
               <br><br>
               
            </div>
        </div>
    </div>
    <!-- // container -->
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
                  <p class="copyright">&copy; Cookie cookie: <a href="http://html5up.net">New Cookie</a>. 하잉: <a href="http://unsplash.com">/a>.</p>
               </section>

         </div>

      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
   </form>
   </body>

</html>