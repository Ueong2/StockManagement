<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewRegisterStk.jsp</title>

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

<form action="inRegisterStkAction.jsp">
<!--  method="post" enctype="multipart/form-data" -->
<!-- <form action="inRegisterStkAction.jsp"> -->
<table border="0" style="width: 100%;">
  <tr>
    <td style="vertical-align: top;">
      <img alt="사진을 등록하세요." src="0002.jpg" width="300">
<!--       <br> -->
<!--       <input type="file" name="imageFile"> -->
    </td>
    <td style="vertical-align: top; padding-left: 20px;">
      <table border="1" style="width: 100%;">
			  <tr>
    <td>제품설명</td>
  </tr>
  <tr>
<!-- 	  <td><input type="text" name="item_desc"></td> -->
      <td><textarea type="text" name="item_desc" style="width: 300px; height: 250px;"></textarea></td>
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
		    <td>안전재고개수</td>
		</tr>
        <tr>
	        <td><input type="text" name="category"></td>
	        <td><input type="text" name="item_code"></td>
	        <td><input type="text" name="item_name"></td>
	        <td><input type="text" name="manufacturer"></td>
	        <td><input type="text" name="min_stocks"></td>
        </tr>
	</table>
		<br>
	    <div class="button-container">
	        <input type="submit" value="입력">
	    </div>
</form>
</body>
</html>
