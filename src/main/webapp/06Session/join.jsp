<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>

	<jsp:include page="../Common/Link.jsp" /> 
	
	
	<form action="join_ok.jsp" method="post">
	
	<div class="single">
            <div class="container">
                <div class="row">
                    

                    <div class="col-lg-4">
                        <div class="sidebar">
                            <div class="sidebar-widget">
                                <h2 class="widget-title">회원가입</h2>
                                <div class="category-widget">
                                    <ul>
                                        <li><a href="">ID: <input type="text" name="id"></a><span></span></li>
                                        <li><a href="">PW: <input type="password" name="pass"></a><span></span></li>
                                        <li><a href="">이름: <input type="text" name="name"></a><span></span></li>
                                        <li><a href="">Email: <input type="text" name="email"></a><span></span></li>
                                        <li><a href="">Mobile: <input type="text" name="mobile"></a><span></span></li>
                                        
                                    </ul>
                                </div>
                            </div>
                          
                                <div class="tag-widget">
                                    <button type="submit">작성완료</button>
									<button type="reset">초기화</button>
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

</body>
</html>