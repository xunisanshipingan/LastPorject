<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/17
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆页面</title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
    </script>
    <script>
        $().ready(function () {
            $("#frmLogin").on("submit",function () {
               var usercode = $("#usercode").val();
               var password = $("#password").val();

               if (usercode =="" || password ==""){
                   $("#message").text("账号或密码不能为空");
                   return false;
               }else {
                   return true;
               }
            });
        });
    </script>
</head>
<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">

    <div align="center" >
        <table border="0" width="1250" id="table1">
            <tr>
                <td height="100"></td>
                <td></td>
            </tr>
            <tr>
                <td width="750" height="400"></td>
                <td width="500" align="center">
                    <fieldset style="width: auto; margin: 0px auto;">
                        <legend>
                            <font style="font-size: 15px" face="宋体">
                                欢迎登陆
                            </font>
                        </legend>
                        <font color="red">
                            <span id="message">${msg}</span>
                        </font>
                        <%-- 提交后的位置：/WEB-INF/jsp/customer.jsp--%>
                        <form id="frmLogin" action="${pageContext.request.contextPath }/login.action" method="post">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />
                            账&nbsp;号：<input id="usercode" type="text" name="usercode" />
                            <br /><br />
                            密&nbsp;码：<input id="password" type="password" name="password" />
                            <br /><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <center><input type="submit" value="登录" /></center>
                        </form>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
