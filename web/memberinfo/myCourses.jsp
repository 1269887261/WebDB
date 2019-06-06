<%--
  Created by IntelliJ IDEA.
  User: 90545
  Date: 2019/6/2
  Time: 14:34
  To change this template use File | Settings | File Templates.
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

<nav class="navbar navbar-inverse navbar-fixed-top navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../index.jsp">Associations</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="fa fa-map-marker"></span>
                        杭州
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="/cities/beijing">北京</a>
                        </li>
                        <li>
                            <a href="/cities/shanghai">上海</a>
                        </li>
                        <li>
                            <a href="/cities/tianjin">天津</a>
                        </li>
                        <li>
                            <a href="/cities/suzhou">苏州</a>
                        </li>
                        <li>
                            <a href="/newCities">无锡／南京／宁波</a>
                        </li>
                        <li>
                            <a href="/cities/othercities">全国</a>
                        </li>
                    </ul>
                </li>
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>

            </ul>
            <div class="navbar-header" style="margin-left: 2%;float: left">
                <span class="nav-search-dom">
                <input class="form-control search-control-input " placeholder="春秋文学社">
                    <!-- <span style="float: right;height: 10px" class="glyphicon glyphicon-search"></span> -->
                </span>

            </div>
            <c:set var="sname" scope="session" value="${sessionScope.student.sname}"/>

            <ul class="hide1 nav navbar-nav navbar-right pc-navbar-right hidden-xs">
                <c:if test="${sname==null}">
                    <li id="sign-in-item">
                        <a href="login.jsp">
                            <c:if test="${sname==null}">
                                登录
                            </c:if>

                        </a>
                    </li>
                </c:if>

                <c:if test="${sname==null}">
                    <li id="sign-up-item">
                        <a href="register.jsp">
                            <c:if test="${sname==null}">
                                注册
                            </c:if>
                        </a>
                    </li>
                </c:if>


                <c:if test="${sname!=null}">
                    <li><a href="#">${sname}</a></li>
                </c:if>


                <%--          下拉选项--%>

                <c:if test="${sname!=null}">
                    <li  class="de dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <span class="fa fa-map-marker"></span>
                            提醒(${3})
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="#" onclick="MyClick('${sname}')">消息</a>
                            </li>
                            <c:if test="${sessionScope.isCaptain}">
                                <li>
                                        <%--                  ManageStudentPageServlet--%>
                                    <a href="manageStudent.do">管理</a>
                                </li>
                            </c:if>
                            <li>
                                <a href="#" onclick="MyClick('${sname}')">课程报名</a>
                            </li>
                            <li>
                                    <%--                --%>
                                <a href="showMemberinfo.do">我的信息</a>
                            </li>

                        </ul>
                    </li>
                </c:if>

                <%--        退出--%>
                <c:if test="${sname!=null}">
                    <li class="de">
                        <a id="myc" href="index.jsp" onclick="MyInvalidate('${sname}')" >退出</a>
                    </li>
                </c:if>

            </ul>

        </div><!--/.nav-collapse -->
    </div>
