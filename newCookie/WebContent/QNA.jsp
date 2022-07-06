<%@page import="com.model.KeywordDAO"%>
<%@page import="com.model.QnADTO"%>
<%@page import="com.model.QnADTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.QnADAO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
   <head>
   
      <meta charset="EUC-KR">
      
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css_newMain/main.css" />

      <style>
       .wrap {
       width: 300px;
       height: auto;
       position: relative;
       display: inline-block;
   }
         .jb-wrap {
            width:100%;
            margin: 0px auto;
            position: relative;
         }
         .jb-wrap img {
            width: 100%;
            vertical-align: middle;
         }
         .jb-text {
            position: absolute;
            top: 0px;
            width: 100%;
            height: 100%;
         
         }
         .jb-text-table {
            display: table;
            width: 100%;
            height: 100%;
         }
         .jb-text-table-row {
            display: table-row;
         }
         .jb-text-table-cell {
            display: table-cell;
            vertical-align: middle;
         }
         .jb-text p {
            margin: 0px 40px;
            padding: 10px;
            color: #ffffff;
            text-align: center;
         }
         
            .wrap textarea {
       width: 1300px;
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
      <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
         
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
              alert("100자 이상 작성해주세요"); 
              frm.focus();  

         }else{
            if(document.getElementById(id))
          alert("제출 성공!");
             document.insertFrm.submit();
          return true;
       }

       } 
      
      
      function len_chkk(){  

         var frm = document.insertFrmm.answer; 

         if(frm.value.length < 100){
              alert("100자 이상 작성해주세요"); 
              frm.focus();  

         }else{
          alert("수정 성공!");
             document.insertFrmm.submit();
          return true;
       }

       }

      </script> 
   </head>
   <body class="is-preload">
