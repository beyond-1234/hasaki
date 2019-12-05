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
    <script src="/hasaki_war_exploded/js/bootstrap.js"></script>
    <script src="/hasaki_war_exploded/js/jquery-confirm.min.js"></script>

    <title>Hasaki ›设置</title>
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
                        <a class="btn btn-default" href="/hasaki_war_exploded/ucenter/settings/avatar" role="button" style="margin-left: 28%">更换头像</a>
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
                            <p class="form-control-static" style="display: inline-block; width: 85px">${userInfo.phoneNum}</p>
                            <%--<a class="btn btn-default" href="/settings/avatar" role="button" style="margin-left: 22%; display: inline-block">更换手机号</a>--%>
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#setting_Phone" style="margin-left: 22%; display: inline-block">更换手机号</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" style="display: inline-block; width: 85px">${userInfo.email}</p>
                            <%--<a class="btn btn-default" href="/settings/avatar" role="button" style="margin-left: 17%; display: inline-block">更换邮箱</a>--%>
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#setting_Email" style="margin-left: 23%; display: inline-block">更换邮箱</button>
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
                            <p class="form-control-static"style="display: inline-block; width: 85px">${userInfo.credit}</p>
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#setting_credit" style="margin-left: 23.5%; display: inline-block">充值</button>
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

<!-- Modal -->
<div class="modal fade" id="setting_Phone" tabindex="-1" role="dialog" aria-labelledby="loginLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="phoneLabel">修改手机号</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="phone_num" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="phone_num" placeholder="请输入你的手机号">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="submitPhone" type="button" class="btn btn-success">确认修改</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="setting_Email" tabindex="-1" role="dialog" aria-labelledby="loginLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="emailLabel">修改邮箱</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email" placeholder="请输入你的邮箱">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="submitEmail" type="button" class="btn btn-success">确认修改</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="setting_credit" tabindex="-1" role="dialog" aria-labelledby="loginLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="creditLabel">充值积分</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <p class="form-control-static"style="margin-left: 3%">您的积分： ${userInfo.credit}</p>
                        <div class="col-sm-10" style="margin-top: 3%">
                            <input type="text" class="form-control" id="credit_num" placeholder="请输入充值金额">
                            <img src="/hasaki_war_exploded/img/LiuMoney.JPG" width="120px" style="margin-top: 4%; margin-left: 4%">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="submitcredit" type="button" class="btn btn-success">确认支付</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="components/footer.jsp"%>


<script>
    $('#submitPhone').click(function setPhone() {
        $.post(
            "/hasaki_war_exploded/ucenter/settings/setPhone", {
                phone_num: $('#phone_num').val()
            }, function (data) {
                $.confirm({
                    theme: 'black',
                    title: '返回信息',
                    content: data,
                    buttons: {
                        ok: function () {
                            window.location.href("/hasaki_war_exploded/ucenter/settings");
                        }
                    }
                })
                window.location.reload();
            }
        )
    })

    $('#submitEmail').click(function setEmail() {
        $.post(
            "/hasaki_war_exploded/ucenter/settings/setEmail", {
                email:$('#email').val()
            }, function (data) {
                $.confirm({
                    theme: 'black',
                    title: '返回信息',
                    content: data,
                    buttons: {
                        ok: function () {
                            window.location.href("/hasaki_war_exploded/ucenter/settings");
                        }
                    }
                })
                window.location.reload();
            }
        )
    })

    $('#submitcredit').click(function setCredit() {
        $.post(
            "/hasaki_war_exploded/ucenter/settings/setCredit", {
                credit: $('#credit_num').val()
            }, function (data) {
                $.confirm({
                    theme: 'black',
                    title: '返回信息',
                    content: data,
                    buttons: {
                        ok: function () {
                            window.location.href("/hasaki_war_exploded/ucenter/settings");
                        }
                    }
                })
                window.location.reload();
            }
        )
    })

</script>

</body>
</html>
