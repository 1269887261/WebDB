<%--
  Created by IntelliJ IDEA.
  User: 90545
  Date: 2019/5/31
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Title</title>
</head>
<body>

<div class="header" style="background-image: url(images/large.png)">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="logotxt"><h1><a href="joinResponse.jsp">${sname}同学<br><span style="font-size:60%;font-weight:normal;">您成功提交了申请</span></a></h1></div>
            </div>
        </div>
        <a href="index.jsp">
            <input  type="button" class="btn btn-success btn-default" value="返回首页">
        </a>
    </div>
</div>

<div >
    <div class="mytext">我们已经收到了您的提交申请，相关社团的学长学姐很快就会处理啦，期待你的加入</div>
    <span class="glyphicon glyphicon-ok-sign col-lg-12" style="font-size: 63px;text-align: center"></span>
</div>

        <style type="text/css">

            .mytext {
                text-align: center;
                font-size: 34px;
                color: #ff97c1;
            }

            .container {
                padding-right: 15px;
                padding-left: 15px;
                margin-right: auto;
                margin-left: auto;
            }


            .logotxt a {
                font-weight: 700;
                color: #fff;
                font-size: 64px;
            }

            a {
                color: #337ab7;
                text-decoration: none;
            }
            .header {
                background: #222;
                background-repeat: no-repeat;
                background-position: center 0;
                -webkit-background-size: cover;
                background-size: cover;
                padding: 188px 0 0;
                text-align: center;
                min-height: 400px;
                position: relative;
            }
        </style>
</body>
</html>
