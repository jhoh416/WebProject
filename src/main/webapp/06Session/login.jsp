<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
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
    </head>

    <body>
      <jsp:include page="../Common/Link.jsp"/>
	</span>
	<%
	
	if(session.getAttribute("UserId") == null){
	%>
      
        <form action="LoginProcess.jsp" method="post" name="login"
		onsubmit="return validateForm(this);">
        <div class="location">
            <div class="container">
                <div class="row">
                    
                    <div class="col-lg-5">
                        <div class="location-form">
					    <span style="color: white; font-size: 1.2em;">
							<%= request.getAttribute("LoginErrMsg") == null ?
									"" : request.getAttribute("LoginErrMsg")%>
							
							</span>
                            <h3>로그인</h3>
                            
                            
                                <div class="control-group">
                                    <input type="text" name="user_id" class="form-control" placeholder="ID" required="required"
                                    />
                                </div>
                                <div class="control-group">
                                    <input type="password" name="user_pw" class="form-control" placeholder="PW" required="required" />
                                </div>
                               
                                <div>
                                    <button class="btn btn-custom" type="submit" >로그인</button>
                                    <br /><br />
                                    
                                    <button class="btn btn-custom" onclick = "location.href='join.jsp';" type="button">회원가입</button>
                                </div>
                            
                            
                		</div>
                    </div>
                </div>
            </div>
        </div>
        </form>
        <% 
		}else{
			
		%>
			<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br/>
			<a href="Logout.jsp">[로그아웃]</a>
		<%
		}		
		%>	
        
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
    </body>
</html>