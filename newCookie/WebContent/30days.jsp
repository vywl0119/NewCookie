<%@page import="com.model.KeywordDAO"%>
<%@page import="com.model.ChallengeDAO"%>
<%@page import="com.model.ChallengeDTO"%>
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
      <link rel="stylesheet" href="assets/css_newMain/main.css" />
      <link href='fullcalendar/main2.css' rel='stylesheet' />
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
   
         <style type="text/css">
         
         
         .fc-daygrid-day-frame, .fc-daygrid-day-events,#div1, #div2, #div3, #div4{
            padding: 0px !important;
            margin: 0px !important;
         }
         .fc-daygrid-day-events{
            margin-top:0px !important;   
           
            width: 150px !important;
            height: 120px !important;
            /*  background-color: yellow !important; */
         }
         #div1 {
            margin-top:0px !important;   
            width: 140px !important;
            height: 50x !important;
            float: left !important;
         }
      
    .fc-daygrid-event-harness{
          }
         
         .fc-toolbar-chunk {
              display: flex; // 일렬로 나란히
              align-items: center; // 수직 가운데 정렬
            }
         
        
      </style>

        <script src='fullcalendar/main.js'></script>
        <script type="text/javascript">
     
        
        <%
        
        ChallengeDAO dao = new ChallengeDAO();
        
        ArrayList<ChallengeDTO> datephoto = new ArrayList<ChallengeDTO>();
       
        
         QnADAO dao1 = new QnADAO();
        
        String today[] = dao1.today();
        
        %>
            // ajax 비동기 통신 통해서 값을 가져와야함 DB 값
            $.ajax({
               url: "ChallengecheckServiceCon",
               type: "post",
               dataType: "text",
               success: function(data){
                  var txt = JSON.parse(data);
                   var calendarEl = document.getElementById('calendar1');

                    var calendar = new FullCalendar.Calendar(calendarEl, {
                       headerToolbar: {
                           left: 'prevYear,prev',
                           center: 'title',
                           right: 'next,nextYear',
                           color: '#ffdce5'
                     
                       },
                       eventClick: function(info) {
                           var eventObj = info.event;

                         },
                         
                         initialDate: '<%=today[0]%>-<%=today[1]%>-<%=today[2]%>',
                     
                         events:txt,
                         
                         eventContent: function(arg) {
                             console.log(arg.event.title);
                             
                             return {
                                  html:'<img style="width:110px;height:118px; " src="http://59.0.236.156:8083/getImg/'+arg.event.title+'"/>'
                              }
                           }
                      
                  });

                      

                    calendar.render();
         
               },
               error: function (request, status, error){
                  console.log(error)
               }
            });
         
        

             
         </script> 

<script type="text/javascript">
     
       
            // ajax 비동기 통신 통해서 값을 가져와야함 DB 값
            $.ajax({
               url: "ChallengecheckServiceCon02",
               type: "post",
               dataType: "text",
               success: function(data){
                  var txt = JSON.parse(data);
                   var calendarE2 = document.getElementById('calendar2');

                    var calendar = new FullCalendar.Calendar(calendarE2, {
                       headerToolbar: {
                           left: 'prevYear,prev',
                           center: 'title',
                           right: 'next,nextYear',
                           color: '#ffdce5'
                     
                       },
                       eventClick: function(info) {
                           var eventObj = info.event;

                         },
                         
                         initialDate: '<%=today[0]%>-<%=today[1]%>-<%=today[2]%>',
                     
                         events:txt,
                         
                         eventContent: function(arg) {
                             console.log(arg.event.title);
                             
                             return {
                                  html:'<img style="width:110px;height:118px; " src="http://59.0.236.156:8083/getImg/'+arg.event.title+'"/>'
                             }
                           }
                      
                  });

                      

                    calendar.render();
         
               },
               error: function (request, status, error){
                  console.log(error)
               }
            });
         
        

             
         </script> 
         
         
         <script type="text/javascript">
     
       
            // ajax 비동기 통신 통해서 값을 가져와야함 DB 값
            $.ajax({
               url: "ChallengecheckServiceCon03",
               type: "post",
               dataType: "text",
               success: function(data){
                  var txt = JSON.parse(data);
                   var calendarE3= document.getElementById('calendar3');

                    var calendar = new FullCalendar.Calendar(calendarE3, {
                       headerToolbar: {
                           left: 'prevYear,prev',
                           center: 'title',
                           right: 'next,nextYear',
                           color: '#ffdce5'
                     
                       },
                       eventClick: function(info) {
                           var eventObj = info.event;

                         },
                         
                         initialDate: '<%=today[0]%>-<%=today[1]%>-<%=today[2]%>',
                     
                         events:txt,
                         
                         eventContent: function(arg) {
                             console.log(arg.event.title);
                             
                             return {
                                  html:'<img style="width:110px;height:118px; " src="http://59.0.236.156:8083/getImg/'+arg.event.title+'"/>'
                             }
                           }
                      
                  });

                      

                    calendar.render();
         
               },
               error: function (request, status, error){
                  console.log(error)
               }
            });
         
        

             
         </script> 

