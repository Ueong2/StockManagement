<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="viewInError.jsp"%>
<!--      errorPage="registerEmp.html"  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<font face="Gothic" size="5">출고 입력</font><br>
	</center> 
	
	<form action="outStkAction.jsp">
		<table border="1" cellspacing="4" cellpadding="3">
		<tr>
			<th>출고코드</th>
			<th>제품코드</th>
			<th>제품명</th>
			<th>담당자명</th>
			<th>출고일자</th>
			<th>제조일자</th>
			<th>판매단가</th>
			<th>출고량</th>
		<tr>
<%-- 				<td align="justify"><%=i++ %></td> --%>
			<td><input name="inv_out_code"></td>
			<td><input name="item_code"></td>
			<td><input name="item_name"></td>
			<td><input name="job_charger"></td>
			<td><input name="inv_out_date"></td>
			<td><input name="made_date"></td>
			<td><input name="out_price"></td>
			<td><input name="out_amount"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="입력">
	</form>
</body>
</html>

