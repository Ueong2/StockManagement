<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="stm.func.*, java.util.Date" %>
<jsp:useBean id="service" class="stm.func.LoginService" scope="application"/>
<jsp:useBean id="guest" class="stm.func.LoginDTO" scope="request"/>
<jsp:setProperty property="*" name="guest"/>
<jsp:setProperty property="regdate" name="guest" value="<%= new Date() %>"/>
<%-- <jsp:setProperty property="invenIn" name="serviceInvenIn" value="<%= invenIn %>"/> --%>
<%
	System.out.println("ss");
	System.out.println(guest.getId());
	System.out.println(guest.getPwd());
	System.out.println(guest.getName());
	String result = service.registerlogin(guest);
	request.setAttribute("resultData", result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="loginForm.jsp"></jsp:forward>
</body>
</html>