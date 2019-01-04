<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/6
  Time: 03:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改页面</title>
    <style type="text/css">
        div{
            margin-top: 250px;
        }
    </style>
</head>
<body>
<div align="center">
    <h1>修改资料</h1>
    <form action="${pageContext.request.contextPath}/customer/updCustomer" method="post">
        <table border=1>

            <input type="hidden" name="id" value="${customer.id }" />

            <input type="hidden" name="username" value="${customer.username }" />

            <tr>
                <td align="center">工作：</td>
                <td><input type="text" name="jobs" value="${customer.jobs }" /></td>
            </tr>
            <tr>
                <td align="center">电话：</td>
                <td><input type="text" name="phone" value="${customer.phone }" /></td>
            </tr>
        </table>
        <button type="submit" value="修改">修改</button>
    </form>
    <a href="/customer/findAllCustomer">返回用户列表</a>
</div>
</body>
</html>
