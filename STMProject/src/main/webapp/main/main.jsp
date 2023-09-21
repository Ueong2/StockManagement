<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
</head>
<frameset rows="20%,*">
    <frame src="<%=request.getContextPath()%>/main/top.html" name="top">
    <frameset cols="200,*">
        <frame src="<%=request.getContextPath()%>/main/left.jsp" name="left">
        <frame src="<%=request.getContextPath()%>/stkInOutList/listStk.jsp" name="right">
    </frameset>
</frameset>
</html>
