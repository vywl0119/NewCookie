
<%@page import="com.model.KeywordDAO"%>
<%@page import="com.model.ChallengeDAO"%>
<%@page import="com.model.InfoDAO"%>
<%@page import="com.model.InfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style >
    #profile{
               
               float:left; 
               margin-top:32px;     
            }
    #info{
            width:60%;
            height:50%;
            float:left;            
         }

   .wrap {
       width: 300px;
       height: auto;
       position: relative;
       display: inline-block;
   }
   .wrap textarea {
       width: 900px;
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
   .counter {
     background:rgba(CCCCCC);
     border-radius: 0.5em;
     padding: 0 .5em 0 .5em;
     font-size: 0.75em;
   }
</style>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css_newMain/main.css" />
 <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
   



<script type="text/javascript"> 
        
   $(function() {
       $('.content').keyup(function (e){
           var content = $(this).val();
           $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
           $('.counter').html(content.length + '/1000');
       });
       $('.content').keyup();
   });
      
</script> 

</head>
<body class="is-preload">
<%
   
   MemberDTO info = (MemberDTO)session.getAttribute("info");
   InfoDAO dao = new InfoDAO();
   KeywordDAO kdao = new KeywordDAO();
   String mbti = null;
   ArrayList<InfoDTO> itd_list = new ArrayList<InfoDTO>();

   if(info != null){
      itd_list = dao.itd(info.getM_id());
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
               
               



            <!-- Main -->
               <div id="main">

                 <!-- Post -->
                     <article class="post">
                        <header>
                           <div class="title">
                              <h2><a href="main.jsp">OBO diary</a></h2>
                              <h3><a href="info.jsp">�ڱ�Ұ���</a></h3>
                           </div>
                           
                        </header>
      <form action = "InfoServiceCon" method="post" enctype="multipart/form-data" >
                     <input type="text" name ="title" placeholder="������ �Է����ּ���. (ex.�¾�ȸ��)">
                     <br>
                  
                    
                 
                  
                 <%if(info != null){ %> 
                        
       
                <div id="profile" >
               <img src="images/avatar.jpg" id="img_section" style="width: 175px; height: 200px;">
                      <br><br>
             <input type="file" id="upload_file" accept="image/*" required="true" value="���ε�" name = "filename">
             
              </div>
       
                <div id="info">
                        <table>
                           <tr>
                              <td>����</td>
                              <td><%=info.getName() %></td>
                           </tr>
                           <tr>
                              <td>����</td>
                              <td><%if(info.getGender().equals("W")){ %>���� <%}else{ %>����<%} %></td>
                           </tr>
                           <tr>
                              <td>�������</td>
                              <td><%=info.getBirth().substring(0, 10) %></td>
                           </tr>
                           <tr>
                              <td>�̸���</td>
                              <td><%=info.getEmail() %></td>
                           </tr>
                        </table>
                        <br>
                     </div>
                  <%}else{ %>
                       <div id="info">   
                        <table>
                           <tr>
                              <td>����</td>
                              <td></td>
                           </tr>
                           <tr>
                              <td>����</td>
                              <td></td>
                           </tr>
                           <tr>
                              <td>�������</td>
                              <td></td>
                           </tr>
                           <tr>
                              <td>�̸���</td>
                              <td></td>
                           </tr>
                        </table>
                     </div>

                  <%} %>
                  
                  
                  <br>
                  
                  <div id="fromSchool">
                  <table>
                     <tr>
                        <td rowspan="2" width=50px> �� �� �� �� </td>
                        <td width=200px align="center">�������</td>
                        <td width=450px align="center">����б� �� ��������</td>
                     </tr>
                     
                     <tr>
                        <td><input type="date" name="gdate"></td>
                        <td><input type="text" name="school"></td>
                     </tr>
                     
                  </table>
                  </div>
                  <br>
                  
                  <div id="fromSchool" >
                  <table>
                     <tr>
                        <td rowspan="2" width=50px> �� �� �� �� </td>
                        <td width=200px align="center">�������</td>
                        <td width=450px align="center">�ڰ�����</td>
                        <td width=450px align="center">����ó</td>
                     </tr>
                     <tr>
                     
                        <td><input type="date" name="getdate"></td>
                        <td><input type="text" name="lisence"></td>
                        <td><input type="text" name="place"></td>
                     </tr>
                     
                  </table>
                  </div>
                  <br>
                  
                  <div id="fromSchool">
                  
                  <table>
                  <tr>
                    <td><input type="text" name="q1" placeholder="���Ͻô� �׸��� �Է����ּ���. (ex.������)"> </td>
                    </tr>
                     <tr>
                     
                         <td rowspan="2">
                            <div class="wrap">
                               <textarea class="content" maxlength="1000"  name="a1" placeholder="������ �Է����ּ���" rows="4" ></textarea>
                               <span class="counter" style ="padding-left: 850px;">###</span>
                           </div>
                        </td>
                        
                     </tr>
                  
                  </table>
                  
                  <table>
                  <tr>
                    <td><input type="text"   name="q2" placeholder="���Ͻô� �׸��� �Է����ּ���. (ex.��»���)"> </td>
                    </tr>
                     <tr>
                          <td rowspan="2">
                            <div class="wrap">
                               <textarea class="content" maxlength="1000"  name="a2" placeholder="������ �Է����ּ���" rows="4" ></textarea>
                               <span class="counter" style ="padding-left: 850px;">###</span>
                           </div>
                        </td>
                     </tr>
                  
                  </table>
                  
                  <table>
                  <tr>
                    <td><input type="text"   name="q3" placeholder="���Ͻô� �׸��� �Է����ּ���. (ex.��������)"> </td>
                    </tr>
                     <tr>
                         <td rowspan="2">
                            <div class="wrap">
                               <textarea class="content" maxlength="1000"  name="a3" placeholder="������ �Է����ּ���" rows="4" ></textarea>
                               <span class="counter" style ="padding-left: 850px;">###</span>
                           </div>
                        </td>
                     </tr>
                  
                  </table>
                  
                  <table>
                  <tr>
                    <td><input type="text"   name="q4" placeholder="���Ͻô� �׸��� �Է����ּ���. (ex.��û���� �� �Ｚ �ڱ�Ұ��� �����Դϴ� .)"> </td>
                    </tr>
                     <tr>
                         <td rowspan="2">
                            <div class="wrap">
                               <textarea class="content" maxlength="1000"  name="a4" placeholder="������ �Է����ּ���" rows="4" ></textarea>
                               <span class="counter" style ="padding-left: 850px;">###</span>
                           </div>
                        </td>
                     </tr>
                  
                  </table>
                  </div>
                  <br>
                  
                  <input type="submit" value ="�����ϱ�" onclick="alert('���� �Ϸ�!')">
                  
             </form>
                     </article>

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
                         
                           <div id="edit">
                           <a  href="edit.jsp"  style="font-size: 4px; margin-left: 250px;" > ������������    </a>
                           <a  href="LogoutServiceCon"  style="font-size: 4px;margin-left: 30px; margin-top: 0;"> �α׾ƿ�    </a>
                           </div>
                        <%} %>
                        </header>
                     </section>



                 <!-- Posts List -->
                     <section id="scroll">
                     
                        <ul class="posts">
                           
                           <%if(info != null){ 
                              for(int i = 0; i < itd_list.size(); i++){%>
                                 <li>
                                    <article >
                                       <header>
                                          <h3><a href="my_info.jsp?title=<%=itd_list.get(i).getTitle()%>"><%=itd_list.get(i).getTitle() %></a></h3>
                                          <time class="published" datetime="2015-10-20"><%=itd_list.get(i).getDate() %></time>
                                          <p align=right><a href="DeleteOneServiceCon?title=<%=itd_list.get(i).getTitle()%>"> ���� </a></p>
                                       </header>
                                       <a href="my_info.jsp?title=<%=itd_list.get(i).getTitle()%>" class="image"><img src="images/gogo.png" alt="" /></a>
                                        
                                    </article>
                                 </li>
                              <%} %>
                           <%}%>
                           
                        </ul>
                     </section>
                     
                    <!-- Mini Posts -->
                     <section>
                        <div class="mini-posts">

                           <!-- Mini Post -->
                              <article class="mini-post">
                                 <header>
                                    <h3><a href="QNA_ALL.jsp"
                                     onclick="window.open(this.href,'QNA','width=500, height=450'); return false;">���� ���� ������ �� ����</a></h3>
                                 </header>
                                 <a href="QNA_ALL.jsp" 
                                 onclick="window.open(this.href,'QNA','width=500, height=450'); return false;" class="image">
                                 <img src="images/pic04.jpg" alt="" /></a>
                              </article>


                  <% if(mbti != null){ %>
                      <!-- Mini Post -->
                              <article class="mini-post">
                                 <header>
                                    <h3><a href="keyword_result.jsp"
                                    onclick="window.open(this.href,'QNA','width=500, height=450'); return false;">������ �´� �ڼҼ� ���� ����</a></h3>
                                 </header>
                                 <a href="keyword_result.jsp" onclick="window.open(this.href,'QNA','width=500, height=450'); return false;"class="image">
                                 <img src="images/pic05.jpg" alt="" /></a>
                              </article>
                  
                  <%}else{ %>

                           <!-- Mini Post -->
                              <article class="mini-post">
                                 <header>
                                    <h3><a href="keyword.jsp"
                                    onclick="window.open(this.href,'QNA','width=500, height=450'); return false;">������ �´� �ڼҼ� ã���� ����</a></h3>
                                 </header>
                                 <a href="keyword.jsp" onclick="window.open(this.href,'QNA','width=500, height=450'); return false;"class="image">
                                 <img src="images/pic05.jpg" alt="" /></a>
                              </article>
                  <%} %>
                           
                        </div>
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