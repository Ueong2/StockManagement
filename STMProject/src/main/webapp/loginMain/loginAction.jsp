<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="loginError.html"%>
<%@ page import="stm.func.*,java.util.Date" %>

<jsp:useBean id="db" class="stm.func.LoginDAO" scope="application"/>
<jsp:useBean id="login" class="stm.func.LoginDTO" scope="request"/>
<jsp:setProperty property="*" name="login"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction.jsp</title>
</head>
<body>
<%
//2. 웹명령(loginAction)을 실행
	login = db.select(login);  // select(id);
	System.out.println("loginAction.jsp select :: " + login); // 존재하면 해당 login 객체 출력, 존재하지 않으면 null
	session.setAttribute("loginset", login); // <jsp:useBean .... scope="session"
	
	if (login.getDist().equals("1")){
%>
	<jsp:forward page="main.jsp"/>
<%
	}
	else {
	%>
		<jsp:forward page="main2.jsp"/>
	<% 
	}

%>
</body>
</html>