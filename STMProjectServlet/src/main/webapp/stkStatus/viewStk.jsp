<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	String pre_item_code = request.getParameter("item_code");
	Class.forName("oracle.jdbc.OracleDriver");
	String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // database 접속 url, 각 DB회사 홈페이지에서 찾아야 함(회사마다 다름).
	String dbUser = "system";
	String dbPwd = "ekseh123";
	
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
	
	String sql = "SELECT  CATEGORY"
			+ "        ,A.ITEM_CODE ITEM_CODE" 
			+ "        ,A.ITEM_NAME ITEM_NAME"
			+ "        ,A.MANUFACTURER MANUFACTURER"
			+ "        ,ROUND(B.PRICE/B.CNT,2) IN_AVG_PRICE"
			+ "        ,ROUND(C.PRICE/C.CNT,2) OUT_AVG_PRICE"
			+ "        ,A.MIN_STOCKS MIN_STOCKS"
			+ "        ,A.CUR_STOCKS CUR_STOCKS"
			+ "        ,A.ITEM_DESC ITEM_DESC"
			+ " FROM    PRODUCTS A"
			+ " LEFT OUTER JOIN     ("
			+ "                        SELECT  ITEM_CODE"
			+ "                                ,SUM(PRICE*AMOUNT) PRICE"
			+ "                                ,SUM(AMOUNT) CNT"		
			+ "                        FROM    INVENTORY"
			+ "                        WHERE DIST = '1'"
			+ "                        GROUP BY ITEM_CODE"
			+ "                    ) B"
			+ " ON A.ITEM_CODE = B.ITEM_CODE"
			+ " LEFT OUTER JOIN     ("
			+ "                        SELECT  ITEM_CODE"
			+ "                                ,SUM(PRICE*AMOUNT) PRICE"
			+ "                                ,SUM(AMOUNT) CNT"		
			+ "                                FROM    INVENTORY"
			+ "                                WHERE DIST = '2'"
			+ "                                GROUP BY ITEM_CODE"
			+ "                    ) C"
			+ " ON A.ITEM_CODE = C.ITEM_CODE"
			+ " WHERE   A.ITEM_CODE = ?";
	
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, pre_item_code);
	ResultSet rs = st.executeQuery();
	
	
	rs.next();

	String category = rs.getString("CATEGORY");
	String item_code = rs.getString("ITEM_CODE");
	String item_name = rs.getString("ITEM_NAME");
	String manufacturer = rs.getString("MANUFACTURER");
	int in_avg_price = rs.getInt("IN_AVG_PRICE");
	int out_avg_price = rs.getInt("OUT_AVG_PRICE");
	int min_stocks = rs.getInt("MIN_STOCKS");
	int cur_stocks = rs.getInt("CUR_STOCKS");
	String item_desc = rs.getString("ITEM_DESC");
	
	rs.close();
	st.close();
	con.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewStk.jsp</title>
<link rel="stylesheet" type="text/css" href="styles.css">
	<style>
		table {
		  margin: 0 auto;
		  border-collapse: collapse;
		  width: 150%;
		  border: 0px solid #ccc;
		}
		th, td {
		  padding: 10px;
		  width: 135px;
		  text-align: center;
		  border: 1px solid #ccc;	
		}
		
		img {
		  max-width: 60%;
		  height: auto;
		}
		
		.table-container {
		  display: flex;
		  justify-content: center;
		  text-align: center;
		  background-color:#fff;
		  border-radius: 5px;
		}
	</style>
</head>

<body>
<p style="font-weight: bold; font-size: 24px;"><%=item_name %>의 정보</p>


<table style="width: 70%; border: 0;">
	<tr>
    	<td style="vertical-align: top; border: 0; padding-right: 10px;">
        	<img alt="첫 번째 이미지" src="0002.jpg" style="width: 100%; border: 0;">
    	</td>
    	<td style="vertical-align: top; border: 0;">
    <table style="width: 100%; border: 0;">
	<tr>
    	<th>제품설명</th>
  	</tr>
    <tr>
    	<td><textarea readonly style="width: 100%; height: 300px; border: 0;"><%=item_desc %></textarea></td>
    </tr>
      </table>
    </td>
    </tr>
</table>

<table class="table-container" border="1" style="width: 100%; margin-top: 20px;">
	<tr>
		<th>카테고리</th>
		<th>제품코드</th>
		<th>제품명</th>
		<th>제조사</th>
		<th>평균입고단가</th>
		<th>평균출고단가</th>
		<th>안전재고개수</th>
		<th>현재보유개수</th>
	</tr>
	<tr>
		<td><%=category %></td>
		<td><%=item_code %></td>
		<td><%=item_name %></td>
		<td><%=manufacturer %></td>
		<td><%=in_avg_price %></td>
		<td><%=out_avg_price %></td>
		<td><%=min_stocks %></td>
		<td><%=cur_stocks %></td>
	</tr>
</table>

<br>
<a href="<%=request.getContextPath()%>/stkStatusFunction/viewUpdateStk.jsp?item_code=<%= item_code%>"><input type="button" value="변경"></a>
<a href="<%=request.getContextPath()%>/stkStatusFunction/viewdeleteStk.jsp?item_code=<%= item_code%>&item_name=<%= item_name %>"><input type="button" value="삭제"></a>


</body>
</html>
