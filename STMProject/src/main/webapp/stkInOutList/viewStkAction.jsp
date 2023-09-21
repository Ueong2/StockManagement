<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="viewStkError.jsp" %>
<%@ page import="stm.func.*,java.util.Date" %>

<jsp:useBean id="service" class="stm.func.StkDAO" scope="application"/>
<jsp:useBean id="stk" class="stm.func.StkDTO" scope="request"/>
<jsp:setProperty property="*" name="stk"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewStkAction.jsp</title>
<%
//String id = request.getParameter("id");
int result = 0;
StkDTO board = service.select(stk);
//StkDAO service = new StkDAO();
//board = service.select(id);
System.out.println("viewStkAction.jsp select :: "+board);
request.setAttribute("stk", board); // 
%>
<jsp:forward page="viewStk.jsp"/>
</head>
<body>

</body>
</html>