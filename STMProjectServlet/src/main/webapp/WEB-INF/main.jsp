<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        /* Reset margin and padding for the whole document */
        * {
            margin: 0;
            padding: 0;
        }

        #top {
        	height: 150px;
            width: 100%;
            background-color: #f0f0f0;
            text-align: center;
            border-bottom: 1px solid black;
        }

        #top iframe {
            max-width: 100%;
            width: 100%;
            border: none;
        }

        #frameset {
            display: flex;
            flex: 1;
            overflow: hidden;
        }

        #left, #right {
            height: 100%;
            border: none;
        }

        #left {
            width: 200px;
            height: 770px;
            float: left;
            border-right: 1px solid black;
        }

        #right {
        	width: 100%;
            height: 770px;
            background-color: #ffffff;
        }
        .header {
            font-family: Arial, sans-serif;
            background-color: #007bff;
            color: #fff;
            margin: 0;
            padding: 0;
            position: relative;
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #000;
        }
        .header h1 {
            font-size: 48px;
            margin: 0;
        }
        .right-align {
		    text-align: right;
		}
    </style>
</head>
<%

	String name = request.getParameter("name");

    if (name == null) {
        name = "Default Name"; // 기본 이름 설정
    }
    
%>
<body>
    <div class="header">
        <h1>재고관리 시스템</h1>
    <br>
    <br>
    <br>
    <p class="right-align">[Admin] ${name }님 반갑습니다.<a href="index.jsp" target="_self"> 로그아웃</a></p>
    </div>
    <div id="frameset">
        <iframe id="left" src="left.jsp" name="left" frameborder="0" scrolling="no"></iframe>
        <iframe id="right" src="<%=request.getContextPath()%>/stkStatus/viewListStk.jsp" name="right" scrolling="auto"></iframe>
    </div>
</body>
</html>
