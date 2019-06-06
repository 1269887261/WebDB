<%--
  Created by IntelliJ IDEA.
  User: 90545
  Date: 2019/5/28
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*,com.demo.model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head><title>显示所有商品</title></head>
<meta content="width=device-width, initial-scale=1" name="viewport">
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


<body >


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
<%--                    搜索框--%>
            <div class="navbar-header" style="margin-left: 2%;float: left">
                <span class="nav-search-dom">
                <input class="form-control search-control-input " placeholder="蛋糕">
<%--                <span style="float: right;height: 10px" class="glyphicon glyphicon-search"></span>--%>
                </span>

            </div>

            <c:set var="sname" scope="session" value="${sessionScope.student.sname}"/>

            <ul class="nav navbar-nav navbar-right pc-navbar-right hidden-xs">
                <li id="sign-in-item">
                    <a href="login.jsp">
                        <c:if test="${sname==null}">
                            登录
                        </c:if>

                    </a>
                </li>
                <li id="sign-up-item">
                    <a href="register.jsp">
                        <c:if test="${sname==null}">
                            注册
                        </c:if>
                    </a>
                </li>

                <li id="join-item">
                    <a href="joinRequest.jsp">
                        <c:if test="${sname!=null}">
                            join us
                        </c:if>
                    </a>
                </li>

                <li id="shopping-cart-summary-nav">
                    <%--          <a class="navbar-font-color" href="/shopping-cart">--%>
                    <%--            <i class="shopping-cart fa-"></i>--%>
                    <%--          </a>--%>
                <li><a href="#">${sname}</a></li>
                </li>


        </div><!--/.nav-collapse -->
    </div>
</nav>


<%--<div class="bg">--%>
<%--</div>--%>
<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="images/1544767868616.jpg" alt="First slide">
        </div>
        <div class="item">
            <img src="images/1556444594579.jpg" alt="Second slide">
        </div>
        <div class="item">
            <img src="images/1557286925504.jpg" alt="Third slide">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev"> <span _ngcontent-c3="" aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span></a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;</a>
</div>
<br>


<div class="row">
    <c:forEach var="course" items="${courses}">
    <!-- 1 -->
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img class="img-circle" src="images/fruit.png" alt="shoot">
            <div class="caption">
                <div class="tags-green"><b>DAILY</b></div>
                <h3 class="text-center">${course.cname}</h3>
                <p>${course.introduction}</p>
<%--                传入课程号--%>
                <a onclick="onJoinCourse('${course.cid}')"  class="col-xs-12  btn-susbcr" href="#">
                    Join course
                </a>
            </div>
        </div>
    </div>
        <%--    <!-- 2 -->--%>
        <%--    <div class="col-xs-8 col-md-3">--%>
        <%--        <div class="thumbnail">--%>
        <%--            <img class="img-circle" src="images/web2.jpg" alt="play">--%>
        <%--            <div class="caption">--%>
        <%--                <div class="tags"><b>WELCOME</b></div>--%>
        <%--                <h3 class="text-center">Inside Daily Brief</h3>--%>
        <%--                <p>A concise presentation of the world's most important, interesting news</p>--%>
        <%--                <a data-remote="true" data-disable-with="Opening ..." class="col-xs-12  btn-susbcr" href="/lists/venture-capital/subscription_modal">--%>
        <%--                    Join us--%>
        <%--                </a>--%>
        <%--            </div>--%>

        <%--        </div>--%>
        <%--    </div>--%>
        <%--    <!-- 3 -->--%>
        <%--    <div class="col-xs-8 col-md-3">--%>
        <%--        <div class="thumbnail">--%>
        <%--            <img class="img-circle" src="images/web3.png" alt="play">--%>
        <%--            <div class="caption">--%>
        <%--                <div class="tags"><b>HEART</b></div>--%>
        <%--                <h3 class="text-center">Inside Denver Slider</h3>--%>
        <%--                <p>The news, trends and tech that are reshaping the rapidly changing world of Denver</p>--%>
        <%--                <a data-remote="true" data-disable-with="Opening ..." class="col-xs-12  btn-susbcr" href="/lists/venture-capital/subscription_modal">--%>
        <%--                    Join us--%>
        <%--                </a>--%>
        <%--            </div>--%>

        <%--        </div>--%>
        <%--    </div>--%>
    </c:forEach>

</div>

<div>
<%--<table border="1" class="table table-hover">--%>

<%--    <tr><td>商品号</td><td>商品名</td><td>价格</td><td>数量</td></tr>--%>
<%--    <c:forEach items="${sessionScope.productList}" var="product" >--%>
<%--        <tr>--%>
<%--        <td>${product.prod_id}</td>--%>
<%--        <td>${product.pname}</td>--%>
<%--        <td>${product.price}</td>--%>
<%--        <td>${product.stock}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    <c:set var="salary" scope="session" value="${2000*2}"/>--%>
<%--    <c:if test="${salary > 2000}">--%>
<%--    <p>我的工资为: <c:out value="${salary}"/><p>--%>
<%--    </c:if>--%>
<%--</table>--%>
</div>
<style type="text/css">
    .bg {
        background: url("images/1544767868616.jpg");
        opacity: 0.95;
        width:841px;
        /*position:absolute;*/
        height: 307px;
    }

    .swiper-slide {
        -webkit-flex-shrink: 0;
        -ms-flex: 0 0 auto;
        /* flex-shrink: 0; */
        width: 100%;
        height: 100%;
        position: relative;
    }

    body {
        padding-top: 50px;
    }
    .starter-template {
        padding: 40px 15px;
        text-align: center;
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
    .active{
        color: darkgrey;
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

</style>

<script >
    $(function(){
        $('#myCarousel').carousel({interval:2000});
    })

    // 发起加入课程的请求
    function onJoinCourse(course) {
        $.ajax({
            type:'POST',
            url:'joinCourse.do',
            data:{
                cid:course,
                status:'joinCourse'
            },
            success:function () {
                alert("sss")
            },
            dataType:"json"
        });
    }
</script>
</body></html>
