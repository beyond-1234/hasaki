<%--
  Created by IntelliJ IDEA.
  User: Tao
  Date: 2019/12/4
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台管理 - 用户管理</title>
    <link rel="stylesheet" href="/hasaki_war_exploded/css/bootstrap.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/datatables.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/jquery-confirm.min.css">
</head>
<body>
<div class="container" style="margin-top: 0%">
    <div class="page-header">
        用户管理
    </div>

    <div class="">
        <table id="table" class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>邮箱</th>
                <th>积分</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}" varStatus="status">
                <tr>
                    <td>${status.index}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.credit}</td>
                    <td>
                        <c:if test="${user.type != 1}">
                            <button  name="delete" uid="${user.id}" class="btn btn-danger btn-xs">删除</button>
                        </c:if>
                        <c:if test="${user.type == 1}">
                            <button class="btn btn-danger btn-xs disabled">删除</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
<%--<script src="/hasaki_war_exploded/js/jquery-3.3.1.min.js"></script>--%>
<script src="/hasaki_war_exploded/js/bootstrap.js"></script>
<script src="/hasaki_war_exploded/js/jquery-confirm.min.js"></script>
<script src="/hasaki_war_exploded/js/datatables.min.js"></script>
<script src="/hasaki_war_exploded/js/hasaki.js"></script>
<script>
    $(document).ready( function () {
        $('#table').DataTable({
            "searching": true,
            "ordering": true,
            "info": true,
            // 水平滚动条
            "scrollX": false,
            // 垂直滚动条
            "scrollY": false,
            // 自动列宽
            "autoWidth": true,
            "language": {
                "paginate": {
                    "first": "首页",
                    "last": "末页",
                    "next": "下一页",
                    "previous": "上一页"
                },
                "lengthMenu": "展示 _MENU_ 条数据",
                "info": "展示 _PAGE_ 页 共 _PAGES_ 页",
                "search": "搜索"
            },
        });
    } );
</script>
<script>
    $('[name="delete"]').click(function () {
        var uid = this.getAttribute("uid");
        $.confirm({
            theme: 'black',
            title: '返回信息',
            content: '您确定要删除此用户吗？\n该用户发表的帖子和回复也会一并删除',
            buttons: {
                ok: function (data) {
                    $.post(
                        '/hasaki_war_exploded/admin/user/delete', {
                            userId: uid
                        }, function (data) {
                            $.confirm({
                                theme: 'black',
                                title: '返回信息',
                                content: data,
                                buttons: {
                                    ok: function () {
                                        window.location.reload();
                                    }
                                }
                            })
                        }
                    )
                },
                cancel: {

                }
            }
        })
    })
</script>
</body>
</html>
