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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台管理 - 帖子管理</title>
    <link rel="stylesheet" href="/hasaki_war_exploded/css/bootstrap.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/datatables.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/jquery-confirm.min.css">
</head>
<body>
<%--<%@include file="./../components/nav-top.jsp"%>--%>
<div class="container">
    <div class="page-header">
        用户管理
    </div>

    <div class="">
        <table id="table" class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>发布时间</th>
                <th>更新时间</th>
                <th>创作者</th>
                <th>点击量</th>
                <th>回复数量</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="topic" items="${topics}" varStatus="status">
                <tr>
                    <td>${status.index}</td>
                    <td>${topic.title}</td>
                    <td>${topic.createTime}</td>
                    <td>${topic.updateTime}</td>
                    <td>${topic.user.username}</td>
                    <td>${topic.click}</td>
                    <td>${topic.countReplies}</td>
                    <td>
                        <button name="delete" tid="${topic.id}" class="btn btn-danger btn-xs">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%--<%@include file="./../components/footer.jsp"%>--%>
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
        var tid = this.getAttribute("tid");
        $.confirm({
            theme: 'black',
            title: '返回信息',
            content: '您确定要删除此帖子吗？\n该帖子的回复也会一并删除',
            buttons: {
                ok: function (data) {
                    $.post(
                        '/hasaki_war_exploded/admin/topic/delete', {
                            topicId: tid
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
