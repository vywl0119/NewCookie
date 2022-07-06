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
			if(email != "�����Է�"){
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
	                     <form action="ChallengeServiceCon" method = "post" accept-charset="EUC-KR">
		                        <header align ="center">
		                           
		                           <div class="title">
		                              <h2><a href="#">OBO Diary</a></h2>
		                              <p>30 days</p>
		                              <p>������ ���¹�ȣ : 302-40039629-81</p>
		                           </div>
		                           
		                        </header>
		                        
		                        
		                       		 �ݾ�
		                        <select id="money" name="money" aria-label="�ݾ�">
		                            <option value="" selected="�ݾ��� �������ּ���.">�ݾ��� �������ּ���</option>
		                            <option value="1000">1,000��</option>
		                            <option value="5000">5,000��</option>
		                            <option value="10000">10,000��</option>
		                            <option value="30000">30,000��</option>
		                        	<option value="50000">50,000��</option>         
		                        </select>
		                        
		                         <br><br>

								  ��ǥ ����
								  
								<input type="text" name="field" id="field" onfocus="inInput(this)" onblur="outInput(this)"/>
								<select onfocus="inInput(this)" onblur="outInput(this)" onChange="selEmail(this.value)">
								
									<option value="" selected="������ �������ּ���.">������ �������ּ���</option>
									<option onselect="focus">�����Է�</option>
									<option value="5�ð� �����ϱ�">5�ð� �����ϱ�</option>
									<option value="1�ð� ��ϱ�">1�ð� ��ϱ�</option>
									<option value="7�ÿ� �Ͼ��">7�ÿ� �Ͼ��</option>									
								</select>	                         		


		                        <br><br>
		                        
		                        	���۳�¥
		                         <input type="date" name="start"  align="center">
		                          
		                        	���ᳯ¥
		                         <input type="date" name="end"  align="center">
		                          <br><br><br>
		                          
		                         	 ȯ�ް��¹�ȣ
		                         <input type="text" name="account" placeholder="���¹�ȣ�� �Է����ּ���." align="center">
		                          <br><br>

		                        <input type="submit" value="DONE!" onclick="alert('ç���� ��� ����!')">
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