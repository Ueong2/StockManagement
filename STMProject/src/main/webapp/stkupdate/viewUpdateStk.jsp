<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="viewUpdateEmpError.jsp"%>
<jsp:useBean id="stk" type="stm.func.StkDTO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>
<jsp:getProperty property="item_name" name="stk"/>의 정보<p>
<form action="updateStkAction.jsp">
<table border="1">
	<tr>
		<td>카테고리</td>
		<td>제품코드</td>
		<td>제품명</td>
		<td>제조사</td>
		<td>평균단가</td>
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
		<td><%=stk.getAvg_price() %></td>
		<td><%=stk.getMout_stocks() %></td>
		<td><%=stk.getCur_stocks() %></td>
	</tr>
</table>

<table border="1" style="width: 50%;">
	<tr>
		<td>제품설명</td>
	</tr>
	<tr>
		<td><input style="width: 85%;" class="table-spacing" name="item_desc" value='<jsp:getProperty property="item_desc" name="stk"/>'></td>
	</tr>
</table>	

	<br>
	<a href='updateStkAction.jsp?item_code=<jsp:getProperty property="item_code" name="stk"/>'>
	<input type="submit" value="변경"></a>
			
		
</form>
</body>
</html>