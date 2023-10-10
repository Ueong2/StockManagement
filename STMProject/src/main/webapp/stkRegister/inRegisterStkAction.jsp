<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "stm.func.*, java.util.Date" %>
<jsp:useBean id="stk" class = "stm.func.StkDTO" scope="page"/>		
<jsp:useBean id="inservice" class = "stm.func.StkDAO" scope="request"/>	<!-- 1. 이 줄로 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:setProperty property = "*" name = "stk"/>
<jsp:setProperty property = "stk" name = "inservice" value = "<%= stk %>"/>
<%
	int result = inservice.insert(stk);		// 2. 이렇게 간편화 됨
//result 값에 따라 결과 화면을 html로 만들어 출력
%>
<body>
<%
	if(result == 1){
%>
		[<jsp:getProperty property="item_name" name="stk"/>] 제품이 등록되었습니다.
<%
	}else{
%>
		[<jsp:getProperty property="item_name" name="stk"/>] 제품 등록을 실패하였습니다.
<%
	}
%>
	<a href="<%=request.getContextPath()%>/stkRegister/viewRegisterStk.jsp">제품 등록</a>

</body>
</html>