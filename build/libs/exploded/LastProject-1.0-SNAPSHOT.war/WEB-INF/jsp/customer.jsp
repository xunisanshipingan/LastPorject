<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/25
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>用户</title>

    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />

    <style type="text/css">
        center{
            margin-top: 250px;
        }
    </style>
</head>
<body>
<center>
    <h2>所有用户信息</h2>
    <table border="1">
        <thead>
            <tr>
                <td>编号</td>
                <td>名称</td>
                <td>职业</td>
                <td>电话</td>
                <td>操作</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="c" varStatus="idx">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.username}</td>
                    <td>${c.jobs}</td>
                    <td>${c.phone}</td>
                    <td><a class="btn btn-warning ben-xs" data-toggle="modal" data-target="#updCustomerDialog" onclick="updCustomer(${c.id})">修改</a>|<a class="btn btn-danger ben-xs" onclick="delCustomer(${c.id})">删除</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="#" data-toggle="modal" data-target="#newCustomerDialog" onclick="clearCustomer()" >添加一个用户</a><br>
    <a href="${pageContext.request.contextPath}/index.jsp">退出</a>
</center>


<%--创建模态框--%>
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建客户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_customer_form">
                    <div class="form-group">
                        <label for="new_customerName" class="col-sm-2 control-label">
                            客户名称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_customerName" placeholder="客户名称" name="username" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_phone" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_phone" placeholder="电话" name="phone" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_jobs" class="col-sm-2 control-label">工作</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_jobs" placeholder="工作" name="jobs" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createCustomer()">创建客户</button>
            </div>
        </div>
    </div>
</div>

<%--修改模态框--%>
<div class="modal fade" id="updCustomerDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="upd_customer_form">
                    <input type="hidden" id="upd_id" name="id" />
                    <div class="form-group" style="display: none">
                        <label for="upd_name" class="col-sm-2 control-label">
                            客户名称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="upd_name" placeholder="客户名称" name="username" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="upd_phone" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="upd_phone" placeholder="电话" name="phone" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="upd_jobs" class="col-sm-2 control-label">工作</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="upd_jobs" placeholder="工作" name="jobs" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="editCustomer()">保存修改</button>
            </div>
        </div>
    </div>
</div>


<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>



<!-- 编写js代码 -->
<script type="text/javascript">
    //清空新建客户窗口中的数据
    function clearCustomer() {
        // $("#new_customerName").val("");
        // $("#new_phone").val("");
        // $("#new_jobs").val("");

    }
    // 创建客户
    function createCustomer(){
        $.post(
            "<%=basePath%>customer/addCustomer.action",
            $("#new_customer_form").serialize(),
            function(data){
                if(data=="OK"){
                    alert("客户创建成功！");
                    window.location.reload();
                }else{
                    alert("客户创建失败！");
                    window.location.reload();
                }
            }
        );
    }

    // 通过id获取修改的客户信息
    function updCustomer(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>customer/findCustomerById.action",
            data:{"id":id},
            success:function (data) {
                $("#upd_id").val(data.id);
                $("#upd_name").val(data.name);
                $("#upd_phone").val(data.phone);
                $("#upd_jobs").val(data.jobs);
            }
        });
    }

    // 执行修改客户操作
    function editCustomer() {
        if(confirm("确定这样修改吗？")){
            $.post(
                "<%=basePath%>customer/updCustomer.action",
                $("#upd_customer_form").serialize(),
                function (data) {
                    if (data == "OK")
                        alert("修改成功");
                    window.location.reload();
                })
        }
    }

    // 删除客户
    function delCustomer(id) {
        if(confirm('确实要删除吗？')){
            $.post("<%=basePath%>customer/delCustomer.action",{"id":id},
            function (data) {
                if(data=="OK")
                alert("删除成功");
                window.location.reload();
            });
        }
    }
</script>
</body>
</html>
