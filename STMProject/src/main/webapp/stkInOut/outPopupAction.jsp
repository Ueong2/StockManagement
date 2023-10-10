<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="stm.func.*,java.util.*" %>
<jsp:useBean id="service" class="stm.func.StkDAO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>outPopup.jsp</title>
<%	
    int result = 0;
    ArrayList<StkDTO> boards = service.selectAll();
    request.setAttribute("boards", boards);
%>
</head>
<body>
<jsp:forward page="viewOutPopup.jsp"/>
</body>
</html>
