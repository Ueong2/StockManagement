<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="stm.func.*,java.util.Date" %>
<jsp:useBean id="stk" type="stm.func.StkDTO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewStk.jsp</title>

<style>
  body {
    font-family: Arial, sans-serif;
    text-align: center;
  }

  table {
    margin: 0 auto;
    border-collapse: collapse;
    width: 60%;
  }

  table, th, td {
    border: 1px solid #ccc;
  }

  th, td {
    padding: 10px;
    text-align: center;
  }

  img {
    max-width: 60%;
    height: auto;
  }

  a {
    text-decoration: none;
  }

  input[type="button"] {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
  }

  input[type="button"]:hover {
    background-color: #0056b3;
  }
</style>
</head>

<body>
<%=stk.getItem_name() %>의 정보<p>

<table style="width: 100%;">
  <tr>
    <td style="vertical-align: top;">
      <img alt="첫 번째 이미지" src="0002.jpg" width="300">
    </td>
    <td style="vertical-align: top; padding-left: 20px;">
      <table border="1" style="width: 100%;">
			  <tr>
    <td >제품설명</td>
  </tr>
  <tr>
    <td><textarea readonly style="width: 300px; height: 250px;" ><%=stk.getItem_desc() %></textarea></td>
  </tr>
      </table>
    </td>
  </tr>
</table>

<table border="1" style="width: 100%; margin-top: 20px;">
	<tr>
		<td>카테고리</td>
		<td>제품코드</td>
		<td>제품명</td>
		<td>제조사</td>
		<td>평균입고단가</td>
		<td>평균출고단가</td>
		<td>안전재고개수</td>
		<td>현재보유개수</td>
	</tr>
	<tr>
		<td><%=stk.getCategory() %></td>
		<td><%=stk.getItem_code() %></td>
		<td><%=stk.getItem_name() %></td>
		<td><%=stk.getManufacturer() %></td>
		<td><%=stk.getIn_avg_price() %></td>
		<td><%=stk.getOut_avg_price() %></td>
		<td><%=stk.getMin_stocks() %></td>
		<td><%=stk.getCur_stocks() %></td>
	</tr>
</table>

<br>
<a href="<%=request.getContextPath()%>/stkStatusFunction/updateStk.jsp?item_code=<%= stk.getItem_code()%>"><input type="button" value="변경"></a>
<a href="<%=request.getContextPath()%>/stkStatusFunction/deleteStk.jsp?item_code=<%= stk.getItem_code()%>&item_name=<%= stk.getItem_name() %>"><input type="button" value="삭제"></a>
</body>
</html>
