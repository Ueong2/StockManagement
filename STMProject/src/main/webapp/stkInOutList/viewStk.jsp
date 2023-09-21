<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="stm.func.*,java.util.Date" %>
<jsp:useBean id="stk" type="stm.func.StkDTO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<table border="0" style="width: 100%;">
  <tr>
    <td style="vertical-align: top;">
      <img alt="첫 번째 이미지" src="0002.jpg" width="300">
    </td>
    <td style="vertical-align: top; padding-left: 20px;">
      <table border="1" style="width: 100%;">
			  <tr>
    <td>제품설명</td>
  </tr>
  <tr>
    <td><%=stk.getItem_desc() %></td>
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
          <td>평균단가</td>
          <td>안전재고개수</td>
          <td>현재보유개수</td>
        </tr>
        <tr>
          <td><%=stk.getCategory() %></td>
          <td><%=stk.getItem_code() %></td>
          <td><%=stk.getItem_name() %></td>
          <td><%=stk.getManufacturer() %></td>
          <td><%=stk.getAvg_price() %></td>
          <td><%=stk.getMout_stocks() %></td>
          <td><%=stk.getCur_stocks() %></td>
        </tr>
</table>

<br>
<a href="<%=request.getContextPath()%>/stkupdate/updateStk.jsp?item_code=<%= stk.getItem_code()%>"><input type="button" value="변경"></a>
</body>
</html>
