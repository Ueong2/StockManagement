<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="stm.func.*" %>
<jsp:useBean id="boards" type="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewListStk.jsp</title>
<link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        .table-container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center; /* 테이블 가운데 정렬로 변경 */
            text-align: center;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
        }
        table {
            width: 60%;
            border-collapse: collapse;
            margin: 0 auto; /* 가운데 정렬을 위한 스타일 추가 */
        }
        
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        .no-data {
            text-align: center;
            padding: 20px;
        }
        .search-container {
            text-align: left;
            padding-bottom: 10px;
            margin-left: 20%; /* 테이블 가운데로 이동한 만큼 조절 */
        }
        
		input[type="submit"] {
		    padding: 2px 4px;
		    background-color: #007bff;
		    color: white;
		    border: none;
		    cursor: pointer;
		    border-radius: 3px;
			}
		
		input[type="submit"]:hover {
		    background-color: #0056b3;
			}
    </style>
</head>
<body>

<%
    int itemsPerPage = 10; // 페이지 당 아이템 수 (조절 가능)
    int totalItems = boards.size();
    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

    int currentPage = 1; // 현재 페이지 기본값 설정

    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        currentPage = Integer.parseInt(pageParam);
    }

    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
%>
	<div class="header">
	    <h1>재고 현황</h1>
	</div>
	
	<div class="table-container">
	    <div class="search-container">
	        <!-- 제품명 검색 -->
	        <form action="stkSearchAction.jsp" method="GET">
	            <input type="text" id="searchQuery" name="query" placeholder="제품명 검색">
	            <input type="submit" value="검색">
	        </form>
	    </div>

    	<table>
	        <tr>
	            <th>카테고리</th>
	            <th>제품명</th>
	            <th>제조사</th>
	            <th>보유개수</th>
	        </tr>
			<%
			    if (boards.size() == 0) {
			%>
			<tr>
			    <td colspan="4" class="no-data">재고가 없습니다.</td>
			</tr>
			<%
			    }
			    for (int i = startIndex; i < endIndex; i++) {
			        StkDTO board = (StkDTO) boards.get(i);
			%>
			<tr>
			    <td><%= board.getCategory() %></td>
			    <td><a href="stkAction.jsp?item_code=<%= board.getItem_code() %>" target="right"><%= board.getItem_name() %></a></td>
			    <td><%= board.getManufacturer() %></td>
			    <td><%= board.getCur_stocks() %></td>
			</tr>
			<%
			    }
			%>
		</table>
	</div>
	<div class="pagination">
	<ul>
	    <%
	    for (int pageNum = 1; pageNum <= totalPages; pageNum++) {
	        if (pageNum == currentPage) {
	        %>
	        	<span><%= pageNum %></span>
	        <%
	        } else {
	        %>
	        	<a href="listStkAction.jsp?page=<%= pageNum %>"><%= pageNum %></a>
	        <%
	        }
	        %>
	    <%
	    }
	    %>
	</ul>
	</div>
</body>
</html>
