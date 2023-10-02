<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <jsp:useBean id = "login" type="stm.func.BoardDTO" scope = "session"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
</head>
<frameset rows="20%,*">
    <frame src="top.jsp" name="top">
    <frameset cols="200,*">
        <frame src="left.jsp" name="left">
        <frame src="<%=request.getContextPath()%>/stkStatus/listStk.jsp" name="right">
    </frameset>
</frameset>
</html>
