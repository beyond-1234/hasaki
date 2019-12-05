<%--
  Created by IntelliJ IDEA.
  User: archer
  Date: 2019/11/13
  Time: 11:05 上午
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
    <title>Hasaki</title>
    <link rel="stylesheet" href="/hasaki_war_exploded/css/bootstrap.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/jquery-confirm.min.css">
</head>
<body>
    <%@include file="components/nav-top.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="page-header text-center">
                    最新帖子&回复
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <ul class="list-group">
                            <c:set var="limitLength" value="14"></c:set>
                            <c:forEach items="${topics}" var="topic">
                                <li class="list-group-item list-avatar">
                                    <a class="avatar-small" href="/hasaki_war_exploded/ucenter/userinfo/${topic.user.username}" style="background-image: url(/hasaki_war_exploded/${topic.user.avatar})"></a>
                                    <div>
                                        <a class="avatar-right" href="/hasaki_war_exploded/forum/t/${topic.id}">${topic.user.username}：
                                            <c:if test="${fn:length(topic.title) > limitLength }">
                                                ${fn:substring(topic.title, 0, limitLength)}...
                                            </c:if>
                                            <c:if test="${fn:length(topic.title) <= limitLength }">
                                                ${topic.title}
                                            </c:if>
                                         </a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <ul class="list-group">
                            <c:forEach items="${replies}" var="reply">
                                <li class="list-group-item list-avatar">
                                    <a class="avatar-small" href="/hasaki_war_exploded/ucenter/userinfo/${reply.user.username}" style="background-image: url(/hasaki_war_exploded/${reply.user.avatar})"></a>
                                    <div>
                                        <a class="avatar-right" href="/hasaki_war_exploded/forum/t/${reply.topicId}#r_${reply.id}">${reply.user.username}：
                                            <c:if test="${fn:length(reply.content) > limitLength}">
                                                ${fn:substring(reply.content, 0, limitLength)}...
                                            </c:if>
                                            <c:if test="${fn:length(reply.content) <= limitLength}">
                                                ${reply.content}
                                            </c:if>
                                        </a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div style="margin-bottom: 0" class="page-header text-center">
                    活跃用户
                </div>
                <div class="panel-body panel-avatar">
                    <c:forEach items="${hotUsers}" var="users">
                        <a class="avatar user-avatar" href="" style="background-image: url(/hasaki_war_exploded${users.avatar})"></a>
                    </c:forEach>
                </div>
                <div style="margin-top: 10px; margin-bottom: 0" class="page-header text-center">
                    最新用户
                </div>
                <div class="panel-body panel-avatar">
                    <c:forEach items="${newUsers}" var="newuser">
                        <a class="avatar user-avatar" href="" style="background-image: url(/hasaki_war_exploded${newuser.avatar})"></a>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="jumbotron">
            <h3>Hasaki</h3>
            <p>我们正在构建一个小众社区，大家在这里相互信任，以平等 • 自由 • 奔放的价值观进行分享交流。最终，希望大家能够找到与自己志同道合的伙伴，共同成长。</p>
            <button class="btn btn-success" onclick="document.location.href='/hasaki_war_exploded/register'">注册</button>
            <button class="btn btn-default">关于</button>
        </div>
    </div>
    <%@include file="components/footer.jsp"%>
    <script src="/hasaki_war_exploded/js/jquery-3.4.1.min.js"></script>
    <script src="/hasaki_war_exploded/js/bootstrap.js"></script>
    <script src="/hasaki_war_exploded/js/jquery-confirm.min.js"></script>
    <script src="/hasaki_war_exploded/js/hasaki.js"></script>
</body>
</html>
