<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!--  errorPage="viewInError.jsp" -->
<jsp:useBean id="stk" class="stm.func.StkDTO" scope="request"/>
<jsp:setProperty property="*" name="stk"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewOutStk.jsp</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
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
  
  input[type="number"] {
    padding: 5px;
    width: 95%; /* 너비를 조정하여 셀 안에 맞도록 설정 */
  	box-sizing: border-box; /* 너비에 padding과 border 포함 */
  }
  
  input[type="date"] {
    padding: 5px;
    width: 100%; /* 너비를 조정하여 셀 안에 맞도록 설정 */
    box-sizing: border-box; /* 너비에 padding과 border 포함 */
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
	


<form id="form1" class="table-container" action="outStkAction.jsp" onsubmit="checkInput(form1)">
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
			<td><input type="number" name="price"></td>
			<td><input type="number" name="amount" id="amountInput" onchange="setCurrentStock()"></td>
        	<td><input type="text" name="inv_desc"></td>
		</tr>
	</table>
	<div class="button-container">
	 	<input type="submit" value="입력">
   	</div>
</form>
	<script>
	
// 	function checkInput(form){
// 		//var ~~~
// 		if(form.outStock.value>test){
// 			result = false;
// 			msg = "ㅊ루~~~~~"
// 		}
// 	}
	var jspURL = "outPopupAction.jsp"; // 여기에 JSP 파일의 경로를 넣으세요.
	var windowName = "select"; // 새 창의 이름
	var windowFeatures = "width=800,height=600,scrollbars=yes"; // 새 창의 속성
	
	// 새 창 열기
	var jspWindow = window.open(jspURL, windowName, windowFeatures);
	
	var table = document.querySelector('table');
	table.addEventListener('dblclick', function(event) {
	    var row = event.target.parentNode; // 더블 클릭한 열의 부모 행을 가져옵니다.
	    var cells = row.getElementsByTagName('td'); // 행의 모든 TD 셀을 가져옵니다.

	    // TD 셀의 값을 각각 가져와서 인풋 박스에 설정합니다.
	    //document.querySelector('input[name="item_code"]').value = cells[0].textContent;
	    //document.querySelector('input[name="item_name"]').value = cells[1].textContent;   
	    var currentStocks = cells[2].textContent;
	    console.log("현재 재고량: " + currentStocks);
	    // JavaScript로 amount 값을 가져옵니다.
	});

    var currentStocks = document.querySelector('input[name="amount"]');
    console.log("현재 재고량: " + currentStocks);
	function setCurrentStock() {
	    // 출고량 입력 필드 요소 가져오기   //지울 수 있는지 확인...!
	    var amountInput = document.querySelector('input[name="amount"]');
	    console.log(">>>" + document.querySelector('input[name="amount"]').value);
	    console.log(">>>" + parseInt(amountInput.value));
	    // board.getCur_stocks()를 가져올 수 있는 방법으로 수정해야 합니다.
	    // 예를 들어, 필요한 데이터를 서버에서 가져와서 JavaScript 변수로 저장할 수 있습니다.
	    var currentStocks = amountInput;// board.getCur_stocks() 대신 임의의 값을 사용합니다. 이 값을 필요에 맞게 수정하세요.
//	     alert(currentStocks + '::' + cells[2].textContent);
	    amountInput.addEventListener('input', function(event) {
	        var inputValue = parseInt(event.target.value); // 입력된 값 정수로 변환
	        
	        if (inputValue > currentStocks) {
	            // 출고량이 재고보다 큰 경우 입력을 막음
	            amountInput.setCustomValidity("출고량은 현재 재고보다 작거나 같아야 합니다.");
	        } else {
	            // 출고량이 조건을 만족하는 경우 입력 허용
	            amountInput.setCustomValidity("");
	        }
	    });
	}

	</script>
</body>
</html>