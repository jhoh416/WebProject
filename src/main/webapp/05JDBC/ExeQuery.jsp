<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery()사용)</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	
	
	String sql = "SELECT id, pass, name, Email, mobile, regidate FROM member";
	
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		
		String id = rs.getString(1);
		String pw = rs.getString(2);
		String name = rs.getString("name");
		String Email = rs.getString("Email");
		String mobile = rs.getString("mobile");
		java.sql.Date regidate = rs.getDate("regidate");
		
		out.println(String.format("%s %s %s %s %s %s", id, pw, name, Email, mobile, regidate)+ "<br/>");
		
	}
	
	jdbc.close();
	%>
</body>
</html>