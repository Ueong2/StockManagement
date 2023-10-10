<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="stm.func.*,java.util.*" %>
<jsp:useBean id="search" class="stm.func.InOutStkDAO" scope="request"/>
<!-- 도서 검색 리스트 출력 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookSearch</title>
<%
	int result = 0;
	String searchQuery = request.getParameter("query");
	String searchDate = request.getParameter("inv_date");
	ArrayList<InOutStkDTO> stms = search.selectSearch(searchQuery, searchDate);
	request.setAttribute("stkinoutLists", stms);  // 리스트 데이터 가져오기
	System.out.println("출력환인요"+stms);
%>
</head>
<body>
<jsp:forward page="viewSearchInOutListStk.jsp"/>
</body>
</html>