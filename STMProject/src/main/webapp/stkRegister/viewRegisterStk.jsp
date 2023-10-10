<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewRegisterStk.jsp</title>
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
<%
  // 카테고리 데이터 소스
  String[] categories = {"채소", "과일", "곡물", "육류", "어류", "가공식품", "기타"};
  
  // 제조사 데이터 소스
  String[] manufacturers = {"태림농수산","부광상회", "호랑식품","(주)나서스", "(주)농신","형배나이스","밥도묵고"};
%>
<form action="inRegisterStkAction.jsp">
<table style="width: 70%; border: 0;">
	<tr>
    	<td style="vertical-align: top;">
        	<img alt="사진을 등록하세요." src="0002.jpg" width="300">
      <br>
      <input type="file" name="imageFile">
    	</td>
    	<td style="vertical-align: top; border: 0;">
	<table border="1" style="width: 100%;">
	<tr>
    	<th>제품설명</th>
    </tr>
    <tr>
<!-- 	  <td><input type="text" name="item_desc"></td> -->
		<td><textarea type="text" name="item_desc" style="width: 100%; height: 300px; border: 0;"></textarea></td>
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
      <th>안전재고개수</th>
    </tr>
    <tr>
      <td><!-- 카테고리 콤보박스 -->
		<select name="category">
		  <%
		    for (String category : categories) {
		  %>
		    <option value="<%= category %>"><%= category %></option>
		  <%
		    }
		  %>
		</select>
	  </td>
      <td><input type="text" name="item_code"></td>
      <td><input type="text" name="item_name"></td>
      <td>
		<!-- 제조사 콤보박스 -->
		<select name="manufacturer">
		  <%
		    for (String manufacturer : manufacturers) {
		  %>
		    <option value="<%= manufacturer %>"><%= manufacturer %></option>
		  <%
		    }
		  %>
		</select>
      </td>
      <td><input type="text" name="min_stocks"></td>
    </tr>
  </table>
  <br>
  <div class="button-container">
    <input type="submit" value="입력">
  </div>
</form>

<script>
  function previewFile() {
    var preview = document.getElementById('previewImage');
    var file = document.getElementById('imageFile').files[0];
    var reader = new FileReader();

    reader.onload = function() {
      preview.src = reader.result;
    };

    if (file) {
      reader.readAsDataURL(file);
    }
  }
</script>

</body>
</html>
