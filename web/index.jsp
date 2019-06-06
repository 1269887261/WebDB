<%--
  Created by IntelliJ IDEA.
  User: 90545
  Date: 2019/5/27
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<jsp:useBean id="student" type="com.demo.model.Student" scope="session"></jsp:useBean>--%>
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


<nav class="navbar navbar-inverse navbar-fixed-top navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">Associations</a>
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
                <li class="dropdown-submenu">
<%--                  ManageStudentPageServlet--%>
                  <a  >管理</a>
                  <ul class="dropdown-menu">
                    <li><a href="manageClassPage.do">社团课程管理</a></li>
                    <li><a href="manageTeacher.do">教师管理</a></li>
                    <li><a href="manageStudent.do">学员</a></li>
                    <li><a href="manageStudent.do">社团信息管理</a></li>
                    <li><a href="manageStudent.do">选课学员管理</a></li>
                  </ul>
                </li>
              </c:if>
                <li>
                    <a href="" onclick="MyClick('${sname}')">课程报名</a>
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
<br>

<div class="row">
  <!-- 1 -->
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img class="img-circle" src="images/fruit.png" alt="shoot">
      <div class="caption">
        <div class="tags"><b>DAILY</b></div>
        <h3 class="text-center">阿妮蛋糕社</h3>
        <p>The latest deals, news, and firms in venture capital,sure money is our goal</p>
        <a href="displayCourses.do?assid=0" data-remote="true" data-disable-with="Opening ..." class="col-xs-12  btn-susbcr">
          Join us
        </a>
      </div>
    </div>
  </div>
  <!-- 2 -->
  <div class="col-xs-8 col-md-3">
    <div class="thumbnail">
      <img class="img-circle" src="images/web2.jpg" alt="play">
      <div class="caption">
        <div class="tags"><b>MAIL</b></div>
        <h3 class="text-center">Inside Daily Brief</h3>
        <p>A concise presentation of the world's most important, interesting news</p>
        <a data-remote="true" data-disable-with="Opening ..." class="col-xs-12  btn-susbcr" href="/lists/venture-capital/subscription_modal">
          Join us
        </a>
      </div>

    </div>
  </div>
  <!-- 3 -->
  <div class="col-xs-8 col-md-3">
    <div class="thumbnail">
      <img class="img-circle" src="images/web3.png" alt="play">
      <div class="caption">
        <div class="tags-green"><b>HEART</b></div>

        <h3 class="text-center">Inside Denver Slider</h3>
        <p>The news, trends and tech that are reshaping the rapidly changing world of Denver</p>
        <a data-remote="true" data-disable-with="Opening ..." class="col-xs-12  btn-susbcr" href="/lists/venture-capital/subscription_modal">
          Join us
        </a>
      </div>

    </div>
  </div>
  <!-- 4 -->
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img class="img-circle" src="images/web1.jpg" alt="shoot">
      <div class="caption">
        <div class="tags-green"><b>WELOCOME</b></div>
        <h3 class="text-center">Inside Venture Capital</h3>
        <p>The latest deals, news, and firms in venture capital,sure money is our goal</p>
        <a data-remote="true" data-disable-with="Opening ..." class="col-xs-12  btn-susbcr" href="/lists/venture-capital/subscription_modal">
          Join us
        </a>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

</script>
<style type="text/css">
  <%--  二级菜单--%>

  .dropdown-submenu {
    position: relative;
  }
  .dropdown-submenu > .dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: -6px;
    margin-left: -1px;
    -webkit-border-radius: 0 6px 6px 6px;
    -moz-border-radius: 0 6px 6px;
    border-radius: 0 6px 6px 6px;
  }
  .dropdown-submenu:hover > .dropdown-menu {
    display: block;
  }
  .dropdown-submenu > a:after {
    display: block;
    content: " ";
    float: right;
    width: 0;
    height: 0;
    border-color: transparent;
    border-style: solid;
    border-width: 5px 0 5px 5px;
    border-left-color: #ccc;
    margin-top: 5px;
    margin-right: -10px;
  }
  .dropdown-submenu:hover > a:after {
    border-left-color: #fff;
  }
  .dropdown-submenu.pull-left {
    float: none;
  }
  .dropdown-submenu.pull-left > .dropdown-menu {
    left: -100%;
    margin-left: 10px;
    -webkit-border-radius: 6px 0 6px 6px;
    -moz-border-radius: 6px 0 6px 6px;
    border-radius: 6px 0 6px 6px;
  }

<%--  二级菜单--%>
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

  .newsletters {
    position: relative;
  }

  .row {
    margin-left: -15px;
    margin-right: -15px;
  }

  .infoheader {
    margin-top: 10px;
    margin-bottom: 10px;
  }


  .btn-susbcr {
    background-color: #fff;
    border-radius: 5px;
    border: 2px solid #ebe8e7;
    padding: 7px;
    width: 100%;
    text-align: center;
    transition: all .5s ease-out;
    color: #8d8d8d;
    cursor: pointer;
  }

  .btn-susbcr:hover {

    border:2px solid #b2de80;
    background: #fcf8e3;
  }

  .tags-green {
    background-color: #d3fff1;
    border-radius: 6px;
    font-size: 10px;
    max-width: 58px;
    position: absolute;
    right: 0;
    text-align: center;
    top: 0;
    width: auto;
    color: #08ff44;
    padding: 5px 8px;
    min-height: 19px;
  }

  .tags {
    background-color: #ffeee5;
    border-radius: 6px;
    font-size: 10px;
    max-width: 58px;
    position: absolute;
    right: 0;
    text-align: center;
    top: 0;
    width: auto;
    color: #ff5c03;
    padding: 5px 8px;
    min-height: 19px;
  }
a{
    text-decoration: none;
}

  lable{
    text-decoration: none;

  }

</style>

<link rel="stylesheet" href="js/jquerysession.js">
<script>

  function MyInvalidate() {
    $.post("exit.do")
    console.log("sss")
  }

  function MyClick(a) {

     alert(a)
  }
</script>
</body>


</html>
