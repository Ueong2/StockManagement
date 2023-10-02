<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<jsp:useBean id="stk" type="stm.func.StkDTO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewUpdateStk.jsp</title>
<style>
  body {
    font-family: Arial, sans-serif;
    text-align: center;
  }

  table {
    margin: 0 auto;
    border-collapse: collapse;
    width: 80%;
  }

  table, th, td {
    border: 1px solid #ccc;
  }

  th, td {
    padding: 10px;
    text-align: center;
  }

  img {
    max-width: 100%;
    height: auto;
  }

  a {
    text-decoration: none;
  }
  .table-container {
      display: flex;
      justify-content: center;
	  text-align: center;
      background-color:#fff;
      border-radius: 5px;
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
<jsp:getProperty property="item_name" name="stk"/>의 정보<p>
<form action="updateStkAction.jsp">

<table border="0" style="width: 100%;">
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
      <td><textarea type="text" name="item_desc" style="width: 300px; height: 250px;"><jsp:getProperty property="item_desc" name="stk"/></textarea></td>
  </tr>
      </table>
    </td>
  </tr>
</table>

<table class="table-container" border="1" style="width: 100%; margin-top: 20px;">
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
		<td><input name="category" value='<jsp:getProperty property="category" name="stk"/>'></td>
		<td><input name="item_code" value='<jsp:getProperty property="item_code" name="stk"/>'>
			<input type="hidden" name="old_item_code" value='<jsp:getProperty property="item_code" name="stk"/>'></td>
<!-- 			1. old코드를 hidden으로 설정해야 update메서드를 정상적으로 동작시킬 수 있다.(where조건에 old코드 입력) -->
		<td><input name="item_name" value='<jsp:getProperty property="item_name" name="stk"/>'>
			<input type="hidden" name="old_item_name" value='<jsp:getProperty property="item_name" name="stk"/>'></td>
		<td><input name="manufacturer" value='<jsp:getProperty property="manufacturer" name="stk"/>'></td>
		<td><%=stk.getIn_avg_price() %></td>
		<td><%=stk.getOut_avg_price() %></td>
		<td><%=stk.getMin_stocks() %></td>
		<td><%=stk.getCur_stocks() %></td>
	</tr>
</table>

	<br>
	<a href='updateStkAction.jsp?item_code=<jsp:getProperty property="item_code" name="stk"/>'>
	<input type="submit" value="변경"></a>
			
		
</form>
</body>
</html>