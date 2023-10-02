<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="viewInError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewOutStk.jsp</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #fff;
            color: #000000;
            padding: 10px;
        }
        .table-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            background-color: #fff;
            border-radius: 5px;
        }
        table {
            width: 60%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        .no-data {
            text-align: center;
            padding: 20px;
        }

  input[type="text"] {
    padding: 5px;
    width: 95%; /* 너비를 조정하여 셀 안에 맞도록 설정 */
    box-sizing: border-box; /* 너비에 padding과 border 포함 */
  }
  
  input[type="date"] {
    padding: 5px;
    width: 100%; /* 너비를 조정하여 셀 안에 맞도록 설정 */
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

  .button-container {
    margin: 20px 0;
  }
</style>
</head>
<body>
    <div class="header">
        <h1>출고 입력</h1>
    </div>
	
<script>
	var jspURL = "outPopup.jsp"; // 여기에 JSP 파일의 경로를 넣으세요.
	var windowName = "select"; // 새 창의 이름
	var windowFeatures = "width=800,height=600,scrollbars=yes"; // 새 창의 속성
	
	// 새 창 열기
	var jspWindow = window.open(jspURL, windowName, windowFeatures);
	
	var table = document.querySelector('table');
	table.addEventListener('dblclick', function(event) {
	    var row = event.target.parentNode; // 더블 클릭한 열의 부모 행을 가져옵니다.
	    var cells = row.getElementsByTagName('td'); // 행의 모든 TD 셀을 가져옵니다.

	    // TD 셀의 값을 각각 가져와서 인풋 박스에 설정합니다.
	    document.querySelector('input[name="item_code"]').value = cells[0].textContent;
	    document.querySelector('input[name="item_name"]').value = cells[1].textContent;
	});
</script>

<form class="table-container" action="outStkAction.jsp">
	<table border="1">
		<tr>
			<th>출고코드</th>
			<th>제품코드</th>
			<th>제품명</th>
			<th>담당자명</th>
			<th>출고일자</th>
			<th>제조일자</th>
			<th>판매단가</th>
			<th>출고량</th>
			<th>비고</th>
		</tr>
		<tr>
<%-- 				<td align="justify"><%=i++ %></td> --%>
			<td><input type="text" name="inv_code"></td>
			<td><input type="text" name="item_code" style="background-color: #ccc;" readonly></td>
			<td><input type="text" name="item_name" style="background-color: #ccc;" readonly></td>
			<td><input type="text" name="job_charger"></td>
			<td><input type="date" name="inv_date" max="9999-12-31" min="1900-01-01" value = "2023-01-01"></td>
			<td><input type="date" name="made_date" max="9999-12-31" min="1900-01-01" value = "2023-01-01"></td>
			<td><input type="text" name="price"></td>
			<td><input type="text" name="amount"></td>
        	<td><input type="text" name="inv_desc"></td>
		</tr>
	</table>
	<div class="button-container">
	 	<input type="submit" value="입력">
   	</div>
</form>
</body>
</html>