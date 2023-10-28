<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>

<%
	
	Class.forName("oracle.jdbc.OracleDriver");
	String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // database 접속 url, 각 DB회사 홈페이지에서 찾아야 함(회사마다 다름).
	String dbUser = "system";
	String dbPwd = "ekseh123";
	
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
	
	String sql = "SELECT * FROM PRODUCTS";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	
	int itemsPerPage = 10; // 페이지 당 아이템 수 (조절 가능)
	int totalItems = 0;
	String countSql = "SELECT COUNT(*) as count FROM PRODUCTS";
    Statement countSt = con.createStatement();
    ResultSet countRs = countSt.executeQuery(countSql);
    
    if (countRs.next()) {
        totalItems = countRs.getInt("count");
    }
    countRs.close();
    countSt.close();
	
	int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
	
	int currentPage = 1; // 현재 페이지 기본값 설정
	
	String pageParam = request.getParameter("page");
	if (pageParam != null) {
	    currentPage = Integer.parseInt(pageParam);
	}
	
	int startIndex = (currentPage - 1) * itemsPerPage;
	int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
	


%>

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
        
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
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
    </style>
</head>
<body>

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
			    if (totalItems == 0) {
			%>
			<tr>
			    <td colspan="4" class="no-data">재고가 없습니다.</td>
			</tr>
			
			<% }
			    else {
			    	int rowNumber = 0;
			    	while(rs.next()) {
		            	rowNumber++;
    	      			if (rowNumber > startIndex && rowNumber <= endIndex) {
			%>
			<tr>
			    <td><%=rs.getString("CATEGORY") %></td>
			    <td><a href="viewStk.jsp?item_code=<%=rs.getString("ITEM_CODE") %>" target="right">
			    <%=rs.getString("ITEM_NAME") %></a></td>
			    <td><%=rs.getString("MANUFACTURER") %></td>
			    <td><%=rs.getInt("CUR_STOCKS") %></td>
			</tr>
			<%
    	      		}
				} 
			}
			
			%>
		</table>
	</div>
<div class="pagination">
    <ul>
        <% if (currentPage > 1) { %>
            <a href="viewListStk.jsp?page=1">[첫 페이지] </a>
            <a href="viewListStk.jsp?page=<%= currentPage - 1 %>">◀</a>
        <% } else { %>
            <span>[첫 페이지]</span>
            <span>◀</span>
        <% } %>
        
        <% for (int pageNum = Math.max(1, currentPage - 2); pageNum <= Math.min(totalPages, currentPage + 2); pageNum++) { %>
            <% if (pageNum == currentPage) { %>
                <span><%= pageNum %></span>
            <% } else { %>
                <a href="viewListStk.jsp?page=<%= pageNum %>"><%= pageNum %></a>
            <% } %>
        <% } %>
        
        <% if (currentPage < totalPages) { %>
            <a href="viewListStk.jsp?page=<%= currentPage + 1 %>">▶</a>
            <a href="viewListStk.jsp?page=<%= totalPages %>"> [마지막 페이지]</a>
        <% } else { %>
            <span>▶</span>
            <span>[마지막 페이지]</span>
        <% } %>
    </ul>
</div>

</body>
</html>
