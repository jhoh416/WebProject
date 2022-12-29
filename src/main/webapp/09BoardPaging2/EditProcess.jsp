<%@page import="model1.board2.Board2DAO"%>
<%@page import="model1.board2.Board2DTO"%>
<%@page import="utils.JSFunction"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%

String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");


Board2DTO dto = new Board2DTO();
dto.setIdx(Integer.parseInt(num));
dto.setTitle(title);
dto.setContent(content);


Board2DAO dao = new Board2DAO(application);

int affected = dao.updateEdit(dto);

dao.close();


if(affected == 1){
	
	response.sendRedirect("View.jsp?num=" + dto.getIdx());
}
else{
	
	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>