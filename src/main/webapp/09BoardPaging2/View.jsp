
<%@page import="model1.board2.Board2DTO"%>
<%@page import="model1.board2.Board2DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String num = request.getParameter("num");

Board2DAO dao = new Board2DAO(application);

dao.updateVisitCount(num);

Board2DTO dto = dao.selectView(num);

dao.close();
%>
<%@ include file="IsLoggedIn.jsp"%>  
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

<script>

function deletePost() {
	
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
    
        var form = document.writeFrm;      
    	
        form.method = "post"; 
        form.action = "DeleteProcess.jsp"; 
       
        form.submit();
      
    }
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 상세 보기(View)</h2>
<form name="writeFrm">

<input type="hidden" name="num" value="<%= num %>" />  
    <table border="1" width="90%">
        <tr>
            <td>번호</td>
            <td><%= dto.getIdx() %></td>
            <td>작성자</td>
            <td><%= dto.getId() %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%= dto.getPostdate() %></td>
            <td>조회수</td>
            <td><%= dto.getVisitcount() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%= dto.getTitle() %></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100">
	          
                <%= dto.getContent() %>
            </td> 
        </tr>
        <tr>
            <td colspan="4" align="center">
            <%
          
            if(session.getAttribute("UserId")!=null){
            %>
                <button type="button" onclick="location.href='Edit.jsp?num=<%= dto.getIdx() %>';">
                수정하기</button>
                <button type="button" onclick="deletePost();">삭제하기</button>
            <%
            }
            %> 
            
                <button type="button" onclick="location.href='List.jsp';">
                    목록 보기
                </button>
            </td>
        </tr>
    </table>
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
