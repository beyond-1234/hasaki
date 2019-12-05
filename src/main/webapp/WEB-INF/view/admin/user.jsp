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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="renderer" content="webkit">
    <title>后台管理 - 用户管理</title>
        <meta name="keywords" content="">
        <meta name="description" content="">

        <!--[if lt IE 9]>
        <meta http-equiv="refresh" content="0;ie.html" />
        <![endif]-->

        <link rel="shortcut icon" href="/hasaki_war_exploded/img/favicon.ico"><link href="/hasaki_war_exploded/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/hasaki_war_exploded/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/hasaki_war_exploded/css/animate.css" rel="stylesheet">
    <link href="/hasaki_war_exploded/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <strong class="font-bold">HasaKi</strong>
                                    </span>
                                </span>
                        </a>
                    </div>
                    <div class="logo-element">hAdmin
                    </div>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">分类</span>
                </li>
                <br>
                <li>
                    <a class="J_menuItem" href="/hasaki_war_exploded/admin/user">
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <br>
                <li>
                    <a class="J_menuItem" href="/hasaki_war_exploded/admin/user">
                        <span class="nav-label">用户管理</span>
                    </a>
                </li>
                <br>
                <li>
                    <a class="J_menuItem" href="/hasaki_war_exploded/admin/topic">
                        <span class="nav-label">帖子管理</span>
                    </a>
                </li>
                <br>
                <li>
                    <a class="J_menuItem" href="/hasaki_war_exploded/admin/reply">
                        <span class="nav-label">评论管理</span>
                    </a>
                </li>
                <li class="line dk"></li>

            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li <c:if test="${now == 'home'}">class="active"</c:if>><a href="/hasaki_war_exploded/forum" style="font-size: 15px">门户</a></li>
                        <li <c:if test="${now == 'forum'}">class="active"</c:if>><a href="/hasaki_war_exploded/forum/tags" style="font-size: 15px">论坛</a></li>
                        <li><a href="#contact" style="font-size: 15px">Contact</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right" style="margin-left: 50%">
                        <li class="hidden-sm"><img src="/hasaki_war_exploded${avatar}" style="border-radius: 50%; height: 35px; margin-top: 19%"> | </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${username} <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/hasaki_war_exploded/ucenter/userinfo/${username}">个人中心</a></li>
                                <li><a href="/hasaki_war_exploded/ucenter/settings">修改信息</a></li>
                                <c:if test="${role == 1}">
                                    <li role="separator" class="divider"></li>
                                    <li><a href="/hasaki_war_exploded/admin/user">用户管理</a></li>
                                    <li><a href="/hasaki_war_exploded/">帖子管理</a></li>
                                    <li><a href="/hasaki_war_exploded/">回复管理</a></li>
                                </c:if>
                                <li role="separator" class="divider"></li>
                                <li><a href="/hasaki_war_exploded/signout">退出登录</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <%--<iframe id="J_iframe" width="100%" height="100%" src="index_v1.html?v=4.0" frameborder="0" data-id="index_v1.html" seamless></iframe>--%>
                <iframe id="J_iframe" width="100%" height="100%" src="/hasaki_war_exploded/admin/user" frameborder="0"></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>

<!-- 全局js -->
<script src="/hasaki_war_exploded/js/jquery.min.js?v=2.1.4"></script>
<script src="/hasaki_war_exploded/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/hasaki_war_exploded/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/hasaki_war_exploded/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/hasaki_war_exploded/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="/hasaki_war_exploded/js/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript" src="/hasaki_war_exploded/js/index.js"></script>

<!-- 第三方插件 -->
<script src="/hasaki_war_exploded/js/plugins/pace/pace.min.js"></script>

</body>
</html>
