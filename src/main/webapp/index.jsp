<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/5
  Time: 01:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>index</title>
  </head>
  <style type="text/css">
    center{
      margin-top: 250px;
    }
  </style>
  <body>
  <%--<center>--%>
    <%--<h1>您好，管理员</h1>--%>
    <%--<a href="/customer/findAllCustomer">查看所有用户信息</a><br/>--%>
  <%--</center>--%>

  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%--转发到登录页面--%>
  <jsp:forward page="/login.action"/>
  </body>
</html>
