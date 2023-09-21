<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "loginError.html" %>
 <jsp:useBean id = "login" type="stm.func.BoardDTO" scope = "session"/>
<!-- type class의 차이 알기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=login.getName() %>님 반갑습니다. <br>
<a href="<%=request.getContextPath() %>/main/main.jsp">로그인 완료</a>
</body>
</html>