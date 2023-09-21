<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	재고의 세부정보가 존재하지 않습니다.
	<%= exception.getMessage() %>
	<a href = "listStk.jsp">직원목록</a>
</body>
</html>