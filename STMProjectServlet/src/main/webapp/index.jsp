<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 50px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            padding: 30px;
            width: 400px;
            height: 350px;
        }
        .container h1 {
            font-size: 45px;
            margin-bottom: 20px;
        }
        .container h2 {
            font-size: 30px;
            margin-bottom: 20px;
        }        
        .container table {
            margin: 0 auto;
        }
        .container table td {
            padding: 10px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>재고관리 시스템</h1>
        <h2>(주)강박상사</h2>
        <form action="login" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pwd"></td>
                </tr>
				<tr>
				    <td colspan="2">
				        <input type="submit" value="로그인">
				        <span style="margin-left: 10px;"></span>
				        <a href="registerLogin.html"><input type="button" value="회원가입"></a>
				    </td>
				</tr>
            	
            </table>
        </form>
    </div>
</body>
</html>
