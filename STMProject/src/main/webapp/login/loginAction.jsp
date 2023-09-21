<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="stm.func.*,java.util.Date" %>

<jsp:useBean id="db" class="stm.func.BoardDAO" scope="application"/>
<jsp:useBean id="board" class="stm.func.BoardDTO" scope="request"/>
<jsp:setProperty property="*" name="board"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction.jsp</title>
</head>
<body>
<%
//2. 웹명령(loginAction)을 실행
board = db.select(board);  // select(id);
System.out.println("loginAction.jsp select :: " + board); // 존재하면 해당 board 객체 출력, 존재하지 않으면 null
session.setAttribute("login", board); // <jsp:useBean .... scope="session"
%>
<jsp:forward page="viewLogin.jsp"/>
</body>
</html>