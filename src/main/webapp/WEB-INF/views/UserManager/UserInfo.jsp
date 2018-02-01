<%--
  Created by IntelliJ IDEA.
  User: huqin
  Date: 2018/2/1
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>用户信息</title>

    <link rel="stylesheet" type="text/css" href="assets/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="assets/themes/icon.css">
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.easyui.min.js"></script>
</head>
<body>

    <div>

        <table id="dg" title="My Users" class="easyui-datagrid" style="width:550px;height:250px"
               url="get_users.php"
               toolbar="#toolbar"
               rownumbers="true" fitColumns="true" singleSelect="true">
            <thead>
            <tr>
                <th field="firstname" width="50">First Name</th>
                <th field="lastname" width="50">Last Name</th>
                <th field="phone" width="50">Phone</th>
                <th field="email" width="50">Email</th>
            </tr>
            </thead>
        </table>
        <div id="toolbar">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New User</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit User</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove User</a>
        </div>
    </div>

</body>
</html>
