<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="stm.func.*,java.util.Date"%>
<jsp:useBean id="stk" type="stm.func.StkDTO" scope="request"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewDeleteStkAction.jsp</title>
</head>
<body>
<%
	String item_code = request.getParameter("item_code");
	String item_name = request.getParameter("item_name");
	//result 값에 따라 결과 화면을 html로 만들어 출력
	StkDAO service = new StkDAO();
	if (stk.getCur_stocks() != 0){
		%>
			<%=item_name%> 재고가 0이 아닌 제품 정보를 삭제할 수 없습니다. 재고를 확인해주세요.<br>
			<a href='<%=request.getContextPath()%>/stkStatus/listStkAction.jsp'>재고 현황</a>
		<%
	}
	else{
		int result = service.delete(item_code);
		%>
		<%=item_name%> 제품 정보가 삭제되었습니다.<br>
		<a href='<%=request.getContextPath()%>/stkStatus/listStkAction.jsp'>재고 현황</a>
<%
	}
%>
</body>
</html>