<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="stm.func.*" %>
<jsp:useBean id="boards" type="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>viewInPopup.jsp</title>
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
            justify-content: center;
  			text-align: center;
            background-color:#fff;
            border-radius: 5px;
           	
        }
        table {
            width: 60%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        .no-data {
            text-align: center;
            padding: 20px;
        }
        table tr:hover {
        background-color: #ccc; /* 마우스 호버시 배경색을 회색(#ccc)으로 변경합니다. */
    	}
    </style>
</head>
<body>
	<!-- 팝업창 정보 집어넣기 -->
    <script>
        // JavaScript 코드를 추가합니다.
        window.onload = function() {
            // 테이블에서 더블 클릭 이벤트를 감지합니다.
            var table = document.querySelector('table');
            table.addEventListener('dblclick', function(event) {
                var row = event.target.parentNode; // 더블 클릭한 열의 부모 행을 가져옵니다.
                var cells = row.getElementsByTagName('td'); // 행의 모든 TD 셀을 가져옵니다.

                // 부모 창의 인풋 박스에 값을 전달합니다.
                window.opener.document.querySelector('input[name="item_code"]').value = cells[0].textContent;
                window.opener.document.querySelector('input[name="item_name"]').value = cells[1].textContent;

                // 팝업 창을 닫습니다.
                window.close();
            });
        };
    </script>
    <div class="header">
        <h1>입고 제품 선택</h1>
    </div>
    <div class="table-container">
        <table>
            <tr>
                <th>제품코드</th>
                <th>제품명</th>
                <th>보유개수</th>
            </tr>
            
            
            <%  
                int i = 1;
                if (boards.size() == 0) {
            %>
            <tr>
			    <td colspan="11" class="no-data">입고 가능한 제품이 없습니다. 제품을 등록하세요.</td>
			</tr>
			<%
                }
                for (Object o : boards) {
                    StkDTO board = (StkDTO) o;
            %>
            <tr>
                <td><%= board.getItem_code() %></td>
                <td><%= board.getItem_name() %></td>
                <td><%= board.getCur_stocks() %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
