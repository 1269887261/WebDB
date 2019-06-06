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
您可以手动添加老师信息
<br>
教师姓名:<input id="tname" type="text">
<select id="title" class=" valid" name="JoinAssociation"   required="" aria-required="true" aria-invalid="false">
    <option value="-1">教师职称</option>
    <option value="0">院士</option>
    <option value="1">讲师</option>
    <option value="2">教授</option>
    <option value="3">副教授</option>
</select>
联系方式:<input id="phone" type="text">

<input type="submit" id="onAdd" value="添加">


<br>
<hr>
<br>
<table id="addRow" class="table table-hover" border="1">
    <tr >
        <td>教师姓名</td>
        <td>教师职称</td>
        <td>联系方式</td>
        <td>操作</td>
    </tr>

    <c:forEach  var="teacher" items="${sessionScope.teachers}">
        <tr class="stuList">
            <td>${teacher.tName}</td>
            <td>${teacher.title}</td>
            <td>${teacher.phone}</td>
            <td>
                <button onclick="onDelete(${teacher.tid})" type="button" class="btn btn-danger btn-default">删除</button>
            </td>
        </tr>

    </c:forEach>

</table>

<br>
<hr>
<br>




<script>

    function onSuccess(tname,title,phone) {


        var tr = "<tr  class=\"stuList success\">\n" +
            "            <td>"+tname+"</td>\n" +
            "            <td>"+title+"</td>\n" +
            "            <td>"+phone+"</td>\n" +
            "            <td>\n" +
            "                <button onclick=\"onDelete(${teacher.tid})\" type=\"button\" class=\"btn btn-danger btn-default\">删除</button>\n" +
            "            </td>\n" +
            "        </tr>";
        $("#addRow").append(tr);
        $(":button").click(function () {
            $(this).parent().parent().remove();
        });

    }

    function onDelete(tid) {
        $.ajax({
            type:'POST',
            url:'../manageTeacher.do',
            data:{
                tid:tid,
                status:'deleteTeacher'
            },
            success:alert("成功"),
            dataType:"json"
        });
    }


    $(document).ready(function(){


        $("#onAdd").click(function () {

            var tname = $("#tname").val();
            var title = $("#title").val();
            var phone = $("#phone").val();

            $.ajax({
                type:'POST',
                url:'../manageTeacher.do',
                data:{
                    tname:tname,
                    title:title,
                    phone:phone,
                    status:'addNewTeacher'
                },
                success:onSuccess(tname,title,phone),
                dataType:"json"
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
