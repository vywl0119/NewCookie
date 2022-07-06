<%@page import="com.model.QnADTO"%>
<%@page import="com.model.KeywordDAO"%>
<%@page import="com.model.ChallengeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ChallengeDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.QnADAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE HTML>

<html>

   <head>
      <title>Single - Future Imperfect by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css_newMain/main.css" />
      <link href='fullcalendar/main1.css' rel='stylesheet' />
   
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
            margin-left:20px !important;
            width: 150px !important;
            height: 120px !important;
            /*  background-color: yellow !important; */
         }
         #div1 {
            margin-top:0px !important;   
            width: 170px !important;
            height: 30x !important;
            
         }
      
       #div2, #div3, #div4 {
            
            width: 40px !important;
            height: 50px !important;
            float: left !important;
         }
         #icon{
         
         font-size:50px !important; 
         color: "black" !important;
         }
         #icon1{
         
         font-size:70px !important; 
         margin-left: 20px !important; 
         color: "black" !important;
         }
         
         .fc-daygrid-dot-event {
  
             display: block;
                
          }
          
      </style>
        <script src='fullcalendar/main.js'></script>
        
        <script type="text/javascript">
  <%
  QnADAO dao = new QnADAO();
   
   String today[] = dao.today();

   ChallengeDAO dao1 = new ChallengeDAO();
    
    ArrayList<ChallengeDTO> datephoto = new ArrayList<ChallengeDTO>();
   
   
    %>
    var qnadata;
      // ajax 비동기 통신 통해서 값을 가져와야함 DB 값
      $.ajax({
         url: "MyQnADay_and_challengedayServiceCon",
         type: "get",
         dataType: "json",
         success: function(data){
            for(var i = 0; i < data.length; i++){
               console.log(data[i]);
            }
            
            
            // ajax 
             var calendarEl = document.getElementById('calendar');

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
                  
                
                events:data,
                   
                   eventContent: {
                      
                        html: `
                            <div id="div1"><i id="icon1" style="color:#deb887" class="fas fa-cookie-bite"></i></div><br>
                        <div id="div2"><i style="color:#EED5B7" id="icon" class="fas fa-child"></i></div>
                        <div id="div3"><span style="color:#CDB79E"><i id="icon" class="fas fa-child"></i></span></div>
                        <div id="div4"><span style="color:#8B7D6B"><i id="icon" class="fas fa-child"></i></span></div>`
                   }
                 
                   
                 });
                
            
              calendar.render();  
   
         },
         error: function (error){
            
            
            
            
            
            
            
         }
      });
      
      

        
    </script>
     

      
   </head>
   <body class="single is-preload" >

<%
   
   // 로그인한 닉네임 가져오기
   MemberDTO info = (MemberDTO)session.getAttribute("info");
  KeywordDAO kdao = new KeywordDAO();
   ArrayList<QnADTO> qna_list = new ArrayList<QnADTO>();
   qna_list = dao.showQnA();
   String mbti = null;
   int cnt = dao.date();
   
  
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
                  <h1><a href="index.html">OBO Diary</a></h1>
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
                     <li><a href="Calender.jsp">나의 업적</a></li>
                           
                     </ul>
                  </nav>
                  
               </header>
               
               

            <!-- Menu -->
               <section id="menu">
=
                  
                  <!-- Actions -->
                     <section>
                        <ul class="actions stacked">
                           <li><a href="#" class="button large fit">Log In</a></li>
                        </ul>
                     </section>

               </section>

            <!-- Main -->
               <div id="main"  >

               

                  <!-- Post -->
                     <article class="post">
                     <br><br><br>
                       <div id='calendar' style='box-sizing:none;'>
                       </div>
                        
                        <br><br><br>
                        <br><br><br>
                        
                     </article>
                     
                     <article class="post" >
                        <section class="blurb">
                        <h1>>나에 대한 질문과 답</h1>
                        <h3 style="margin-left: 30px;"> <strong> '나에 대한 질문과 답'</strong>에 대한 기록을 모두 보고 싶다면 다음 버튼을 누르세요</h3>
                        <ul class="actions">
                           <li><a style="margin-left: 20px; margin-top: 10px;" href="QNA.jsp" class="button">QNA</a></li>
                        </ul>
                     </section>
                     <table></table>
                        <p>   여러분은 자기소개서를 작성하기에 어려움을 겪은 적 있으시나요 ?<br>
                              저는 자기소개서에 나온 질문을 보고 있으면 어떤 것을 써야 하는지부터 막막해지더라고요.<br><br>
                              그래서 세분화된 질문을 QNA 형식으로 여러분에게 다가가고자 합니다.<br>
                              구체화된 질문이라면 여러분들이 답을 작성하기 쉬워지겠죠 ?!<br>
                              여러분은 취업준비생으로서 취업자기소개서에 자신을 향한 소스를 만들고 싶다면 저희의 질문에 성심껏 답변해주시길 바랍니다.<br>
                              여러분들의 자소서의 중요한 소스가 될 지도 몰라요 : )<br><br></p>
                           </article>
                     
                     
                        <article class="post" >
                        <section class="blurb">
                        <h1>>30 Days</h1>
                        <h3 style="margin-left: 30px;">'30 Days'가 무엇인지 궁금하시다면 다음 버튼을 누르세요.</h3>
                        <ul class="actions">
                           <li><a style="margin-left: 20px; margin-top: 10px;" href="30days.jsp" class="button">Challenge</a></li>
                        </ul>
                     </section>
                     <table></table>
                        <p>여러분 30일은 좋은 습관을 형성하기에 충분한 시간입니다.<br>
                           저는 작심삼일이 모이면 어느덧 30일이 될 수 있다고 생각해요 !<br>
                           그렇지만 촉매제가 있다면 습관을 만드는게 쉬워지지 않을까요?<br><br>
                           그래서 여러분에게 추천 드립니다.<br>
                           취업준비생으로서의 습관뿐만 아니라 내가 만들고 싶은 습관을 저희 웹다이어리를 통해 도전해보세요 :)<br><br></p>
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

   </body>
   
   
</html>