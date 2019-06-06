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
您可以手动添加课程
<br>
    课程名:<input id="cname" type="text">
    人数限制:<input id="maxnum" type="text">
    <select id="teacherid" class=" valid" name="JoinAssociation"   required="" aria-required="true" aria-invalid="false">
        <option value="-1">授课教师</option>
        <c:forEach var="teacher" items="${sessionScope.teachers}">
            <option value="${teacher.tid}">${teacher.tName}</option>
        </c:forEach>
    </select>
    课程介绍:<input id="introduction" type="text">

    <input type="submit" id="onAdd" value="添加">


<br>
<hr>
<br>
<table id="addRow" class="table table-hover" border="1">
    <tr >
        <td>课程号</td>
        <td>课程名</td>
        <td>授课教师</td>
        <td>人数限制</td>
        <td>课程介绍</td>
        <td>操作</td>
    </tr>

    <c:forEach varStatus="userStatus" var="course" items="${sessionScope.courses}">
        <tr class="stuList">
            <td>${course.cid}</td>
            <td>${course.cname}</td>
            <td>${course.teacherid}</td>
            <td>${course.maxnum}</td>
            <td>${course.introduction}</td>
            <td>
                <button onclick="oncancel(${course.cid})" type="button" class="btn btn-danger btn-default">取消课程</button>
            </td>
        </tr>

    </c:forEach>

</table>

<br>
<hr>
<br>




<script>

    function onCancel(cid) {
        $.ajax({
            type:'POST',
            url:'../manageClassPage.do',
            data:{
                cid:cid,
                status:'cancelCourse'
            },
            success:onSuccess(0,cname,teacherid,maxnum,introduction),
            dataType:"json",

        });
    }


    function onSuccess(cid,cname,teacherid,maxnum,introduction) {


        var tr = "<tr  class=\"stuList success\">\n" +
            "            <td>"+cid+"</td>\n" +
            "            <td>"+cname+"</td>\n" +
            "            <td>"+teacherid+"</td>\n" +
            "            <td>"+maxnum+"</td>\n" +
            "            <td>"+introduction+"</td>\n" +
            "            <td>\n" +
            "                <button onclick=\"onCancel('${applier.cid}')\" type=\"button\" class=\"btn btn-danger btn-default\">取消课程</button>\n" +
            "            </td>\n" +
            "        </tr>";
        $("#addRow").append(tr);
        $(":button").click(function () {
            $(this).parent().parent().remove();
        });

    }

    $(document).ready(function(){


        $("#onAdd").click(function () {

            var maxnum = $("#maxnum").val();
            var cname = $("#cname").val();
            var teacherid = $("#teacherid").val();
            var introduction = $("#introduction").val();

            $.ajax({
                type:'POST',
                url:'../manageClassPage.do',
                data:{
                    maxnum:maxnum,
                    cname:cname,
                    teacherid:teacherid,
                    introduction:introduction,
                    status:'addNewCourse'
                },
                success:onSuccess(0,cname,teacherid,maxnum,introduction),
                dataType:"json",

            });
        });

        $(".stuList").addClass("success");
        $(":button").click(function () {
            $(this).parent().parent().remove();
            alert("成功")
        });
    });

</script>


</body>
</html>
