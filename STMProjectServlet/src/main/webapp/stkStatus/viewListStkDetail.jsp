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
	PreparedStatement st = con.prepareStatement(sql);
	
	ResultSet rs = st.executeQuery();
	
	rs.next();
	
	String category = rs.getString("CATEGORY");
	String item_name = rs.getString("ITEM_NAME");
	String item_code = rs.getString("ITEM_CODE");
	String manufacturer = rs.getString("MANUFACTURER");
	int cur_stocks = rs.getInt("CUR_STOCKS");
	
	rs.close();
	st.close();
	con.close();
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

			<tr>
			    <td colspan="4" class="no-data">재고가 없습니다.</td>
			</tr>

			<tr>

			    <td><%=category %></td>
			    <td><a href="stkAction.jsp?item_code=<%=item_code %>" target="right"><%=item_name %></a></td>
			    <td><%=manufacturer %></td>
			    <td><%=cur_stocks %></td>
			</tr>

		</table>
	</div>

</body>
</html>