<%
   
   // 로그인한 닉네임 가져오기
   MemberDTO info = (MemberDTO)session.getAttribute("info");
   QnADAO dao = new QnADAO();
   ArrayList<QnADTO> qna_list = new ArrayList<QnADTO>();
   qna_list = dao.showQnA();
   KeywordDAO kdao = new KeywordDAO();
   String mbti = null;
   
   int cnt = dao.date();
   
   String today[] = dao.today();
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
               


            <!-- Main -->
               <div id="main">
               <article class="post">
                     
                        <header align ="center">
                           <div class="title">
                              <h2><a href="#">OBO Diary</a></h2>
                              <h3>[ QNA 보관함  ]</h3>
                              
                               <% if(info==null){%>
                               <h3>예비 회원님의 지난 QNA를 보관하고 있어요. </h3>
                                <%}else{ %>
                              <h3><%=info.getNickname() %>님의 지난 QNA를 보관하고 있어요. </h3> <%} %>
                           </div>
                           
                        </header>
                     
                        
                          
                           <!-- Post -->
                   <br> 
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
                              <a href="#"><%=qna_list.get(cnt).getNumber() %></a>
                              <time class="published"  style="margin-top: 70px; datetime="2015-11-01"><%=today[1]%> <%=today[2]%>, <%=today[0]%></time>
                              <a href="#" class="author"><span  class="name">1번째  <%=today[1]%>월</span></a>
                           </div>
                        </header>
                        
                        
                           
                              
                           <%if(info != null){
                              if(today_answer != null){ %>
                              
                                 <form action="UpdateServiceCon" method = "post" accept-charset="EUC-KR" name="insertFrmm" onSubmit="len_chkk();return false" >
                                 
                                 
                                    <div class="wrap">
                                     <textarea id="content" maxlength="500"  name="answer" ><%=today_answer %></textarea>
                                     <input type="hidden" value="QNA.jsp" name="url"> 
                                     <span id="counter" style ="padding-left: 1250px;">###</span>
                                 </div>  <br><br>
                                 
                                 <footer>
                                       <ul class="actions" style="margin-left: 560px;">
                                          <li> <input   class="button large" type="submit" id="btn_edit" value="수정하기" > </li>
                                       </ul>
                                    </footer>
                                    
                                 </form>
                                       
                              <%}else{ %>
                              
                                 <form action="MyQnAServiceCon" method = "post" accept-charset="EUC-KR" name="insertFrm" onSubmit="len_chk();return false">
                                    <div class="wrap">
                                        <textarea id="content" maxlength="500"  name="answer"></textarea>
                                        <input type="hidden" value="QNA.jsp" name="url"> 
                                        <span id="counter" style ="padding-left: 1250px;">###</span>
                                        
                                    </div><br><br>
                                    
                                    <footer>
                                       <ul class="actions" style="margin-left: 560px;">
                                          <li> <input  class="button large" type="submit" id="btn_submit" value="제출하기" onclick="alert('제출 성공!')"> </li>
                                       </ul>
                                    </footer>
                                                                      
                                 </form>         
                                       
                              <%}}else{ %>
                                     
                                    <div class="wrap">
                                     <textarea id="content" maxlength="500"  name="answer" placeholder="로그인을 해주세요"></textarea>
                                     <span id="counter" style ="padding-left: 1250px;">###</span>
                                 </div>
                                    <br> <br>
                                    
                                    <footer align="center">
                                        <ul style="margin-left: 560px;" class="actions pagination">
                        <li>
                        <a href="login.jsp?url=QNA.jsp" class="button large fit" >Log In</a>
                        </li>
                     </ul>
                                    </footer>
                         
                              <%} %>

                     </article>
                                 
                                 <!-- Post -->
                    <section id="two">
                    <br>  <br>  <br>
                  <h2>cabinet</h2>
                  <div class="row">
                  
                   <%if(info != null && my_qnalist.size() > 0){
                      
                      if(my_qnalist.size() > 3){
                           for(int i = my_qnalist.size()-1; i >= my_qnalist.size()-4; i--){ %>                           
                              <article class="col-6 col-12-xsmall work-item">
                                <div class="jb-wrap"> 
                                <div class="jb-image">  <a href="images/fulls/04.jpg" class="image fit thumb"><img src="images/pic04.jpg" alt="" /></a></div>
                                 <div class="jb-text">
                                 <div class="jb-text-table">
                                 <div class="jb-text-table-row">
                                 <div class="jb-text-table-cell">
                                    <p><%=my_qnalist.get(i).getQ_answer() %></p>
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 </div> 
                                 <h3><%=my_qnalist.get(i).getQ_date() %></h3>
                                 <p><%=my_qnalist.get(i).getMain() %></p>
                                 <br><br><br>
                              </article>   
                              
                                                     
                      <%}%>
                           
                               <div align="center">
                                 <a  href="QNA_ALL.jsp"  class="button large" style ="margin-left: 630px; " > MORE </a>
                              </div>
                              <br><br><br>
                     <% }else{
                           for(int i = my_qnalist.size()-1; i >= 0; i--){ %>
                              <article class="col-6 col-12-xsmall work-item">
                                <div class="jb-wrap"> 
                                <div class="jb-image">  <a href="images/fulls/04.jpg" class="image fit thumb"><img src="images/pic04.jpg" alt="" /></a></div>
                                 <div class="jb-text">
                                 <div class="jb-text-table">
                                 <div class="jb-text-table-row">
                                 <div class="jb-text-table-cell">
                                    <p><%=my_qnalist.get(i).getQ_answer() %></p>
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 </div> 
                                 <h3><%=my_qnalist.get(i).getQ_date() %></h3>
                                 <p><%=my_qnalist.get(i).getMain() %></p>
                                 <br><br><br>
                              </article>
                           
                           <%}
                           
                      
                      } %>
                           
                           
                   
                   <% }else{ %>
               
                        <article class="col-6 col-12-xsmall work-item">
                        <a href="images/fulls/01.jpg" class="image fit thumb"><img src="images/thumbs/01.jpg" alt="" /></a>
                        <h3><%=today[1]%> <%=today[2]%>, <%=today[0]%></h3>
                        <p> OBO Diary에 오신걸 환영합니다 :) </p>  
                          </article>
                        <article class="col-6 col-12-xsmall work-item">
                        <a href="images/fulls/01.jpg" class="image fit thumb"><img src="images/thumbs/03.jpg" alt="" /></a>
                        <h3><%=today[1]%> <%=today[2]%>, <%=today[0]%></h3>
                        <p>OBO Diary는 오늘도 예비 회원님들을 기다리고 있어요 :)</p>
                          </article>
                        <article class="col-6 col-12-xsmall work-item">
                        <a href="images/fulls/01.jpg" class="image fit thumb"><img src="images/thumbs/04.jpg" alt="" /></a>
                        <h3><%=today[1]%> <%=today[2]%>, <%=today[0]%></h3>
                        <p>나만의 답을 작성해보세요.</p>
                          </article>
                          <article class="col-6 col-12-xsmall work-item">
                        <a href="images/fulls/01.jpg" class="image fit thumb"><img src="images/thumbs/02.jpg" alt="" /></a>
                        <h3><%=today[1]%> <%=today[2]%>, <%=today[0]%></h3>
                        <p> 매일 하루씩 QNA를 답해 보세요. </p>
                          </article>
                           
                     <ul style="margin-left: 620px; margin-TOP: 90px;" class="actions pagination">
                        <li><br><br>
                        <a href="login.jsp" class="button large fit" >Log In</a>
                        </li>
                     </ul>
                      <%} %>
                  </div>
                 
               </section>

               
         </div>
                  

               </div>
                                 
                        
                        </div>
                           </article>
               
                 
               
                  
      
                  
      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

   </body>
</html>