<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="listStk.jsp"%>
<jsp:useBean id="stk" type="stm.func.StkDTO" scope="request"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String oldItemName = request.getParameter("old_item_name");
	int result = (Integer)request.getAttribute("result");
//result 값에 따라 결과 화면을 html로 만들어 출력
	System.out.print("viewUpdateStkAction.jsp update result = " + result);

	if(result >= 1){
%>
<%=oldItemName%> 제품 정보가 변경되었습니다.<br>
<a href='<%=request.getContextPath()%>/stkInOutList/viewStkAction.jsp?item_code=<jsp:getProperty property="item_code" name="stk"/>'>변경정보</a><br>
<a href='<%=request.getContextPath()%>/stkInOutList/listStk.jsp?item_code=<jsp:getProperty property="item_code" name="stk"/>'>재고현황</a>
<%
	}else{
%>
<jsp:forward page="viewUpdateEmpActionError.jsp"/>
<%		
	}
%>
</body>
</html>