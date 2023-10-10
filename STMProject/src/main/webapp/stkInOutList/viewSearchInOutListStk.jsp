<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="stm.func.*" %>
<jsp:useBean id="stkinoutLists" type="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewSearchInOutListStk.jsp</title>
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
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: #fff;
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
    int totalItems = stkinoutLists.size();
    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

    int currentPage = 1; // 현재 페이지 기본값 설정

    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        currentPage = Integer.parseInt(pageParam);
    }

    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
%>

<%! // Define a function to format a number with commas
public String formatNumberWithCommas(int number) {
    return String.format("%,d", number);
}
%>
    <div class="header">
        <h1>입출고 내역</h1>
    </div>
    <div class="table-container">
	    <div class="search-container">
		<form action="listStkSearchAction.jsp" method="GET">
		    <!-- 제품명 검색 -->
		    <input type="text" id="searchQuery" name="query" placeholder="통합 검색">
		    
		    <!-- 시작 날짜와 종료 날짜 입력 필드 추가 -->
		    <label for="inv_date"> 입출고일자:</label>
		    <input type="date" id="inv_date" name="inv_date" max="9999-12-31" min="1900-01-01" value="<%= request.getAttribute("selectedDate") %>">
		    
		    <input type="submit" value="검색">
		</form>
    	</div>

	    <table border="1">
	      <tr>
	      	<th>구분</th>
	        <th>입출고코드</th>
	        <th>제품코드</th>
	        <th>제품명</th>
	        <th>담당자명</th>
	        <th>입출고일자</th>
	        <th>제조일자</th>
	        <th>가격(단가)</th>
	        <th>수량</th>
	        <th>총금액</th>
	        <th>비고</th>
	      </tr>
			<%  
				if (stkinoutLists.size() == 0) {
			%>
			<tr>
			    <td colspan="11" class="no-data">입출고 내역이 없습니다.</td>
			</tr>
	        <%
			    }
			    for (int i = startIndex; i < endIndex; i++) {
			    	InOutStkDTO stkinoutList = (InOutStkDTO) stkinoutLists.get(i);
	        %>
	      <tr>
	        <td><%= stkinoutList.getDist() %></td>
	        <td><%= stkinoutList.getInv_code() %></td>
	        <td><%= stkinoutList.getItem_code() %></td>
	        <td><%= stkinoutList.getItem_name() %></td>
	        <td><%= stkinoutList.getJob_charger() %></td>
	        <td><%= stkinoutList.getInv_date() %></td>
	        <td><%= stkinoutList.getMade_date() %></td>
			<td><%= formatNumberWithCommas(stkinoutList.getPrice()) %></td>
			<td><%= formatNumberWithCommas(stkinoutList.getAmount()) %></td>
			<td><%= formatNumberWithCommas(stkinoutList.getTot_price()) %></td>
	        <td><%= stkinoutList.getInv_desc() %></td>
	        
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
	        	<a href="inOutListStkAction.jsp?page=<%= pageNum %>"><%= pageNum %></a>
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
