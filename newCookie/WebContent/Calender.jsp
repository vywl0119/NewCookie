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
      // ajax �񵿱� ��� ���ؼ� ���� �����;��� DB ��
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
   
   // �α����� �г��� ��������
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
                               <li><a href="keyword_result.jsp">������ �´� �ڼҼ� ã��</a></li>
                            <%}else{ %>
                                <li><a href="keyword.jsp">������ �´� �ڼҼ� ã��</a></li>
                            <%} %>
                            <li><a href="QNA.jsp">���� ���� ������ ��</a></li>
                            <li><a href="info.jsp">�ڱ�Ұ���</a></li>
                            <li><a href="30days.jsp">30 Days</a></li>
                     <li><a href="Calender.jsp">���� ����</a></li>
                           
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
                        <h1>>���� ���� ������ ��</h1>
                        <h3 style="margin-left: 30px;"> <strong> '���� ���� ������ ��'</strong>�� ���� ����� ��� ���� �ʹٸ� ���� ��ư�� ��������</h3>
                        <ul class="actions">
                           <li><a style="margin-left: 20px; margin-top: 10px;" href="QNA.jsp" class="button">QNA</a></li>
                        </ul>
                     </section>
                     <table></table>
                        <p>   �������� �ڱ�Ұ����� �ۼ��ϱ⿡ ������� ���� �� �����ó��� ?<br>
                              ���� �ڱ�Ұ����� ���� ������ ���� ������ � ���� ��� �ϴ������� ��������������.<br><br>
                              �׷��� ����ȭ�� ������ QNA �������� �����п��� �ٰ������� �մϴ�.<br>
                              ��üȭ�� �����̶�� �����е��� ���� �ۼ��ϱ� ���������� ?!<br>
                              �������� ����غ�����μ� ����ڱ�Ұ����� �ڽ��� ���� �ҽ��� ����� �ʹٸ� ������ ������ ���ɲ� �亯���ֽñ� �ٶ��ϴ�.<br>
                              �����е��� �ڼҼ��� �߿��� �ҽ��� �� ���� ����� : )<br><br></p>
                           </article>
                     
                     
                        <article class="post" >
                        <section class="blurb">
                        <h1>>30 Days</h1>
                        <h3 style="margin-left: 30px;">'30 Days'�� �������� �ñ��Ͻôٸ� ���� ��ư�� ��������.</h3>
                        <ul class="actions">
                           <li><a style="margin-left: 20px; margin-top: 10px;" href="30days.jsp" class="button">Challenge</a></li>
                        </ul>
                     </section>
                     <table></table>
                        <p>������ 30���� ���� ������ �����ϱ⿡ ����� �ð��Դϴ�.<br>
                           ���� �۽ɻ����� ���̸� ����� 30���� �� �� �ִٰ� �����ؿ� !<br>
                           �׷����� �˸����� �ִٸ� ������ ����°� �������� �������?<br><br>
                           �׷��� �����п��� ��õ �帳�ϴ�.<br>
                           ����غ�����μ��� �����Ӹ� �ƴ϶� ���� ����� ���� ������ ���� �����̾�� ���� �����غ����� :)<br><br></p>
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