<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="viewInError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고 입력</title>
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

  input[type="text"] {
    padding: 5px;
    width: 95%; /* 너비를 조정하여 셀 안에 맞도록 설정 */
    box-sizing: border-box; /* 너비에 padding과 border 포함 */
  }

  input[type="submit"] {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #0056b3;
  }
</style>
</head>
<body>
  <center>
    <font face="Gothic" size="5">입고 입력</font><br>
  </center> 
  
  <form action="inStkAction.jsp">
    <table border="1">
      <tr>
        <th>입고코드</th>
        <th>제품코드</th>
        <th>제품명</th>
        <th>담당자명</th>
        <th>입고일자</th>
        <th>제조일자</th>
        <th>구매단가</th>
        <th>입고량</th>
      </tr>
      <tr>
        <td><input type="text" name="inv_in_code"></td>
        <td><input type="text" name="item_code"></td>
        <td><input type="text" name="item_name"></td>
        <td><input type="text" name="job_charger"></td>
        <td><input type="text" name="inv_in_date"></td>
        <td><input type="text" name="made_date"></td>
        <td><input type="text" name="in_price"></td>
        <td><input type="text" name="in_amount"></td>
      </tr>
    </table>
    <br>
    <input type="submit" value="입력">
  </form>
</body>
</html>
