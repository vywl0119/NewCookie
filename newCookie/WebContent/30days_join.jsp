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
	
	 
	
	<script type="text/javascript">
	
		function selEmail(email){
			if(email != "직접입력"){
				document.getElementById("field").value = email;
				document.getElementById("field").readOnly = true;
			}else{
				document.getElementById("field").readOnly = false;
				document.getElementById("field").value = "";
		                document.getElementById("field").focus();
			}
		}
	
	
	</script>

</head>
   <body class="single is-preload" align="center">
<%
	
	MemberDTO info = (MemberDTO)session.getAttribute("info");
	KeywordDAO kdao = new KeywordDAO();
	String mbti = null;
	
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
                     
                     
                     <%if(mbti != null){ %>
                               <li><a href="keyword_result.jsp">나에게 맞는 자소서 찾기</a></li>
                            <%}else{ %>
                                <li><a href="keyword.jsp">나에게 맞는 자소서 찾기</a></li>
                            <%} %>
                            <li><a href="QNA.jsp">나에 대한 질문과 답</a></li>
                            <li><a href="info.jsp">자기소개서</a></li>
                            <li><a href="30days.jsp">30 Days</a></li>
                    
                           
                             
                              
                     </ul>
                  </nav>
                  
               </header>


            <!-- Main -->
               <div id="main">

                  <!-- Post -->
                     <article class="post">
	                     <form action="ChallengeServiceCon" method = "post" accept-charset="EUC-KR">
		                        <header align ="center">
		                           
		                           <div class="title">
		                              <h2><a href="#">OBO Diary</a></h2>
		                              <p>30 days</p>
		                              <p>관리자 계좌번호 : 302-40039629-81</p>
		                           </div>
		                           
		                        </header>
		                        
		                        
		                       		 금액
		                        <select id="money" name="money" aria-label="금액">
		                            <option value="" selected="금액을 선택해주세요.">금액을 선택해주세요</option>
		                            <option value="1000">1,000원</option>
		                            <option value="5000">5,000원</option>
		                            <option value="10000">10,000원</option>
		                            <option value="30000">30,000원</option>
		                        	<option value="50000">50,000원</option>         
		                        </select>
		                        
		                         <br><br>

								  목표 습관
								  
								<input type="text" name="field" id="field" onfocus="inInput(this)" onblur="outInput(this)"/>
								<select onfocus="inInput(this)" onblur="outInput(this)" onChange="selEmail(this.value)">
								
									<option value="" selected="습관을 선택해주세요.">습관을 선택해주세요</option>
									<option onselect="focus">직접입력</option>
									<option value="5시간 공부하기">5시간 공부하기</option>
									<option value="1시간 운동하기">1시간 운동하기</option>
									<option value="7시에 일어나기">7시에 일어나기</option>									
								</select>	                         		


		                        <br><br>
		                        
		                        	시작날짜
		                         <input type="date" name="start"  align="center">
		                          
		                        	종료날짜
		                         <input type="date" name="end"  align="center">
		                          <br><br><br>
		                          
		                         	 환급계좌번호
		                         <input type="text" name="account" placeholder="계좌번호를 입력해주세요." align="center">
		                          <br><br>

		                        <input type="submit" value="DONE!" onclick="alert('챌린지 등록 성공!')">
	                        </form>
	                        
                        <br><br><br>
                        
                        


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