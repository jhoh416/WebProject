<%@page import="model1.board2.Board2DTO"%>
<%@page import="model1.board2.Board2DAO"%>
<%@page import="utils.BoardPage"%>

<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Board2DAO dao = new Board2DAO(application);


Map<String, Object> param = new HashMap<String, Object>();

String b_id = request.getParameter("b_id");

param.put("b_id", b_id);

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if (searchWord != null){
	
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalCount= dao.selectCount(param);


int pageSize = 
	Integer.parseInt(application.getInitParameter("POST_PER_PAGE"));
int blockPage = 
	Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));


int totalPage = (int)Math.ceil((double)totalCount / pageSize);


int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp);


int start = (pageNum - 1) * pageSize + 1;
int end = pageNum * pageSize;
param.put("start", start);
param.put("end", end);

List<Board2DTO> boardLists = dao.selectListPage(param);

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
    </head>
<body>
	
   <jsp:include page="../Common/Link.jsp" />  

	
    <h2>이벤트 - 현재 페이지 : <%= pageNum %> (전체 : <%= totalPage %>))</h2>
    
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">id</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
<%

if (boardLists.isEmpty()) {
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
	
    int virtualNum = 0; 

	int countNum = 0;
    for (Board2DTO dto : boardLists)
    {
    	
    	virtualNum = totalCount - (((pageNum - 1)* pageSize) 
    			+ countNum++);
%>
        <tr align="center">
        	
            <td><%= virtualNum %></td>  
          
            <td align="left"> 
                <a href="View.jsp?num=<%= dto.getIdx() %>"><%= dto.getTitle() %></a> 
            </td>
           
            <td align="center"><%= dto.getId() %></td>   
            
  
            <td align="center"><%= dto.getVisitcount() %></td>  
            
            <td align="center"><%= dto.getPostdate() %></td>    
        </tr>
<%
    }
}
%>
    </table>
   
    <table border="1" width="90%">
        <tr align="center">
        	
        	<td>
        		
        		<% 
        		System.out.println("현재경로="+ request.getRequestURL());
        		%>
        		<%= BoardPage.pagingStr(totalCount, pageSize,
        				blockPage, pageNum, request.getRequestURI()) %>
        	</td>
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
  <jsp:include page="/Common/footer.jsp"/>
        
       
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        
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
