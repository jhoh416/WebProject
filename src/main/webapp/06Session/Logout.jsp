<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String returnUrl = request.getParameter("returnUrl");
out.println(returnUrl);

session.removeAttribute("UserId");
session.removeAttribute("UserName");

session.invalidate();

response.sendRedirect(returnUrl);
%>