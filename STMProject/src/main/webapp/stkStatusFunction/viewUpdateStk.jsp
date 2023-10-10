<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<jsp:useBean id="stk" type="stm.func.StkDTO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewUpdateStk.jsp</title>
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
    max-width: 100%;
    height: auto;
  }

  .table-container {
      display: flex;
      justify-content: center;
	  text-align: center;
      background-color:#fff;
      border-radius: 5px;
  }
  input[type="text"] {
      width: 90%;
  }
</style>
</head>


<body>
<p style="font-weight: bold; font-size: 24px;"><%=stk.getItem_name() %>의 정보</p>
<%-- <jsp:getProperty property="item_name" name="stk"/>의 정보<p> (위와 같은 내용인데 이렇게 대체 가능)--%>
<form action="updateStkAction2.jsp">

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
    	<td><textarea type="text" name="item_desc" style="width: 100%; height: 300px; border: 0;"><jsp:getProperty property="item_desc" name="stk"/></textarea></td>
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
		<td><input type="text" name="category" value='<jsp:getProperty property="category" name="stk"/>'></td>
		<td><input type="text" name="item_code" value='<jsp:getProperty property="item_code" name="stk"/>'>
			<input type="hidden" name="old_item_code" value='<jsp:getProperty property="item_code" name="stk"/>'></td>
<!-- 			1. old코드를 hidden으로 설정해야 update메서드를 정상적으로 동작시킬 수 있다.(where조건에 old코드 입력) -->
		<td><input type="text" name="item_name" value='<jsp:getProperty property="item_name" name="stk"/>'>
			<input type="hidden" name="old_item_name" value='<jsp:getProperty property="item_name" name="stk"/>'></td>
		<td><input type="text" name="manufacturer" value='<jsp:getProperty property="manufacturer" name="stk"/>'></td>
		<td><%=stk.getIn_avg_price() %></td>
		<td><%=stk.getOut_avg_price() %></td>
		<td><%=stk.getMin_stocks() %></td>
		<td><%=stk.getCur_stocks() %></td>
	</tr>
</table>

	<br>
	<a href='updateStkAction2.jsp?item_code=<jsp:getProperty property="item_code" name="stk"/>'>
	<input type="submit" value="변경"></a>
			
		
</form>
</body>
</html>