<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "stm.func.*, java.util.Date" %>
<jsp:useBean id="stk" class = "stm.func.InStkDTO" scope="page"/>		
<jsp:useBean id="inv_in_service" class = "stm.func.InStkDAO" scope="application"/>	<!-- 1. 이 줄로 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:setProperty property = "*" name = "stk"/>
<jsp:setProperty property = "stk" name = "inv_in_service" value = "<%= stk %>"/>
<%
	System.out.println("1");
	int result = inv_in_service.insert(stk);		// 2. 이렇게 간편화 됨
//result 값에 따라 결과 화면을 html로 만들어 출력
%>
<body>
<%
	if(result == 1){
%>
		[<jsp:getProperty property="item_name" name="stk"/>] 입고 내역이 등록되었습니다.
<%
	}else{
%>
		[<jsp:getProperty property="item_name" name="stk"/>] 입고 내역을 등록하지 못했습니다.
<%
	}
%>
	<a href="viewInStk.jsp">입고 입력</a>

</body>
</html>