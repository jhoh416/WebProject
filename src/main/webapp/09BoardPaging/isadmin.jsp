<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

if (session.getAttribute("UserAdmin") == null){
	JSFunction.alertBack("관리자 전용페이지입니다.", out);
	return;
}

%>