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
              display: flex; // �Ϸķ� ������
              align-items: center; // ���� ��� ����
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
            // ajax �񵿱� ��� ���ؼ� ���� �����;��� DB ��
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
     
       
            // ajax �񵿱� ��� ���ؼ� ���� �����;��� DB ��
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
     
       
            // ajax �񵿱� ��� ���ؼ� ���� �����;��� DB ��
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

   // �α����� �г��� ��������
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
               
               <%if(info != null && challenge_list.size() > 0){ 
                  for(int i = 0; i < challenge_list.size(); i++){%>
                     
                     
                     <article class="post">
                        <header>
                           <div class="title">
                               <h2><a href="30days_check.jsp"><%=challenge_list.get(i).getHabit() %></a></h2>
                              <p><%= challenge_list.get(i).getStart_date().substring(0, 10) %> ~ <%=challenge_list.get(i).getEnd_date().substring(0, 10)%></p>
                       <h4> <%=  c_dao.challenge_date(challenge_list.get(i).getEnd_date()) %>�� ���ҽ��ϴ� ������!!</h4>
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
                              <p><a href="30days_join.jsp">30�ϵ��� ������ ç������ �����غ��ƿ�!</a></p>
                              
                              
                           </div>
                           
                        
                        
                     </article>
               <%} %>
                     
               <%}else{ %>
                  
                           <div class="title">
                           
                              <h2>�α��� �� ����Ͻ� �� �ֽ��ϴ� :)</a></h2>
                             
                           </div>
                       
                    
                  <%for(int i = 0; i < 3; i++){%>
                  
               
                     <article class="post">
                     
                        
                           <div class="title">
                           
                              <h2><a href="30days_join.jsp">30days</a></h2>
                              <p><a href="30days_join.jsp">30�ϵ��� ������ ç������ �����غ��ƿ�!</a></p>
                              
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
                                     <input width="300px" placeholder="ID�� �Է��ϼ���." style="margin-top: 2px;" type="text" id="id" name="id" >
                                     <br>
                                     <input placeholder="PW�� �Է��ϼ���." style="margin-top: 2px;" type="password" id="pw" name="pw">
                                     <input type="hidden" value="30days.jsp" name="url"> 
                                     <br>
                                    <input style="width:410px"  type="submit" id="btn_login" value="�α���">
                                     <a  href="join.html"  style="margin-left: 350px; margin-top:20px; font-size: 2px"> ȸ������  </a>
                  
                  
                               </form>
                        <%}else{ %>
                        
                           <h2 align = center><%=info.getNickname() %> ��<br>�������</h2>
                           <p>���õ�  <a href="http://html5up.net"> OBO Diary</a>�� ã���ּż� �����մϴ�.</p>
                           <a  href="editjsp"  style="font-size: 4px; margin-left: 250px;" > ������������    </a>
                             <a  href="LogoutServiceCon"  style="font-size: 4px; margin-left:30px"> �α׾ƿ�    </a>
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
                                       <h3><a href="30days_join.jsp">���ο� ç������ �߰��غ�����!</a></h3>
                                       <time class="published" datetime="2015-10-15">30�ϵ��� ������ �淯���ƿ�.</time>
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
                                       <h3><a href="30days_join.jsp">���ο� ç������ �߰��غ�����!</a></h3>
                                       <time class="published" datetime="2015-10-15">30�ϵ��� ������ �淯���ƿ�.</time>
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
                        <h5>OBO Diary�� �������� ����� ������ �ְ����Ͽ� ���� ����Ʈ �Դϴ�. �������� �� ���� �� ���� ���� �� �� �ֵ��� ������ ���͵帱�Կ�! </h5>
                        <h6>����Ʈ ��뿡 ���� �ñ��� ���� �ִٸ� �Ʒ� ��ư�� �����ּ��� :)</h6>
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