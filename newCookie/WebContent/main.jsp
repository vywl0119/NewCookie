<%@page import="com.model.KeywordDAO"%>
<%@page import="com.model.ChallengeDTO"%>
<%@page import="com.model.ChallengeDAO"%>
<%@page import="java.util.Date"%>
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
<style type="text/css">
   .wrap {
       width: 300px;
       height: auto;
       position: relative;
       display: inline-block;
   }
   .wrap textarea {
       width: 950px;
       height : 500px;
       resize: none;
       min-height: 4.5em;
       line-height:1.6em;
       max-height: 9em; 
       
   }
   .wrap span {
       position: inherit
       bottom: 5px;
       right: 5px;
   }
   #counter {
     background:rgba(CCCCCC);
     border-radius: 0.5em;
     padding: 0 .5em 0 .5em;
     font-size: 0.75em;
   }
</style>
   
      

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
            margin-left:20px !important;
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
      
       #div2, #div3, #div4 {
            
            width: 40px !important;
            height: 60px !important;
            float: left !important;
         }
         
         .fc-toolbar-chunk {
              display: flex; // �Ϸķ� ������
              align-items: center; // ���� ��� ����
            }
         
         #icon{
         
         font-size:60px !important; 
         color: "black" !important;
         }
      </style>
      <script type="text/javascript"> 
        
      $(function() {
            $('#content').keyup(function (e){
                var content = $(this).val();
                $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
                $('#counter').html(content.length + '/500');
            });
            $('#content').keyup();
      });
      
      
      function len_chk(){  

         var frm = document.insertFrm.answer; 

         if(frm.value.length < 100){
              alert("100�� �̻� �ۼ����ּ���"); 
              frm.focus();  

         }else{
          alert("���� ����!");
             document.insertFrm.submit();
          return true;
       }

       } 
      
      
      function len_chkk(){  

         var frm = document.insertFrmm.answer; 

         if(frm.value.length < 100){
              alert("100�� �̻� �ۼ����ּ���"); 
              frm.focus();  

         }else{
          alert("���� ����!");
             document.insertFrmm.submit();
          return true;
       }

       }
      




      </script> 
        <script src='fullcalendar/main.js'></script>
        <script type="text/javascript">
        
        
        
       <%
       QnADAO dao = new QnADAO();
       String today[] = dao.today();

       
        %>
           // ajax �񵿱� ��� ���ؼ� ���� �����;��� DB ��
           $.ajax({
              url: "MyQnADayServiceCon",
              type: "get",
              dataType: "json",
              success: function(data){
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
                     events: data,
                 
                     eventContent: {
                          html: ` <div id="div1"><span style="color:Burlywood"><i id="icon" class="fas fa-cookie-bite"></i></span></div>`,
                        },
                   
                     
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
         

            <!-- Main -->
               <div id="main">

                  <!-- Post -->
                    <article class="post">
		                     
		                        
		                           <div class="title">
		                           
		                              <h2><a href="keyword.jsp">������ �´� �ڼҼ� ���� ��������</a></h2>
		                              
		                              
		                              
		                           </div>
		                           
		                        
		                        
		                     </article>
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
                              <a href="#" class="author"><span  class="name">1��°  <%=today[1]%>��</span></a>
                           </div>
                        </header>
                        
                        
                           
                              
                           <%if(info != null){
                              if(today_answer != null){ %>
                              
                                 <form action="UpdateServiceCon" method = "post" accept-charset="EUC-KR" name="insertFrmm" onSubmit="len_chkk();return false">
                                 
                                 
                                    <div class="wrap">
                                  
                                     <textarea id="content" maxlength="500"  name="answer" ><%=today_answer %></textarea>
                                     <input type="hidden" value="main.jsp" name="url"> 
                                     <span id="counter" style ="padding-left: 900px;">###</span>
                                 </div>  <br><br>
                                 
                                    <footer>
                                       <ul class="actions">
                                          <li> <input style="margin-left: 390px;"  class="button large" type="submit" id="btn_login" value="�����ϱ�" > </li>
                                       </ul>
                                    </footer>
                                    
                                 </form>
                                       
                              <%}else{ %>
                              
                                 <form action="MyQnAServiceCon" method = "post" accept-charset="EUC-KR" name="insertFrm" onSubmit="len_chk();return false">
                                    <div class="wrap">
                                        <textarea id="content" maxlength="500"  name="answer" ></textarea>
                                        <input type="hidden" value="main.jsp" name="url"> 
                                        <span id="counter" style ="padding-left: 900px;">###</span>
                                        
                                    </div><br><br>
                                    
                                    <footer>
                                       <ul class="actions">
                                          <li> <input style="margin-left: 390px; "  class="button large" type="submit" id="btn_login" value="�����ϱ�" > </li>
                                       </ul>
                                    </footer>
                                                                      
                                 </form>         
                                       
                              <%}}else{ %>
                                     
                                    <div class="wrap">
                                     <textarea id="content" maxlength="500"  name="answer" placeholder="�α����� ���ּ���" onKeyup="len_chk()"></textarea>
                                     <span id="counter" style ="padding-left: 900px;">###</span>
                                 </div>
                                    <br> <br>
                                    
                                    <footer>
                                       <ul class="actions">
                                       </ul>
                                    </footer>
                         
                              <%} %>

                     </article>

                  <!-- Post  </article>-->
                  
                 
                       <article class="post">
                      
                            <div id='calendar' style='box-sizing:none;'></div>
                       
                        <br><br><br>
                        
                     </article>

               

                  <!-- Pagination -->
                     <ul style="margin-left: 440px; margin-TOP: 90px;" class="actions pagination">
                        <li><a href="QNA_ALL.jsp" class="button large next">����������</a></li>
                     </ul>

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
                                     <input type="hidden" value="main.jsp" name="url"> 
                                     <br>
                                    <input style="width:410px"  type="submit" id="btn_login" value="�α���">
                                     <a  href="join.html"  style="margin-left: 350px; margin-top:20px; font-size: 2px"> ȸ������  </a>
                  
                  
                               </form>
                        <%}else{ %>
                        
                        
                           <h2 align=center><%=info.getNickname() %> ��<br>�������</h2>
                           <p>���õ�  <a href="http://html5up.net"> OBO Diary</a>�� ã���ּż� �����մϴ�.</p>
                           <a  href="editjsp"  style="font-size: 4px; margin-left: 250px;" > ������������    </a>
                             <a  href="LogoutServiceCon"  style="font-size: 4px; margin-left:30px"> �α׾ƿ�    </a>
                            
                        <%} %>
                        </header>
                     </section>


                  <!-- Posts List -->
                     <section>
                        <ul class="posts">
                        <%
                           for(int i = cnt-1, j =1; i >= cnt-5 && j < 6; i--, j++){ %>
                        
                        
                              <li>
                                 <article>
                                    <header>
                                       <h3><a href="QNA_ALL.jsp"><%=qna_list.get(i).getMain() %></a></h3>
                                       <time class="published" datetime="2015-10-20"><%=dao.day(j)[1]%> <%=dao.day(j)[2]%>, <%=dao.day(j)[0]%></time>
                                    </header>
                                    <a href="single.html" class="image"><img src="images/gogo.png" alt="" /></a>
                                 </article>
                              </li>
                  <%} %>
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