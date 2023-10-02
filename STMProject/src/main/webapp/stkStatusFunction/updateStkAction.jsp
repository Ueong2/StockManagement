<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="stm.func.*,java.util.Date" %>
<jsp:useBean id="service" class="stm.func.StkDAO" scope="application"/>
<jsp:useBean id="stk" class="stm.func.StkDTO" scope="request"/>
<jsp:setProperty property="*" name="stk"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
// 	2. 그 후 get을 통해 old코드를 선언한 후 update의 파라미터로 사용한다.
	String oldStkCode = request.getParameter("old_item_code");
	int result = service.update(stk, oldStkCode);
	request.setAttribute("result", result);
%>
<jsp:forward page="viewUpdateStkAction.jsp"/>
</head>
<body>
</body>
</html>