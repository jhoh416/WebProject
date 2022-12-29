<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");

MemberDTO dto = new MemberDTO();
dto.setId(id);
dto.setPass(pass);
dto.setName(name);
dto.setEmail(email);
dto.setMobile(mobile);

MemberDAO dao = new MemberDAO(application);

int affected = dao.updateEdit(dto);

dao.close();

if(affected == 1){
	
	response.sendRedirect("ViewForm.jsp?Id=" + dto.getId());
}
else{

	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}

%>