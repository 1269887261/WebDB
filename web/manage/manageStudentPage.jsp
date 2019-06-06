<%--
  Created by IntelliJ IDEA.
  User: 90545
  Date: 2019/5/31
  Time: 22:03
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
    <script src="../js/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<a href="../manageClassPage.jsp">查看课程</a>
${sessionScope.association.id}社长，以下同学请求加入社团
<table class="table table-hover" border="1">
    <tr >
        <td>id</td>
        <td>reason</td>
        <td>idea</td>
        <td>othername</td>
        <td>speciality</td>
        <td>phone</td>
        <td>introduction</td>
        <td>操作</td>
    </tr>

    <c:forEach varStatus="userStatus" var="applier" items="${sessionScope.additionList}">
        <tr class="stuList">
            <td>${applier.id}</td>
            <td>${applier.reason}</td>
            <td>${applier.idea}</td>
            <td>${applier.othername}</td>
            <td>${applier.speciality}</td>
            <td>${applier.phone}</td>
            <td>${applier.introduction}</td>
            <td>
                <button onclick="onJoin('${applier.id}')" type="button" class="btn btn-success btn-default">同意加入</button>

                <button onclick="onDeny('${applier.id}')" type="button" class="btn btn-danger btn-default">拒绝加入</button>
            </td>
        </tr>

    </c:forEach>

</table>




<script>
    $(document).ready(function(){
        $(".stuList").addClass("success");
        $(":button").click(function () {
            $(this).parent().parent().remove();
            alert("成功")
        });
    });
    function onJoin(value) {
        $.ajax({
            type:'POST',
            url:'../manageStudent.do',
            data:{
                id:value,
                status:'join'
            },
            success:function () {

            },
            dataType:"json"
        });


    };
    function onDeny(value) {
        $.ajax({
            type:'POST',
            url:'../manageStudent.do',
            data:{
                id:value,
                status:'deny'
            },
            success:function () {

                console.log("success")
            },
            dataType:"json"
        });
    }
    function onPost() {
        $.ajax({
            type:'POST',
            url:'../manageClassPage.do',
            data:{
                id:3,
                status:'deny'
            },
            success:function () {

            },
            dataType:"json"
        });
    }
</script>

</body>
</html>
