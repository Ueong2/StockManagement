<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="stm.func.*,java.util.Date" %>
<jsp:useBean id="service" class="stm.func.StkDAO" scope="request"/>
<jsp:useBean id="stk" class="stm.func.StkDTO" scope="request"/>
<jsp:setProperty property="*" name="stk"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int result = 0;
	StkDTO board = service.select(stk);
	System.out.println("updateStk.jsp select :: " + board); // 존재하면 해당 board 객체 출력, 존재하지 않으면 null
	request.setAttribute("stk",board);
	System.out.println("123");
%>
<jsp:forward page="viewUpdateStk.jsp"/>
</head>
<body>
</body>
</html>