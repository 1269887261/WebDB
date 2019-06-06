<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
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
              <span class="input-group-addon" id="basic-addon1">账号</span>
              <input type="text" name="username" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
            </div>
            <!-- 密码 -->
            <div class="input-group col-lg-4 inputbox">
              <span class="input-group-addon" id="basic-addon2">密码</span>
              <input type="text" name="password" class="form-control" placeholder="password" aria-describedby="basic-addon1">
            </div>
            <!-- 邮箱 -->
            <div class="input-group col-lg-4 inputbox">
              <input type="text" name="email" class="form-control" placeholder="Your email prefix" aria-describedby="basic-addon2">
              <span class="input-group-addon" id="basic-addon3">@zjut.edu</span>
            </div>
            
            <div class="input-group col-lg-4 inputbox">
              <span class="input-group-addon" id="basic-addon4">专业</span>
              <select class="form-control" name="speciaty">
                  <option value ="1">计算机</option>
                  <option value ="2">金融</option>
                  <option value ="3">机械</option>
                  <option value ="4">法学</option>
              </select>
            </div>  
           
            <!-- 单选框 -->
            <div class="radio inputbox">
           <label>
              <input type="radio" name="optionsRadios" id="optionsRadios1" 
                 value="option1" checked> 男
                 
           </label>
           <label>
         <input type="radio" name="optionsRadios" id="optionsRadios2" 
            value="option2">女
           </label>
            </div>
            
            <button  type="submit" class="btn btn-default inputbox col-lg-4">注册</button>
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
        </style>
	</body>
</html>
