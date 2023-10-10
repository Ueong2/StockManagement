<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "stm.func.*, java.util.Date" %>
<jsp:useBean id="stk" class = "stm.func.InOutStkDTO" scope="request"/>	
<jsp:useBean id="outservice" class = "stm.func.InOutStkDAO" scope="request"/>	<!-- 1. 이 줄로 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>outStkAction.jsp</title>
</head>
<jsp:setProperty property = "*" name = "stk"/>
<jsp:setProperty property = "stk" name = "outservice" value = "<%= stk %>"/>
<%
	int result = outservice.insertout(stk);		// 2. 이렇게 간편화 됨
	int result2 = outservice.updateout(stk);
//result 값에 따라 결과 화면을 html로 만들어 출력

%>
<body>
<%
	if(result == 1){
%>
		[<jsp:getProperty property="item_name" name="stk"/>] 출고 내역이 등록되었습니다.
<%
	}else{
%>
		[<jsp:getProperty property="item_name" name="stk"/>] 출고 내역을 등록하지 못했습니다.
<%
	}
%>
	<a href="viewOutStk.jsp">출고 입력</a>

</body>
</html>