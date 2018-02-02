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
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteFct()">删除</a>
        </div>
    </div>

    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="assets/js/utils.js"></script>
    <script type="text/javascript">
        //
        var $CustomerListTable = $('#CustomerListTable');
        //
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
                        formatter: function(value,row,index){
                            var dict = {0:'停用',1:'正常'};
                            return dict[value];
                        }
                    }
                ]]
            });
            

        })
    </script>
</body>
</html>
