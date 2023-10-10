<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="stm.func.*,java.util.*" %>

<jsp:useBean id="service" class="stm.func.StkDAO" scope="request"/>
<jsp:useBean id="stk" class="stm.func.StkDTO" scope="request"/>
<jsp:useBean id="listservice" class="stm.func.InOutStkDAO" scope="request"/>


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
	System.out.println("stkAction.jsp select :: "+board);
	request.setAttribute("stk", board); // 
	
	int result2 = 0;
	String item_code = request.getParameter("item_code");
	ArrayList<InOutStkDTO> stms = listservice.selectDetail(item_code);
	request.setAttribute("stklists", stms);  // 리스트 데이터 가져오기
	System.out.println("StkAction.jsp select :: "+stms);
%>


<jsp:forward page="viewStk2.jsp"/>
</head>
<body>

</body>
</html>