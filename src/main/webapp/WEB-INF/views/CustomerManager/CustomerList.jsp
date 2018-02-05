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

</head>
<body>

    <div>
        <table id="CustomerListTable"></table>
    </div>

    <div id="CustomerListToolBar">
        <div style="margin: 10px 10px">
            时间段<input class="easyui-datebox" style="width:120px">
            ~ <input class="easyui-datebox" style="width:120px">
            选择
            <input class="easyui-combobox" style="width:100px"
                   url="data/combobox_data.json"
                   valueField="id" textField="text">
            <a href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
        </div>
        <div style="margin: 10px 10px">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="addFct()">添加</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editFct()">编辑</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteFct()">删除</a>
        </div>
    </div>

    <div id="CustomerListEditDiv" class="easyui-window" title="Login" data-options="modal:true,closed:true">
        <div style="padding:10px 60px 20px 60px">
            <form id="CustomerListEditForm" method="post">
                <table cellpadding="5">
                    <tr>
                        <td>姓名:</td>
                        <td><input class="easyui-textbox" type="text" name="userName" data-options="required:true"/></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td>
                            <input type="radio" name="sex" value="1">男</input>
                            <input type="radio" name="sex" value="0">女</input>
                        </td>
                    </tr>
                    <tr>
                        <td>电话:</td>
                        <td><input class="easyui-textbox" type="text" name="phone" data-options="required:true"/></td>
                    </tr>
                    <tr>
                        <td>生日:</td>
                        <td><input class="easyui-textbox" name="birthday" data-options="multiline:true" style="height:60px"/></td>
                    </tr>
                    <tr>
                        <td>状态:</td>
                        <td>
                            <input type="radio" name="state" value="0">启用</input>
                            <input type="radio" name="state" value="1">停用</input>
                        </td>
                    </tr>
                </table>
            </form>
            <div style="text-align:center;padding:5px">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" data-options="iconCls:'icon-ok'">提交</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" data-options="iconCls:'icon-undo'">重置</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeWindow()" data-options="iconCls:'icon-cancel'">Cancel</a>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="assets/js/utils.js"></script>
    <script type="text/javascript">
        //
        var $CustomerListTable = $('#CustomerListTable');
        //删除
        function deleteFct() {
            var rows = $CustomerListTable.datagrid('getSelections');
            if (rows.length!=0) {
                for (var i in rows) {
                    var id = rows[i].id;
                    ajaxDel(id);
                }
                $CustomerListTable.datagrid('reload');
            }else{
                ShowMsg('请先勾选记录');
            }
        }
        //ajax同步删除
        function ajaxDel(id) {
            $.ajax({
                url: '${ctx}/rest/customer/deleteById',
                type: 'POST',
                async: false,
                dataType: 'json',
                data: {id:id},
                success: function (response) {
                    console.log(response);
                },
                error: function () {
                    ShowMsg('删除失败');
                }

            });
        }
        //添加
        function addFct() {
            $('#CustomerListEditDiv').window('open');
        }
        //提交
        function submitForm(){
            $('#CustomerListEditForm').form('submit');
        }
        //重置
        function clearForm(){
            $('#CustomerListEditForm').form('clear');
        }
        //窗口关闭
        function closeWindow() {
            $('#CustomerListEditDiv').window('close');
        }
        //
        $(function () {

            $CustomerListTable.datagrid({
                url:'${ctx}/rest/customer/getCustomerList',
                toolbar:"#CustomerListToolBar",
                width:'100%',
                title:'客户信息',
                striped:true,
                singleSelect:false,
                pagination:true,
                pageSize:20,
                pageList:[20,50,100],
                columns:[[
                    {field:'ck',checkbox:true,align:'left'},
                    {field:'id',title:'id',sortable:true},
                    {field:'userName',title:'userName'},
                    {field:'phone',title:'phone'},
                    {field:'birthday',title:'birthday',sortable:true},
                    {field:'state',title:'状态',
                        formatter: function(value, row, index){
                            var dict = {0:'停用',1:'正常'};
                            return dict[value];
                        }
                    }
                ]]
            });

            $('#CustomerListEditForm').form({
                url: "${ctx}/rest/customer/customerEdit",
                onSubmit: function(){

                },
                success:function(data){
                    console.log(data);
                }
            });



        })
    </script>
</body>
</html>