</head>
<body class="is-preload">



<%

   // 로그인한 닉네임 가져오기
   MemberDTO info = (MemberDTO)session.getAttribute("info");
   KeywordDAO kdao = new KeywordDAO();
   String mbti = null;
   String[] start = null;
   String[] end = null;
   
   ArrayList<QnADTO> my_qnalist = new ArrayList<QnADTO>();
   ChallengeDAO c_dao = new ChallengeDAO();
   ArrayList<ChallengeDTO> challenge_list = new ArrayList<ChallengeDTO>();
   challenge_list = null;
   if(info != null){
       
       challenge_list = c_dao.today_challenge(info.getM_id());
       
       for(int i = 0; i < challenge_list.size(); i++ ){
          start = challenge_list.get(i).getStart_date().split(" ");
          end = challenge_list.get(i).getEnd_date().split(" ");
          mbti = kdao.idmbti(info.getM_id());
       }
   
    
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
               
               <%if(info != null && challenge_list.size() > 0){ 
                  for(int i = 0; i < challenge_list.size(); i++){%>
                     
                     
                     <article class="post">
                        <header>
                           <div class="title">
                               <h2><a href="30days_check.jsp"><%=challenge_list.get(i).getHabit() %></a></h2>
                              <p><%= challenge_list.get(i).getStart_date().substring(0, 10) %> ~ <%=challenge_list.get(i).getEnd_date().substring(0, 10)%></p>
                       <h4> <%=  c_dao.challenge_date(challenge_list.get(i).getEnd_date()) %>일 남았습니다 파이팅!!</h4>
                           </div>
               </header>
                        <article class="post" style="border: hidden" >
                      
                            <div id='calendar<%=i+1%>' style='box-sizing:none;'></div>
                       
                        <br><br><br>
                        
                     </article>
                        
                     </article>

                     
               <%} for(int i = challenge_list.size(); i < 3; i++){%>
                        <article class="post">
                     
                        
                           <div class="title">
                           
                              <h2><a href="30days_join.jsp">30days</a></h2>
                              <p><a href="30days_join.jsp">30일동안 나만의 챌린지를 시작해보아요!</a></p>
                              
                              
                           </div>
                           
                        
                        
                     </article>
               <%} %>
                     
               <%}else{ %>
                  
                           <div class="title">
                           
                              <h2>로그인 후 사용하실 수 있습니다 :)</a></h2>
                             
                           </div>
                       
                    
                  <%for(int i = 0; i < 3; i++){%>
                  
               
                     <article class="post">
                     
                        
                           <div class="title">
                           
                              <h2><a href="30days_join.jsp">30days</a></h2>
                              <p><a href="30days_join.jsp">30일동안 나만의 챌린지를 시작해보아요!</a></p>
                              
                           </div>
                           
                       
                        
                     </article>
                     
               
               <%}} %>
           
               
               
               </div>

          <!-- Sidebar -->
               <section id="sidebar">

                  <!-- Intro -->
                     <section id="intro">
                        <a style="width:400px" href="#" class="logo"><img style="width:200px; margin-left: 100px" src="images/logo.png" alt="" /></a>
                        <header>
                        
                        <% if(info==null){%>
                           <form  action="LoginServiceCon" method = "post" accept-charset="EUC-KR">
                           <br>
                           <br>
                                     <input width="300px" placeholder="ID를 입력하세요." style="margin-top: 2px;" type="text" id="id" name="id" >
                                     <br>
                                     <input placeholder="PW를 입력하세요." style="margin-top: 2px;" type="password" id="pw" name="pw">
                                     <input type="hidden" value="30days.jsp" name="url"> 
                                     <br>
                                    <input style="width:410px"  type="submit" id="btn_login" value="로그인">
                                     <a  href="join.html"  style="margin-left: 350px; margin-top:20px; font-size: 2px"> 회원가입  </a>
                  
                  
                               </form>
                        <%}else{ %>
                        
                           <h2 align = center><%=info.getNickname() %> 님<br>어서오세요</h2>
                           <p>오늘도  <a href="http://html5up.net"> OBO Diary</a>를 찾아주셔서 감사합니다.</p>
                           <a  href="editjsp"  style="font-size: 4px; margin-left: 250px;" > 개인정보수정    </a>
                             <a  href="LogoutServiceCon"  style="font-size: 4px; margin-left:30px"> 로그아웃    </a>
                        <%} %>
                        </header>
                     </section>

                  

                  <!-- Posts List -->
                     <section>
                        <ul class="posts">
                        <% if(info != null && challenge_list != null ){ %>
                           <%for(int i = 0; i <challenge_list.size(); i++){ %>
                              
                              <li>
                                 <article>
                                    <header>
                                       <h3><a href="30days_check.jsp"><%=challenge_list.get(i).getHabit() %></a></h3>
                                       <time class="published" datetime="2015-10-20"><%=challenge_list.get(i).getStart_date().substring(0, 10) %> ~ <%=challenge_list.get(i).getEnd_date().substring(0, 10)%></time>
                                    </header>
                                    <a href="30days_check.jsp" class="image"><img src="images/gogo.png" alt="" /></a>
                                 </article>
                              </li>                        
                           
                           <%} %>
                        

                           <%for(int i = challenge_list.size(); i < 3; i++){ %>
                              
                              <li>
                                 <article>
                                    <header>
                                       <h3><a href="30days_join.jsp">새로운 챌린지를 추가해보세요!</a></h3>
                                       <time class="published" datetime="2015-10-15">30일동안 습관을 길러보아요.</time>
                                    </header>
                                    <a href="30days_join.jsp" class="image"><img src="images/gogo.png" alt="" /></a>
                                 </article>
                              </li>                        
                           
                           <%} %>                           
                        <%}else{ %>
                           <%for(int i = 0; i < 3; i++){ %>
                              
                              <li>
                                 <article>
                                    <header>
                                       <h3><a href="30days_join.jsp">새로운 챌린지를 추가해보세요!</a></h3>
                                       <time class="published" datetime="2015-10-15">30일동안 습관을 길러보아요.</time>
                                    </header>
                                    <a href="30days_join.jsp" class="image"><img src="images/gogo.png" alt="" /></a>
                                 </article>
                              </li>                        
                           
                           <%} %>      
                        
                        
                        <%} %>   
            
                           
                        </ul>
                     </section>

                 <!-- About -->
                     <section class="blurb">
                        <h2>About</h2>
                        <h5>OBO Diary는 여러분의 취업에 도음을 주고자하여 만든 사이트 입니다. 여러분이 한 걸음 한 걸음 성장 할 수 있도록 옆에서 도와드릴게요! </h5>
                        <h6>사이트 사용에 대해 궁금한 점이 있다면 아래 버튼을 눌러주세요 :)</h6>
                        <br>
                        <ul class="actions">
                           <li><a href="#" class="button">HELP!</a></li>
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