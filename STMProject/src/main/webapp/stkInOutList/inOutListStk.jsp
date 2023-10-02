<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="stm.func.*,java.util.*" %>
<jsp:useBean id="inoutlistservice" class="stm.func.InOutStkDAO" scope="application"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>inOutListStk.jsp</title>
    <%
    int result = 0;
    ArrayList<InOutStkDTO> boards = inoutlistservice.selectAll();
    request.setAttribute("stkinoutLists", boards);  //  Action으로 넘어온 값을 변경시킨후 JSP 페이지로 넘겨주기 위해서는 request.setAttribute()
    												//	를 써서 넘겨주고 JSP 페이지에서는 request.getAttribute()를 써서 받아야한다.
    %>
</head>
<body>
<jsp:forward page="viewInOutListStk.jsp"/>
</body>
</html>
