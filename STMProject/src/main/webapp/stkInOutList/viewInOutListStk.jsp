<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="stm.func.*" %>
<jsp:useBean id="stkinoutLists" type="java.util.ArrayList" scope="request"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewInOutListStk.jsp</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #fff;
            color: #000000;
            padding: 10px;
        }
        .table-container {
            display: flex;
            justify-content: center;
  			text-align: center;
            background-color:#fff;
            border-radius: 5px;
           	
        }
        table {
            width: 60%;
            border-collapse: collapse;
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
</style>
</head>
<body>
    <div class="header">
        <h1>입출고 내역</h1>
    </div>
    <div class="table-container">
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
			int i = 1;
			if (stkinoutLists.size() == 0) {
			%>
			<tr>
			    <td colspan="11" class="no-data">입출고 내역이 없습니다.</td>
			</tr>
	      <%
			}
		     for (Object o : stkinoutLists) {
		         InOutStkDTO stkinoutList = (InOutStkDTO) o;
	      %>
	      <tr>
	        <td><%= stkinoutList.getDist() %></td>
	        <td><%= stkinoutList.getInv_code() %></td>
	        <td><%= stkinoutList.getItem_code() %></td>
	        <td><%= stkinoutList.getItem_name() %></td>
	        <td><%= stkinoutList.getJob_charger() %></td>
	        <td><%= stkinoutList.getInv_date() %></td>
	        <td><%= stkinoutList.getMade_date() %></td>
	        <td><%= stkinoutList.getPrice() %></td>
	        <td><%= stkinoutList.getAmount() %></td>
	        <td><%= stkinoutList.getTot_price() %></td>
	        <td><%= stkinoutList.getInv_desc() %></td>
	        
	      </tr>
	      <%
	          }
	      %>
	    </table>
    </div>
</body>
</html>
