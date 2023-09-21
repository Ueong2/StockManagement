<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "stm.func.*, java.util.Date" %>
<jsp:useBean id="stk" class = "stm.func.InStkDTO" scope="page"/>		
<jsp:useBean id="inv_out_service" class = "stm.func.InStkDAO" scope="application"/>	<!-- 1. 이 줄로 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:setProperty property = "*" name = "stk"/>
<jsp:setProperty property = "stk" name = "inv_out_service" value = "<%= stk %>"/>
<%
	System.out.println("1");
	int result = inv_out_service.insert(stk);		// 2. 이렇게 간편화 됨
//result 값에 따라 결과 화면을 html로 만들어 출력
%>
<body>
<%
	if(result == 1){
%>
		[<jsp:getProperty property="item_name" name="stk"/>] 출고 등록이 완료되었습니다.
<%
	}else{
%>
		[<jsp:getProperty property="item_name" name="stk"/>] 출고 등록이 실패하였습니다.
<%
	}
%>
	<a href="viewOutStk.jsp">출고 입력</a>

</body>
</html>