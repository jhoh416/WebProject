<%@page import="model1.board2.Board2DAO"%>
<%@page import="model1.board2.Board2DTO"%>
<%@page import="utils.JSFunction"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./IsLoggedIn.jsp" %>
<%

String title = request.getParameter("title");
String content = request.getParameter("content");


Board2DTO dto = new Board2DTO();
dto.setTitle(title);
dto.setContent(content);

dto.setId(session.getAttribute("UserId").toString());


Board2DAO dao = new Board2DAO(application);

int iResult = dao.insertWrite(dto);

dao.close();

if(iResult == 1){
	
	response.sendRedirect("List.jsp");
} else{

	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>