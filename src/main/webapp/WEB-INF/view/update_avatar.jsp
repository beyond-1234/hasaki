<%--
  Created by IntelliJ IDEA.
  User: Tao
  Date: 2019/11/28
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/hasaki_war_exploded/css/bootstrap" rel="stylesheet">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/bootstrap.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/jquery-confirm.min.css">
    <script src="/hasaki_war_exploded/js/jquery-3.4.1.min.js"></script>
    <script src="/hasaki_war_exploded/js/bootstrap.js"></script>

    <title>Hasaki ›更换头像</title>
</head>
<body>

<%@ include file="components/nav-top.jsp"%>

<div style="width: 75%;margin:4% 2% 4.5% 12%;float: left;">
    <div class="panel panel-default" id="main" style="dis">
        <div class="panel-heading" style="background-color: white">
            <a href="/">Hasaki</a> › 设置 ›头像上传
        </div>

        <div class="panel-body">

            <form action="/hasaki_war_exploded/ucenter/settings/avatar/update"enctype="multipart/form-data" method="post" class="form-horizontal" role="form">
                <div style="margin-left: 17%; margin-top: 4%">
                    <img width="60px" height="60px" src="/hasaki_war_exploded/${user.avatar}" class="img-rounded">
                    <input type="file"  name="avatar" accept="image/png,image/jpeg,image/jpg" style="margin-top: 3.5%" >
                    <br/>
                    <input class="btn btn-default" type="submit" value="上传头像" style="margin-top: 3%; margin-bottom: 5%;">

                </div>
            </form>

        </div>
        <a href="/hasaki_war_exploded/ucenter/settings" style="margin-left: 20%;margin-top: -5%; color: #1d3e81; font-size: 15px">返回</a>
    </div>

</div>

<%@ include file="components/footer.jsp"%>

</body>
</html>