</nav>
<br>
<br>
<div class="page-content container clearfix">

    <div class="col-3 float-left pr-4">
        <nav class="menu" aria-label="Personal settings" data-pjax="">
            <h3 class="menu-heading">
                Personal settings
            </h3>

            <a class="js-selected-navigation-item menu-item" data-selected-links="avatar_settings /settings/profile" href="profile.jsp">Profile</a>
            <a class="js-selected-navigation-item menu-item" aria-current="page" data-selected-links=" /settings/admin" href="displayMyCourses.do">My Courses</a>

            <a class="js-selected-navigation-item menu-item" data-selected-links=" /settings/emails" href="/settings/emails">
                Emails
            </a>
            <a class="js-selected-navigation-item menu-item" data-selected-links=" /settings/notifications" href="/settings/notifications">Notifications</a>

            <a class="js-selected-navigation-item menu-item" data-selected-links="user_billing_settings /settings/billing" href="/settings/billing">Billing</a>

            <a class="js-selected-navigation-item menu-item" data-selected-links="ssh_certificate_authorities /settings/keys" href="/settings/keys">SSH and GPG keys</a>

            <a class="js-selected-navigation-item menu-item" data-selected-links=" /settings/security" href="/settings/security">Security</a>

            <a class="js-selected-navigation-item menu-item" data-selected-links=" /settings/sessions" href="/settings/sessions">Sessions</a>

            <a class="js-selected-navigation-item menu-item" data-selected-links=" /settings/blocked_users" href="/settings/blocked_users">Blocked users</a>

            <a class="js-selected-navigation-item menu-item" data-selected-links=" /settings/repositories" href="/settings/repositories">Repositories</a>
            <a class="js-selected-navigation-item menu-item" data-selected-links=" /settings/organizations" href="/settings/organizations">Organizations</a>
            <a class="js-selected-navigation-item menu-item" data-selected-links="edit_saved_reply /settings/replies" href="/settings/replies">Saved replies</a>

            <a class="js-selected-navigation-item menu-item" data-selected-links="applications_settings /settings/installations" href="/settings/installations">Applications</a>

        </nav>

        <nav class="menu" aria-label="Developer settings">
            <a class="menu-item" href="/settings/apps">
                Developer settings
            </a>  </nav>


    </div>

    <div class="col-9 float-left">

        <!-- Public Profile -->
        <div class="Subhead mt-0 mb-0">
            <h2 id="public-profile-heading" class="Subhead-heading">My Courses</h2>
        </div>
        <div class="clearfix gutter d-flex flex-shrink-0">
            <div class="col-8">

<%--                <form  accept-charset="UTF-8" class="edit_user" id="edit_user_39484031" aria-labelledby="public-profile-heading" action="showMemberinfo.do"  method="post">--%>

<%--                    <div>--%>

<%--                        <dl class="form-group">--%>
<%--                            <dt><label >姓名</label></dt>--%>
<%--                            <dd><input value="${sessionScope.stuName}" disabled class="form-control" type="text" name="stuName"></dd>--%>
<%--                        </dl>--%>

<%--                        <dl class="form-group">--%>
<%--                            <dt><label >社团昵称</label></dt>--%>
<%--                            <dd><input value="${sessionScope.stuInfo.stuNikeName}" class="form-control" type="text" name="stuNikeName"></dd>--%>
<%--                        </dl>--%>


<%--                        <dl class="form-group">--%>
<%--                            <dt><label for="user_profile_bio">个人简介</label></dt>--%>
<%--                            <dd class="user-profile-bio-field-container js-length-limited-input-container">--%>
<%--                                <textarea name="stuProfile" class="form-control user-profile-bio-field js-length-limited-input" placeholder="${sessionScope.stuInfo.stuProfile}"   ></textarea>--%>
<%--                                <p class="note">--%>
<%--                                    通过<strong>个人简介</strong>可以让他人更好地了解您--%>
<%--                                </p>--%>
<%--                                <p class="js-length-limited-input-warning user-profile-bio-message d-none"></p>--%>
<%--                            </dd>--%>
<%--                        </dl>--%>

<%--                        <dl class="form-group">--%>
<%--                            <dt><label for="user_profile_blog">兴趣爱好</label></dt>--%>
<%--                            <dd><input value="${sessionScope.stuInfo.stuInterest}" class="form-control" type="text" name="stuInterest" id="user_profile_blog"></dd>--%>
<%--                        </dl>--%>

<%--                        <dl class="form-group">--%>
<%--                            <dt><label for="user_profile_company">个人签名</label></dt>--%>
<%--                            <dd class="user-profile-company-field-container">--%>
<%--                                <input value="${sessionScope.stuInfo.stuSignature}" autocomplete="off"  type="text" name="stuSignature" id="user_profile_company">--%>
<%--                                <p class="note">--%>
<%--                                    You can <strong>@mention</strong> your company’s GitHub--%>
<%--                                    organization to link it.--%>
<%--                                </p>--%>
<%--                            </dd>--%>
<%--                        </dl>--%>
<%--                        <hr>--%>
<%--                        <dl class="form-group">--%>
<%--                            <dt><label for="user_profile_location">住址</label></dt>--%>
<%--                            <dd><input value="${sessionScope.stuInfo.stuAddress}" class="form-control" type="text" name="stuAddress" id="user_profile_location"></dd>--%>
<%--                        </dl>--%>



