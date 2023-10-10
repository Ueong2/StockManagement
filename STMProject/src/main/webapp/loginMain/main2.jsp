<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        /* Reset margin and padding for the whole document */
        * {
            margin: 0;
            padding: 0;
        }

        #top {
        	height: 150px;
            width: 100%;
            background-color: #f0f0f0;
            text-align: center;
            border-bottom: 1px solid black;
        }

        #top iframe {
            max-width: 100%;
            width: 100%;
            border: none;
        }

        #frameset {
            display: flex;
            flex: 1;
            overflow: hidden;
        }

        #left, #right {
            height: 100%;
            border: none;
        }

        #left {
            width: 200px;
            height: 770px; /* 좌측 프레임의 전체 높이 사용 */
            float: left;
            border-right: 1px solid black;
        }

        #right {
        	width: 100%;
            height: 770px;
            background-color: #ffffff;
        }
        
    </style>
</head>
<body>
    <div id="top">
        <!-- Include your top.jsp content here -->
        <iframe src="top2.jsp" name="top" frameborder="0" scrolling="no"></iframe>
    </div>
    <div id="frameset">
        <iframe id="left" src="left2.jsp" name="left2" frameborder="0" scrolling="no"></iframe>
        <iframe id="right" src="<%=request.getContextPath()%>/stkStatus/listStkAction.jsp" name="right" scrolling="auto"></iframe>
    </div>
</body>
</html>
