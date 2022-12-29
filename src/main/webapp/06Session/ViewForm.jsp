<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="IsLoggedIn.jsp"%>  
    
	<%
	
	//String Id = request.getParameter("user_id");
	
	String Id = session.getAttribute("UserId").toString();
	
	MemberDAO dao = new MemberDAO(application);

	MemberDTO dto = dao.ViewMemberDTO(Id);
	
	

	dao.close();
	%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FIVEGUYS KOREA</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free Website Template" name="keywords">
        <meta content="Free Website Template" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        
        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        
        <script type="text/javascript">
        	function check(){
        		if(document.fr.pass.value ==""){
        			alert("비밀번호를 입력하세요!");
        			document.fr.pass.focus();
        			return false;
        		}
        	}
        
        </script>
</head>
<body>

	<jsp:include page="../Common/Link.jsp" /> 
	<form action="UpdateProcess.jsp" method="post">
	 <div class="single">
            <div class="container">
                <div class="row">
                    

                    <div class="col-lg-4">
                        <div class="sidebar">
                            <div class="sidebar-widget">
                                <h2 class="widget-title">회원정보</h2>
                                <div class="category-widget">
                                    <ul>
                                        <li><a href="">ID:<%= dto.getId() %></a><span></span></li>
                                        <li><a href="">PW:<%= dto.getPass() %></a><span></span></li>
                                        <li><a href="">이름:<%= dto.getName() %></a><span></span></li>
                                        <li><a href="">Email:<%= dto.getEmail() %></a><span></span></li>
                                        <li><a href="">Mobile:<%= dto.getMobile() %></a><span></span></li>
                                        
                                    </ul>
                                </div>
                            </div>
                            <div class="sidebar-widget">
                                <h2 class="widget-title">회원정보수정</h2>
                                <div class="tag-widget">
                                    <a href='Updateform.jsp?Id=<%= dto.getId() %>';>회원정보수정</a>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
	
 		<jsp:include page="/Common/footer.jsp"/>
        
        <!-- Back to top button -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- Pre Loader -->
        <div id="loader" class="show">
            <div class="loader"></div>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        
        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>