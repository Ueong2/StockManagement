<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Left Navigation</title>
	<style>
	    body {
	        font-family: Arial, sans-serif;
	        background-color: #007bff;
	        text-align: center;
	        margin: 0;
	        padding: 0;
	    }
	    .navigation {
	        margin-top: 0px;
	    }
	    .navigation ul {
	        list-style-type: none; /* 리스트 마커 제거 */
	        padding-left: 0; /* 왼쪽 여백 제거 */
	    }
	    .navigation ul li {
	        margin-bottom: 0px;
	    }
	    .navigation a {
	        text-decoration: none;
	        display: block; /* 블록 레벨 요소로 변경 */
	        background-color: #007bff; /* 푸른색 배경 */
	        color: #ffffff; /* 흰색 텍스트 */
	        padding: 20px; /* 내용 주위에 여백 추가 */
	        border-radius: 0px; /* 테두리 둥글게 만들기 */
    		font-size: 22px; /* 텍스트 크기 조절 */
	    }

	    .navigation a:hover {
	        background-color: #0056b3; /* 호버 시 배경색 변경 */
	    }
	</style>
</head>
<body>
    <div class="navigation">
        <ul>
            <li><a href="<%=request.getContextPath()%>/stkStatus/viewListStk.jsp" target="right">재고 현황</a></li>
            <li><a href="<%=request.getContextPath()%>/stkRegister/viewRegisterStk.jsp" target="right">제품 등록</a></li>
            <li><a href="<%=request.getContextPath()%>/stkInOut/viewInStk.jsp" target="right">입고 입력</a></li>
            <li><a href="<%=request.getContextPath()%>/stkInOut/viewOutStk.jsp" target="right">출고 입력</a></li>
            <li><a href="<%=request.getContextPath()%>/stkInOutList/inOutListStkAction.jsp" target="right">입출고 내역</a></li>
        </ul>
    </div>
</body>
</html>
