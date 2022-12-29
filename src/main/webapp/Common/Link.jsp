<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
String Id = request.getParameter("user_id");

MemberDAO dao= new MemberDAO(application);

MemberDTO dto = dao.ViewMemberDTO(Id); %>
     <!-- Top Bar Start -->
	        <div class="top-bar">
	            <div class="container">
	                <div class="row align-items-center">
	                    <div class="col-lg-4 col-md-12">
	                        <div class="logo">
	                            <a href="http://localhost:8383/WebProject/index.jsp">
	                                <!-- <h1>FIVEGUYS</h1> -->
	                                <img src="img/logo.webp" alt="Logo"> 
                            </a>
                        </div>
                    </div>
                   
                   <div>
  					<%
					
					if(session.getAttribute("UserId") == null){
					%>
						<a href="http://localhost:8383/WebProject/06Session/login.jsp">Login</a>
					 <% 
					}else{
						
					%>
						<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br/>
						<a href="http://localhost:8383/WebProject/06Session/Logout.jsp?returnUrl=<%=request.getRequestURI()%>">[로그아웃]</a>
						<a href="http://localhost:8383/WebProject/06Session/ViewForm.jsp">[회원정보]</a>
					<%
					}		
					%>	
                   </div>
                   
                </div>
            </div>
            
        </div>
        <!-- Top Bar End -->
        <!-- Nav Bar Start -->
        <div class="nav-bar">
            <div class="container">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">MENU</a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="http://localhost:8383/WebProject/index.jsp" class="nav-item nav-link active">Home</a>
                            <a href="http://localhost:8383/WebProject/about.jsp" class="nav-item nav-link">브랜드스토리</a>
                            <a href="http://localhost:8383/WebProject/service.jsp" class="nav-item nav-link">메뉴</a>
                            <a href="http://localhost:8383/WebProject/09BoardPaging/List.jsp" class="nav-item nav-link">이벤트</a>
                            <a href="http://localhost:8383/WebProject/09BoardPaging2/List.jsp" class="nav-item nav-link">채용</a>
                            <a href="http://localhost:8383/WebProject/contact.jsp" class="nav-item nav-link">Contact</a>
                            
                            </div>
                        </div>
                        
                    </div>
                </nav>
            </div>
        <!-- Nav Bar End -->
        
        <!-- Nav Bar End -->
        
