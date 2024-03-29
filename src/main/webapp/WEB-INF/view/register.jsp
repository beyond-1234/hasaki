<%--
  Created by IntelliJ IDEA.
  User: archer
  Date: 2019/11/21
  Time: 2:42 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hasaki - 注册</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/jquery-confirm.min.css">
</head>
<body>
<%@include file="components/nav-top.jsp"%>
<div class="container">
    <div class="page-header">
        <h4>注册</h4>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title text-center">请完善您的信息</h3>
                </div>
                <div class="panel-body">
                    <div>
                        <div class="form-group">
                            <label for="email">邮箱</label>
                            <input type="email" class="form-control" id="email" placeholder="电子邮箱">
                        </div>
                        <div class="form-group">
                            <label for="user">用户名</label>
                            <input type="text" class="form-control" id="user" placeholder="用户名">
                        </div>
                        <div class="form-group">
                            <label for="pass">密码</label>
                            <input type="password" class="form-control" id="pass" placeholder="密码">
                        </div>
                        <div class="form-group">
                            <label for="confirm">确认密码</label>
                            <input type="password" class="form-control" id="confirm" placeholder="请再次输入密码">
                        </div>
                        <div class="form-group">
                            <label for="phone_num">手机号码</label>
                            <input type="text" class="form-control" id="phone_num" placeholder="请输入手机号">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input checked type="checkbox"> 同意本站协议
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input checked type="checkbox"> 允许本站通过邮件发送推送
                            </label>
                        </div>
                        <button id="register" class="btn btn-success btn-block" onclick="addUsers">立即注册</button>
                        <button class="btn btn-default btn-block">已有账号</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="components/footer.jsp"%>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery-confirm.min.js"></script>
<script src="js/hasaki.js"></script>
<script>
    $('#register').click(function addUser() {
        $.post(
            "register", {
                username: $('#user').val(),
                password: $('#pass').val(),
                confirm: $('#confirm').val(),
                email: $('#email').val(),
                phone_num: $('#phone_num').val(),
            }, function (data) {
                $.confirm({
                    theme: 'black',
                    title: '返回信息',
                    content: data
                })
            }
        )
    })
</script>
</body>
</html>
