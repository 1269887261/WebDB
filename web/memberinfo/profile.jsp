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
            <h2 id="public-profile-heading" class="Subhead-heading">Public profile</h2>
        </div>
        <div class="clearfix gutter d-flex flex-shrink-0">
            <div class="col-8">
                <form action="../showMemberinfo.do"  method="post"  accept-charset="UTF-8" class="edit_user" id="edit_user_39484031" aria-labelledby="public-profile-heading" >

                    <div>

                        <dl class="form-group">
                            <dt><label >姓名</label></dt>
                            <dd><input value="${sessionScope.stuName}" disabled class="form-control" type="text" name="stuName"></dd>
                        </dl>

                        <dl class="form-group">
                            <dt><label >社团昵称</label></dt>
                            <dd><input value="${sessionScope.stuInfo.stuNikeName}" class="form-control" type="text" name="stuNikeName"></dd>
                        </dl>


                        <dl class="form-group">
                            <dt><label for="user_profile_bio">个人简介</label></dt>
                            <dd class="user-profile-bio-field-container js-length-limited-input-container">
                                <textarea name="stuProfile" class="form-control user-profile-bio-field js-length-limited-input" placeholder="${sessionScope.stuInfo.stuProfile}"   ></textarea>
                                <p class="note">
                                    通过<strong>个人简介</strong>可以让他人更好地了解您
                                </p>
                                <p class="js-length-limited-input-warning user-profile-bio-message d-none"></p>
                            </dd>
                        </dl>

                        <dl class="form-group">
                            <dt><label for="user_profile_blog">兴趣爱好</label></dt>
                            <dd><input value="${sessionScope.stuInfo.stuInterest}" class="form-control" type="text" name="stuInterest" id="user_profile_blog"></dd>
                        </dl>

                        <dl class="form-group">
                            <dt><label for="user_profile_company">个人签名</label></dt>
                            <dd class="user-profile-company-field-container">
                                <input value="${sessionScope.stuInfo.stuSignature}" autocomplete="off"  type="text" name="stuSignature" id="user_profile_company">
                                <p class="note">
                                    You can <strong>@mention</strong> your company’s GitHub
                                    organization to link it.
                                </p>
                            </dd>
                        </dl>
                        <hr>
                        <dl class="form-group">
                            <dt><label for="user_profile_location">住址</label></dt>
                            <dd><input value="${sessionScope.stuInfo.stuAddress}" class="form-control" type="text" name="stuAddress" id="user_profile_location"></dd>
                        </dl>



                        <p><button type="submit" class="btn btn-success btn-default">更新简介</button></p>
                    </div>
                </form>
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

    .container {
        margin-left: auto;
        margin-right: auto;
        width: 980px;
    }
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
        background-color: #fafbfc;
        margin-right: 5px;
        max-width: 100%;
        width: 440px;
    }

    .form-group .form-control.user-profile-bio-field {
        height: 5.35em;
        min-height: 0;
        width: 440px;
    }
</style>

<script>

</script>
</body>
</html>
