<%--
  Created by IntelliJ IDEA.
  User: Tao
  Date: 2019/11/27
  Time: 14:35
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
    <script src="/hasaki_war_exploded//js/bootstrap.js"></script>

    <title>Hasaki › <c:if test="${!empty userInfo}">${userInfo.username}</c:if><c:if test="${!empty errorInfo}">会员未找到</c:if></title>
</head>
<body>

<%@ include file="components/nav-top.jsp"%>

<div style="width: 75%; height: auto; margin:0.4% 30% 0% 5%;float: left;">
    <div class="panel panel-default" id="main" style="margin-left: 15%; margin-top: 2%">
        <div class="panel-heading" style="background-color: white">
            <a href="/hasaki_war_exploded/forum">Hasaki</a> › ${userInfo.username}
        </div>

        <div class="panel-body">
            <c:if test="${!empty userInfo}">
                <form class="form-horizontal" role="form"><br>
                    <div style="margin-left: 15%">
                        <img width="60px" height="60px" src="/hasaki_war_exploded/${userInfo.avatar}" class="img-rounded">
                        <%--<a class="btn btn-default" href="/settings/avatar" role="button" style="margin-left: 28%">更换头像</a>--%>
                    </div><br/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">uid</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${userInfo.id}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${userInfo.username}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" style="display: inline-block">${userInfo.phoneNum}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" style="display: inline-block">${userInfo.email}</p>
                            <%--<a class="btn btn-default" href="/settings/avatar" role="button" style="margin-left: 17%; display: inline-block">更换邮箱</a>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">注册时间</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${userInfo.localCreateTime}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">积分</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${userInfo.credit}</p>
                        </div>
                    </div>
                </form>
            </c:if>
            <c:if test="${!empty errorInfo}">
                会员未找到!
            </c:if>
        </div>
    </div>
</div>

<%@ include file="components/footer.jsp"%>

</body>
</html>
