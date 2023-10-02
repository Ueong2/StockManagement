<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <jsp:useBean id = "login" type="stm.func.BoardDTO" scope = "session"/>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>top.jsp</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #007bff;
            color: #fff;
            margin: 0;
            padding: 0;
            position: relative;
        }
        .header {
            padding: 20px;
            text-align: center;
        }
        .header h1 {
            font-size: 48px;
            margin: 0;
        }
        .footer {
            position: absolute;
            bottom: 0px;
            right: 0px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>재고관리 시스템</h1>
    </div>
    <br>
    <br>
    <br>
    <br>
    <div class="footer">
    <p><%=login.getName() %>님 반갑습니다.</p>
    </div>
</body>
</html>
