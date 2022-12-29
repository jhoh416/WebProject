<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="isadmin.jsp"%>  
<%

String num = request.getParameter("num");

BoardDAO dao = new BoardDAO(application);

BoardDTO dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();

if(!sessionId.equals(dto.getId())){

	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
function validateForm(form){
	if(form.title.value == ""){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if(form.content.value == ""){
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp"></jsp:include>
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form name="writeFrm" method="post" action="EditProcess.jsp"
		onsubmit = "return validateForm(this);">

	<input type="hidden" name="num" value="<%= dto.getIdx() %>" />
	<table border = "1" width="90%">
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" style="width: 90%;"
						value="<%=dto.getTitle() %>"/>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
			<textarea name="content" style="width: 90%; height: 300px;"><%= dto.getContent() %></textarea>
			</td>
		</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">다시입력</button>
					<button type="button" onclick="location.href='List.jsp';">
					목록보기</button>
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