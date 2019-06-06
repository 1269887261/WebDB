<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title></title>
        <meta content="width=device-width, initial-scale=1" name="viewport">
            <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
            <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
            <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
            <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
            <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
	</head>
	<body>
        <form role="form" action="login.do" method="post" class="mycenter" >
            <!-- 账号 -->
            <div class="input-group col-lg-4 inputbox">
              <span class="input-group-addon" id="basic-addon1">学号</span>
              <input type="text" name="sid" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
            </div>
            <!-- 密码 -->
            <div class="input-group col-lg-4 inputbox">
              <span class="input-group-addon" id="basic-addon2">密码</span>
              <input type="text" name="password" class="form-control" placeholder="password" aria-describedby="basic-addon1">
            </div>
            <button  type="submit" class="btn btn-primary inputbox col-lg-4">登陆</button>
        </form>
        <style type="text/css">
            .mycenter {
                position: absolute;
                left: 480px;
                top: 220px;
            } 
            .inputbox {
                margin: 10px;
            }
            .btn-primary{
                background: #1F9DD9;
                border: 1px solid #1F9DD9;
                color: #fff;
            }
        </style>
	</body>
</html>
