<%--
  Created by IntelliJ IDEA.
  User: archer
  Date: 2019/11/14
  Time: 6:13 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer style="background-color: #3c3c3c" class="footer">
    <div class="container">
        <p class="text-center" style="color: white; margin-top: 20px;">Hasaki - 愿你如亚索一样快乐</p>
        <hr>
        <div class="row">
            <div class="col-xs-5 col-xs-offset-1 col-md-4 col-md-offset-0">
                <p style="color: white; font-size: 16px">数据统计</p>
                <ul class="list-group">
                    <li class="footer-list-item">帖子数: ${topicNum}</li>
                    <li class="footer-list-item">用户数: ${userNum}</li>
                    <li class="footer-list-item">总点量: 10</li>
                </ul>
            </div>
            <div class="col-xs-5 col-xs-offset-1 col-md-4 col-md-offset-0">
                <p style="color: white; font-size: 16px;">友情链接</p>
                <ul class="list-group">
                    <li class="footer-list-item">百度</li>
                    <li class="footer-list-item">搜狐</li>
                    <li class="footer-list-item">新浪</li>
                </ul>
            </div>
        </div>
    </div>
</footer>