<%--                        <p><button type="submit" class="btn btn-success btn-default">更新简介</button></p>--%>
<%--                    </div>--%>
<%--                </form>--%>

    <br>
    <br>

    <table class="table table-hover" border="1">
        <tr >
            <td>课程号</td>
            <td>课程名称</td>
            <td>人数</td>
            <td>授课老师</td>
            <td>课程归属</td>
            <td>课程介绍</td>
            <td>操作</td>
        </tr>

        <c:forEach varStatus="userStatus" var="course" items="${sessionScope.MyCourseList}">
            <tr class="stuList">
                <td>${course.cid}</td>
                <td>${course.cname}</td>
                <td>${course.maxnum}</td>
                <td>${course.tName}</td>
                <td>${course.assname}</td>
                <td>${course.introduction}</td>
                <td>
<%--                    <button onclick="onJoin('${applier.id}')" type="button" class="btn btn-success btn-default">同意加入</button>--%>

                    <button onclick="onQuitCourse(${course.cid})" type="button" class="btn btn-danger btn-default">退出课程</button>
                </td>
            </tr>

        </c:forEach>

    </table>


            </div>



        </div>

        <style type="text/css">

            .menu-item.selected {
                background-color: #fff;
                color: #24292e;
                cursor: default;
                font-weight: 600;
            }

            .menu-item {
                border-bottom: 1px solid #e1e4e8;
                display: block;
                padding: 8px 10px;
                position: relative;
            }

            .page-content {
                padding-top: 20px;
            }

            /*.container {*/
            /*    margin-left: auto;*/
            /*    margin-right: auto;*/
            /*    width: 980px;*/
            /*}*/
            .col-9 {
                width: 75%;
            }
            .pr-4 {
                padding-right: 24px!important;
            }

            .float-left {
                float: left!important;
            }

            .col-3 {
                width: 25%;
            }

            .menu {
                background-color: #fff;
                border: 1px solid #d1d5da;
                border-radius: 3px;
                list-style: none;
                margin-bottom: 15px;
            }

            .menu-heading:first-child {
                border-top-left-radius: 2px;
                border-top-right-radius: 2px;
            }

            .note {
                color: #586069;
                font-size: 12px;
                margin: 4px 0 2px;
                min-height: 17px;
            }

            a{
                text-decoration: none;
            }
            form {
                display: block;
                margin-top: 0em;
            }
            .form-group {
                margin: 15px 0;
            }


            .form-control {
                display: block;
                width: 100%;
                height: 34px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.42857143;
                color: #555;
                background-color: #fff;
                background-image: none;
                border: 1px solid #ccc;
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            }



            .navbar-default {
                background-color: #390C20;
                border-color: #390C20;
            }

            .navbar-header {
                float: left;
            }

            .navbar-nav {
                float: left;
            }

            .navbar-header .nav-search-dom .form-control {
                border-radius: 20px;
                height: 30px;
                margin-top: 10px;
            }

            .navbar-right {
                float: right!important;
                /*margin-right: -15px;*/
            }


            a{
                text-decoration: none;
            }

        </style>

        <script>


            $(document).ready(function(){
                $(".stuList").addClass("success");
                $(":button").click(function () {
                    $(this).parent().parent().remove();
                    alert("成功")
                });
            });

            // 退出课程
            function onQuitCourse(value) {
                $.ajax({
                    type:'POST',
                    url:'../StuQuitCourse.do',
                    data:{
                        cid:value,
                        status:'quit'
                    },
                    success:function () {

                    },
                    dataType:"json"
                });
            }
        </script>

</body>
</html>
