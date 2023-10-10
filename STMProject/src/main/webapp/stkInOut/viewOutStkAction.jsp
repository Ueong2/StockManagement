<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="listStk.jsp"%>
<%@ page import="stm.func.*,java.util.Date" %>
    
<jsp:useBean id="service" class="stm.func.StkDAO" scope="application"/>
<jsp:useBean id="stk" class="stm.func.StkDTO" scope="request"/>
<jsp:setProperty property="*" name="stk"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewOutStkAction.jsp</title>
<%
	int result = 0;
	StkDTO board = service.select(stk);
	//StkDAO service = new StkDAO();
	//board = service.select(id);
	System.out.println("viewStkAction.jsp select :: "+board);
	request.setAttribute("stk", board); // 
%>
</head>
<body>

</body>
</html>