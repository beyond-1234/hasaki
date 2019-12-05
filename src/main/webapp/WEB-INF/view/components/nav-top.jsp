<%--
  Created by IntelliJ IDEA.
  User: archer
  Date: 2019/11/14
  Time: 1:44 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Hasaki</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li <c:if test="${now == 'home'}">class="active"</c:if>><a href="/hasaki_war_exploded/forum">门户</a></li>
                <li <c:if test="${now == 'forum'}">class="active"</c:if>><a href="/hasaki_war_exploded/forum/tags">论坛</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <c:if test="${userId == null}">
                <form class="navbar-form navbar-right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">登录</button>
                    <button onclick="document.location.href='/hasaki_war_exploded/register'" type="button" class="btn btn-success">注册</button>
                </form>
            </c:if>
            <c:if test="${userId != null}">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden-sm"><img src="/hasaki_war_exploded${avatar}" style="border-radius: 50%; height: 35px; margin-top: 19%"> | </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${username} <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/hasaki_war_exploded/ucenter/userinfo/${username}">个人中心</a></li>
                            <li><a href="/hasaki_war_exploded/ucenter/settings">修改信息</a></li>
                            <c:if test="${role == 1}">
                                <li role="separator" class="divider"></li>
                                <li><a href="/hasaki_war_exploded/admin/userCenter">用户管理</a></li>
                                <li><a href="/hasaki_war_exploded/admin/userCenter">帖子管理</a></li>
                                <li><a href="/hasaki_war_exploded/admin/userCenter">回复管理</a></li>
                            </c:if>
                            <li role="separator" class="divider"></li>
                            <li><a href="/hasaki_war_exploded/signout">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </c:if>
        </div><!--/.navbar-collapse -->
    </div>
</nav>
<!-- Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="loginLabel">账号登录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="username" placeholder="请输入你的用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input id="remember" type="checkbox"> 15天内免登录
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="submit" type="button" class="btn btn-success">登录</button>
            </div>
        </div>
    </div>
</div>

