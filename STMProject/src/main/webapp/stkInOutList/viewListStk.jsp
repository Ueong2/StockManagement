<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="stm.func.*" %>
<jsp:useBean id="boards" type="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>재고 현황</title>
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
        .header h1 {
            font-size: 24px;
            margin: 0;
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
    </style>
</head>
<body>
    <div class="header">
        <h1>재고 현황</h1>
    </div>
    <div class="table-container">
        <table>
            <tr>
                <th>카테고리</th>
                <th>제품명</th>
                <th>제조사</th>
                <th>보유개수</th>
            </tr>
            <%  
                int i = 1;
                if (boards.size() == 0) {
            %>
            <tr>
                <td colspan="4" class="no-data">재고가 없습니다.</td>
            </tr>
            <%
                }
                for (Object o : boards) {
                    StkDTO board = (StkDTO) o;
            %>
            <tr>
                <td><%= board.getCategory() %></td>
                <td><a href="viewStkAction.jsp?item_code=<%= board.getItem_code() %>" target="right"><%= board.getItem_name() %></a></td>
                <td><%= board.getManufacturer() %></td>
                <td><%= board.getCur_stocks() %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
