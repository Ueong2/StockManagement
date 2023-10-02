<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Left Navigation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .navigation {
            margin-top: 20px;
        }
        .navigation ul {
            list-style-type: square;
            padding-left: 20px;
        }
        .navigation ul li {
            margin-bottom: 10px;
        }
        .navigation a {
            text-decoration: none;
            color: #000000;
        }
        .navigation a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="navigation">
        <ul>
            <li><a href="<%=request.getContextPath()%>/stkStatus/listStk.jsp" target="right">재고 현황</a></li>
            <li><a href="<%=request.getContextPath()%>/stkRegister/viewRegisterStk.jsp" target="right">제품 등록</a></li>
            <li><a href="<%=request.getContextPath()%>/stkInOut/viewInStk.jsp" target="right">입고 입력</a></li>
            <li><a href="<%=request.getContextPath()%>/stkInOut/viewOutStk.jsp" target="right">출고 입력</a></li>
            <li><a href="<%=request.getContextPath()%>/stkInOutList/inOutListStk.jsp" target="right">입출고 내역</a></li>
            <li><a href="listStk.jsp" target="right">게시판</a></li>
        </ul>
    </div>
</body>
</html>
