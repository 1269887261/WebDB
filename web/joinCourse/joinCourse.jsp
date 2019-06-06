<%--
  Created by IntelliJ IDEA.
  User: 90545
  Date: 2019/6/2
  Time: 14:34
  课程报名
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/jquery.min.js"></script>
</head>
<body>

<section id="contact">
    <br>
    <div class="container">
        <div class="text-center">
            <span id="pic" class="glyphicon glyphicon-hand-down "></span>
        </div>
        <h2 class="text-center center thin">Tell us a little about yourself</h2>
        <p class="thin text-center">填一些你的个人喜好</p>

        <hr>
        <form name="signup_form" id="signupForm" method="post" action="postStudentInfo.do">
            <div class="row marketing">
                <div class="col-md-6  col-md-offset-3">
                    <div class="form-group">
                        <label for="BusinessName" hidden="">请求理由</label>
                        <input type="text" class="form-control" style="border-radius:0;" name="reason" id="gs_businessname" required="" autocomplete="off" aria-required="true" placeholder="申请理由">
                        <p id="e_businessname" class="error-msg hidden">Please enter your reason</p>
                    </div>
                    <div class="form-group">
                        <label for="Email" hidden="">对社团的看法</label>
                        <input type="text" class="form-control" style="border-radius:0;" name="idea" id="gs_email" required="" autocomplete="off" aria-required="true" placeholder="对社团的看法">
                        <p id="e_Email" class="error-msg hidden">Please enter your idea</p>
                    </div>


                    <label for="isSellingOnline">给自己取一个文艺的社名吧 </label>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="FirstName" hidden="">First Name</label>
                                <input type="text" class="form-control" style="border-radius:0;" name="FirstName" id="gs_fname" required="" autocomplete="off" aria-required="true" placeholder="First Name">
                                <p id="e_FirstName" class="error-msg hidden">Please enter your first name</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="LastName" hidden="">Last Name</label>
                                <input type="text" class="form-control" style="border-radius:0;" name="LastName" id="gs_lname" required="" autocomplete="off" aria-required="true" placeholder="Last Name">
                                <p id="e_LastName" class="error-msg hidden">Please enter your last name</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="City" hidden="">特长</label>
                                <input type="text" class="form-control" style="border-radius:0;" name="speciality" id="gs_city" autocomplete="off" aria-required="true" placeholder="特长">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="Phone" hidden="">联系方式</label>
                                <input hidden="" name="DateTime" type="text" id="DateTime" value="30/5/2019 @ 22:8:18">
                                <input type="tel" class="form-control" style="border-radius:0;" name="Phone" id="gs_phone" required="" autocomplete="off" aria-required="true" placeholder="联系方式">
                                <p id="e_Phone" class="error-msg hidden">Please enter a valid phone number</p>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="col-md-6 col-md-offset-3">
                    <div class="form-group">
                        <label for="isSellingOnline">你希望参加哪个社团，比如魔方社 </label>
                        <select class="form-control valid" name="JoinAssociation" id="primary" onchange="isSelling(this.value)" required="" aria-required="true" aria-invalid="false">
                            <option value="">你希望参加哪个社团，比如魔方社</option>
                            <option value="2">魔方社</option>
                            <option value="4">呆萌吉他社
                            </option>
                            <option value="1">春秋文学社
                            </option>
                            <option value="3">乒乓球社</option>
                            <option value="0">阿妮蛋糕社</option>
                            <option value="没有参加过">没有参加过
                            <option value="其它">其它</option>
                            </option>
                        </select>
                    </div>
                    <!-- If a user choose - I’m just exploring online business-->
                    <div class="form-group">
                        <label for="BusinessName">写下你的个人简介吧</label>
                        <input type="text" class="form-control" style="border-radius:0;" name="Introduction" id="gs_name" autocomplete="off" aria-required="true" placeholder="我喜欢唱、跳、rap、篮球">
                    </div>

                    <button type="submit" id="submit-signup" class="btn btn-sm btn-block btn-primary">Send
                        <span id="spiner" class="hidden fa fa-spinner fa-spin"></span>
                    </button>
                </div>
            </div>
        </form></div>

    <div class="clearfix last-panel"></div>

</section>

<style type="text/css">
    #pic {
        font-size: 45px;
    }
    .thin {
        font-family: 'Lato', sans-serif;
        font-weight: 300;
    }
    h5, .h5, h6, .h6, .h7 {
        margin-top: 20px;
        margin-bottom: 10px;
    }
    h2 {
        font-size: 47px;
        font-weight: 300;
        display: block;
    }

    body {
        color: #000;
        font-size: 18px;
        line-height: 27px;
        background: #fff;
        margin: 0;
    }
    .center {
        text-align: center;
    }
</style>

<script>


</script>

</body>
</html>
