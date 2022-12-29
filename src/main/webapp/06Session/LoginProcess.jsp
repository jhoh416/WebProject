
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%

String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");


String mysqlDriver = application.getInitParameter("MysqlDriver");
String mysqlURL = application.getInitParameter("MysqlURL");
String mysqlId = application.getInitParameter("MysqlId");
String mysqlPwd = application.getInitParameter("MysqlPwd");


MemberDAO dao = new MemberDAO(mysqlDriver, mysqlURL, mysqlId, mysqlPwd);

MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);

dao.close();

if(memberDTO.getId() != null){
	
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	session.setAttribute("UserPass", memberDTO.getPass());
	session.setAttribute("UserAdmin", memberDTO.getAdmin());
	
	request.getRequestDispatcher("../index.jsp").forward(request, response);
}
else{


	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");

	request.getRequestDispatcher("login.jsp").forward(request, response);
}
%>