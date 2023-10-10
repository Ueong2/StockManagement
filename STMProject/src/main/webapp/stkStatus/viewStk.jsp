<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="stm.func.*,java.util.*" %>

<jsp:useBean id="stk" type="stm.func.StkDTO" scope="request"/>
<jsp:useBean id="stklists" type="java.util.ArrayList" scope="request"/>

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
<p style="font-weight: bold; font-size: 24px;"><%=stk.getItem_name() %>의 정보</p>
<%
    int itemsPerPage = 10; // 페이지 당 아이템 수 (조절 가능)
    int totalItems = stklists.size();
    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

    int currentPage = 1; // 현재 페이지 기본값 설정

    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        currentPage = Integer.parseInt(pageParam);
    }

    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
%>

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
    	<td><textarea readonly style="width: 100%; height: 300px; border: 0;"><%=stk.getItem_desc() %></textarea></td>
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

<p style="font-weight: bold; font-size: 24px;"><%=stk.getItem_name() %>의 입출고 내역</p>
<table class="table-container" border="1" style="width: 100%; margin-top: 20px;">
	<tr>
		<th>구분</th>
		<th>입출고코드</th>
		<th>담당자명</th>
		<th>입출고일자</th>
		<th>제조일자</th>
		<th>입출고단가</th>
		<th>수량</th>
		<th>금액</th>
	</tr>
			<%  
				if (stklists.size() == 0) {
			%>
			<tr>
			    <td colspan="11" class="no-data">입출고 내역이 없습니다.</td>
			</tr>
			    
	        <%
				}
			    for (int i = startIndex; i < endIndex; i++) {
			    	InOutStkDTO stklist = (InOutStkDTO) stklists.get(i);
	        %>
	<tr>
<%--         <td><%= stklist.getDist() %></td> --%>
        <td><%= stklist.getDist() %></td>
        <td><%= stklist.getInv_code() %></td>
        <td><%= stklist.getJob_charger() %></td>
        <td><%= stklist.getInv_date() %></td>
        <td><%= stklist.getMade_date() %></td>
        <td><%= stklist.getPrice() %></td>
        <td><%= stklist.getAmount() %></td>
        <td><%= stklist.getTot_price() %></td>	
		
	</tr>
	      <%
	          }
	      %>
</table>

</body>
</html>
