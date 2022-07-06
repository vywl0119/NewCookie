
<%@page import="com.model.KeywordDAO"%>
<%@page import="com.model.My_InfoDTO"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css_newMain/main.css" />
<style>
    #profile{
               
               float:left; 
               margin-top:32px;     
            }
    #info{
            width:60%;
            height:50%;
            float:left;            
         }
   #file{
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
   request.setCharacterEncoding("EUC-KR");
   MemberDTO info = (MemberDTO)session.getAttribute("info");
   InfoDAO dao = new InfoDAO();
   KeywordDAO kdao = new KeywordDAO();
   String mbti = null;
   String title = request.getParameter("title");
   System.out.println(title);
   ArrayList<InfoDTO> itd = new ArrayList<InfoDTO>();
   
   ArrayList<My_InfoDTO> itd_list = new ArrayList<My_InfoDTO>();
   ArrayList<My_InfoDTO> school_list = new ArrayList<My_InfoDTO>();
   ArrayList<My_InfoDTO> lisence_list = new ArrayList<My_InfoDTO>();
   
   if(info != null){
     itd = dao.itd(info.getM_id());
      itd_list = dao.my_itd(title);
      school_list = dao.my_school(title);
      lisence_list = dao.my_lisence(title);
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
      <form action = "UpdateInfoServiceCon" method="post" enctype="multipart/form-data" >
                     <input type="text" name ="title1" placeholder="������ �Է����ּ���. (ex.�¾�ȸ��)" value=<%=itd_list.get(0).getTitle() %>>
                     <input type="hidden"  name="title" value=<%=itd_list.get(0).getTitle() %>>
                     <br>
                  
                    
                 
                  
                 <%if(info != null){ %> 
                        
       
                <div id="profile" >
               <img src="infoimg/<%=itd_list.get(0).getFilename()%>" id="img_section" style="width: 175px; height: 200px;">
                      <br><br>
             <input type="file" id="upload_file" accept="image/*" value="���ε�" name = "filename" required="true">
             
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
                     <%if (school_list.size() > 0){ %>
                     <tr>
                        <td><input type="date" name="gdate" value=<%=school_list.get(0).getG_date() %>> </td>
                        <td><input type="text" name="school" value=<%=school_list.get(0).getSchool()%>></td>
                     </tr>
                     <%}else{ %>
                     <tr>
                        <td><input type="date" name="gdate"  > </td>
                        <td><input type="text" name="school" ></td>
                     </tr>
                     <%} %>
                     
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
                     <%if(lisence_list.size() > 0){ %>
                     <tr>
                        <td><input type="date" name="getdate" value=<%=lisence_list.get(0).getGetdate() %>></td>
                        <td><input type="text" name="lisence" value=<%=lisence_list.get(0).getLisence() %>></td>
                        <td><input type="text" name="place" value=<%=lisence_list.get(0).getPlace() %>></td>
                     </tr>
                     <%}else{ %>
                     <tr>
                        <td><input type="date" name="getdate" ></td>
                        <td><input type="text" name="lisence" ></td>
                        <td><input type="text" name="place" ></td>
                     </tr>
                     <%} %>
                     
                  </table>
                  </div>
                  <br>
                  
                  <div id="fromSchool">
                  
                  <table>
                  <tr>
                  <td><textarea class="content" maxlength="1000"  name="q1" placeholder="������ �Է����ּ���" rows="4" > <%=itd_list.get(0).getQ1() %> </textarea> </td>
                    
                    </tr>
                     <tr>
                         <td rowspan="2">
                            <div class="wrap">
                               <textarea class="content" maxlength="1000"  name="a1" placeholder="������ �Է����ּ���" rows="4" ><%=itd_list.get(0).getA1() %></textarea>
                               <span class="counter" style ="padding-left: 850px;">###</span>
                           </div>
                        </td>
                     </tr>
                  
                  </table>
                  
                  <table>
                  <tr>
                     <td><textarea class="content" maxlength="1000"  name="q2" placeholder="������ �Է����ּ���" rows="4" > <%=itd_list.get(0).getQ2() %> </textarea> </td>
                    </tr>
                     <tr>
                         <td rowspan="2">
                            <div class="wrap">
                               <textarea class="content" maxlength="1000"  name="a2" placeholder="������ �Է����ּ���" rows="4" ><%=itd_list.get(0).getA2() %></textarea>
                               <span class="counter" style ="padding-left: 850px;">###</span>
                           </div>
                        </td>
                     </tr>
                  
                  </table>
                  
                  <table>
                  <tr>
                    <td><textarea class="content" maxlength="1000"  name="q3" placeholder="������ �Է����ּ���" rows="4" > <%=itd_list.get(0).getQ3() %> </textarea> </td>
                    </tr>
                     <tr>
                         <td rowspan="2">
                            <div class="wrap">
                               <textarea class="content" maxlength="1000"  name="a3" placeholder="������ �Է����ּ���" rows="4" ><%=itd_list.get(0).getA3() %></textarea>
                               <span class="counter" style ="padding-left: 850px;">###</span>
                           </div>
                        </td>
                     </tr>
                  
                  </table>
                  
                  <table>
                  <tr>
                    <td><textarea class="content" maxlength="1000"  name="q4" placeholder="������ �Է����ּ���" rows="4" > <%=itd_list.get(0).getQ4() %> </textarea> </td>
                    </tr>
                     <tr>
                         
                         <td rowspan="2">
                            <div class="wrap">
                               <textarea class="content" maxlength="1000"  name="a4" placeholder="������ �Է����ּ���" rows="4" ><%=itd_list.get(0).getA4() %></textarea>
                               <span class="counter" style ="padding-left: 850px;">###</span>
                           </div>
                        </td>
                         
                         
                     </tr>
                  
                  </table>
                  </div>
                  <br>
                  
                  <input type="submit" value ="�����ϱ�" onclick="alert('���� �Ϸ�!')" >
                  
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
                           <form action="LoginServiceCon" method = "post" accept-charset="EUC-KR">
                                     <input width="300px" placeholder="ID�� �Է��ϼ���." style="margin-top: 2px;" type="text" id="id" name="id" >
                                     <br>
                                     <input placeholder="PW�� �Է��ϼ���." style="margin-top: 2px;" type="password" id="pw" name="pw">
                                     <input type="hidden" value="info.jsp" name="url"> 
                                     <br>
                                    <input style="width:410px"  type="submit" id="btn_login" value="�α���">
                                      
                                      <a href="join.html"  style="margin-left: 10px; font-size: 2px"> ȸ������  </a>
                  
                               </form>
                        <%}else{ %>
                        
                        
                        
                        
                           <h2 align="center"><%=info.getNickname() %> ��<br>�������</h2>
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
                              for(int i = 0; i < itd.size(); i++){%>
                                 <li>
                                    <article>
                                       <header>
                                          <h2><a href="my_info.jsp?title=<%=itd.get(i).getTitle()%>"><%=itd.get(i).getTitle() %></a></h2>
                                          <time class="published" datetime="2015-10-20"><%=itd.get(i).getDate() %></time>
                                          <p align=right><a href="DeleteOneServiceCon?title=<%=itd.get(i).getTitle()%>"> ���� </a></p>
                                           
                                       </header>
                                       <a href="my_info.jsp?title=<%=itd.get(i).getTitle()%>" class="image"><img src="images/gogo.png" alt="" /></a>
                                    </article>
                                 </li>
                              <%} %>
                           <%}%>
                           
                        </ul>
                     </section>
                     
                      <section>
                        <div class="mini-posts">

                           <!-- Mini Post -->
                              <article class="mini-post">
                                 <header>
                                    <h1><a href="QNA_ALL2.jsp"
                                     onclick="window.open(this.href,'QNA','width=500, height=450'); return false;">���� ���� ������ �� ����</a></h1>
                                 </header>
                                 <a href="QNA_ALL2.jsp" 
                                 onclick="window.open(this.href,'QNA','width=500, height=450'); return false;" class="image">
                                 </a>
                              </article>


                  <% if(mbti != null){ %>
                      <!-- Mini Post -->
                              <article class="mini-post">
                                 <header>
                                    <h2><a href="keyword_result.jsp"
                                    onclick="window.open(this.href,'QNA','width=500, height=450'); return false;">������ �´� �ڼҼ� ���� ����</a></h2>
                                 </header>
                                 <a href="keyword_result.jsp" onclick="window.open(this.href,'QNA','width=500, height=450'); return false;"class="image">
                                 </a>
                              </article>
                  
                  <%}else{ %>

                           <!-- Mini Post -->
                              <article class="mini-post">
                                 <header>
                                    <h3><a href="keyword.jsp"
                                    onclick="window.open(this.href,'QNA','width=500, height=450'); return false;">������ �´� �ڼҼ� ã���� ����</a></h3>
                                 </header>
                                 <a href="keyword.jsp" onclick="window.open(this.href,'QNA','width=500, height=450'); return false;"class="image">
                                </a>
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