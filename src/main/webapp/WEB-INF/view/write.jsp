<%--
  Created by IntelliJ IDEA.
  User: archer
  Date: 2019/11/19
  Time: 11:47 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>hasaki - 帖子发布页面</title>
    <link rel="stylesheet" href="/hasaki_war_exploded/css/bootstrap.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/css/jquery-confirm.min.css">
    <link rel="stylesheet" href="/hasaki_war_exploded/editor.md/css/editormd.min.css">
</head>
<body>
    <%@include file="components/nav-top.jsp"%>
    <div class="container">
        <div class="row">
            <div class="page-header">
                <h4>发布新帖子～</h4>
            </div>
            <div class="col-md-8">
                <div class="form-group">
<%--                    <label for="exampleInputEmail1">Email address</label>--%>
                    <input type="text" class="form-control" id="title" placeholder="请输入帖子标题">
                </div>
                <div id="editor">
                    <!-- Tips: Editor.md can auto append a `<textarea>` tag -->
                    <textarea id="markdown" style="display:none;">### 发帖请遵守规范 !</textarea>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">&_&</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="tag">帖子分类</label>
                            <select id="tag" class="form-control">
                                <c:forEach items="${tabs}" var="tab">
                                    <option value="${tab.id}">${tab.tabName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="public">公开度</label>
                            <select id="public" name="public" class="form-control">
                                <option>公开</option>
                                <option>私密</option>
                            </select>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input checked type="checkbox"> 同意并遵守发帖规则
                            </label>
                        </div>
                        <hr>
                        <button id="upload" class="btn btn-success btn-block">立即发布</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="components/footer.jsp"%>
    <script src="/hasaki_war_exploded//js/jquery-3.4.1.min.js"></script>
    <script src="/hasaki_war_exploded/js/bootstrap.js"></script>
    <script src="/hasaki_war_exploded/js/jquery-confirm.min.js"></script>
    <script src="/hasaki_war_exploded/editor.md/editormd.min.js"></script>
    <script src="/hasaki_war_exploded/js/hasaki.js"></script>
    <script>
        $(function() {
            var editor = editormd("editor", {
                // width: "100%",
                height: "600",
                // markdown: "xxxx",     // dynamic set Markdown text
                path : "/hasaki_war_exploded/editor.md/lib/",  // Autoload modules mode, codemirror, marked... dependents libs path
                saveHTMLToTextarea : true,
            });
        });
    </script>
</body>
</html>
