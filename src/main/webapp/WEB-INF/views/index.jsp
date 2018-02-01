<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>福元月子会所</title>
	<link rel="stylesheet" type="text/css" href="assets/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="assets/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="assets/css/global.css">
	<link rel="stylesheet" type="text/css" href="assets/css/desktop.css">
	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="assets/js/time.js"></script>
	<script type="text/javascript" src="assets/js/addtab.js"></script>
	<script type="text/javascript">
		function showPanel(index) {
			for(var i = 0; i <= 5; i++) {
				$("#panel_" + i).hide();
			}
			$("#panel_" + index).show();
		}
	</script>
</head>
<body class="easyui-layout">
	<div class="header" region="north" border="true" style="overflow: hidden;" scroll="no">
		<div class="logo fleft"><img src="assets/img/logo.png" width="344" height="49" /></div>
		<div class="header_right"></div>
	</div>
	
	<div region="center" border="false">
		<div class="easyui-tabs" style="width:100%;" id="divTabs" data-options="fit:true,border:false">
			<div title="我的桌面">
				<div id="desktop">
					<div id="panel_0" class="desktop_panel">
						<div>
							<div class="time">
								<span id="h1"></span><span id="h2"></span>
								<strong>:</strong>
								<span id="m1"></span><span id="m2"></span>
								<strong>:</strong>
								<span id="s1"></span><span id="s2"></span>
							</div>
							<div class="date" id="currentime"></div>
							<div class="welcome_wz">
							<img src="assets/img/welcome_wz.png" width="400" height="112" />
							</div>
						</div>
					</div>
					<div id="panel_1" style="display:none">
						<div class="desktop_panel">
							<div class="content">
								<div class="sub_menu_screen">
									<ul>
										<li>
											<a href="javascript:void(0);" onclick="addTab('${ctx}/rest/user/toUserInfo','用户信息');" title="用户信息">
												<span><img src="assets/img/user_info.png" width="56" height="61" /></span>
												<p>用户信息</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','预约信息')" title="预约信息">
												<span><img src="assets/img/user_book.png" width="48" height="48" /></span>
												<p>预约信息</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','积分管理')" title="积分管理">
												<span><img src="assets/img/user_point.png" width="48" height="48" /></span>
												<p>积分管理</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','卡券信息')" title="卡券信息">
												<span><img src="assets/img/user_card.png" width="48" height="48" /></span>
												<p>卡券信息</p>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="panel_2" style="display:none">
						<div class="desktop_panel">
							<div class="content">
								<div class="sub_menu_screen">
									<ul>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','商品管理')" title="商品管理">
												<span><img src="assets/img/pm_product.png" width="48" height="48" /></span>
												<p>商品管理</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="addTab('http://www.baidu.com','订单管理');" title="订单管理">
												<span><img src="assets/img/pm_order.png" width="56" height="61" /></span>
												<p>订单管理</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','物流查询')" title="物流查询">
												<span><img src="assets/img/pm_interflow.png" width="48" height="48" /></span>
												<p>物流查询</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','退货管理')" title="退货管理">
												<span><img src="assets/img/pm_back.png" width="48" height="48" /></span>
												<p>退货管理</p>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="panel_3" style="display:none">
						<div class="desktop_panel">
							<div class="content">
								<div class="sub_menu_screen">
									<ul>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','活动管理')" title="活动管理">
												<span><img src="assets/img/ac_activity.png" width="48" height="48" /></span>
												<p>活动管理</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','课程管理')" title="课程管理">
												<span><img src="assets/img/ac_course.png" width="48" height="48" /></span>
												<p>课程管理</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','游泳管理')" title="游泳管理">
												<span><img src="assets/img/ac_swimming.png" width="48" height="48" /></span>
												<p>游泳管理</p>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="panel_4" style="display:none">
						<div class="desktop_panel">
							<div class="content">
								<div class="sub_menu_screen">
									<ul>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','用户统计')" title="用户统计">
												<span><img src="assets/img/st_user.png" width="48" height="48" /></span>
												<p>用户统计</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','商品统计')" title="商品统计">
												<span><img src="assets/img/st_product.png" width="48" height="48" /></span>
												<p>商品统计</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','课程统计')" title="课程统计">
												<span><img src="assets/img/st_course.png" width="48" height="48" /></span>
												<p>课程统计</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','预约统计')" title="预约统计">
												<span><img src="assets/img/st_book.png" width="48" height="48" /></span>
												<p>预约统计</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','活动统计')" title="活动统计">
												<span><img src="assets/img/st_activity.png" width="48" height="48" /></span>
												<p>活动统计</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','游泳统计')" title="游泳统计">
												<span><img src="assets/img/st_swimming.png" width="48" height="48" /></span>
												<p>游泳统计</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','销售统计')" title="销售统计">
												<span><img src="assets/img/st_sale.png" width="48" height="48" /></span>
												<p>销售统计</p>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="panel_5" style="display:none">
						<div class="desktop_panel">
							<div class="content">
								<div class="sub_menu_screen">
									<ul>
										<li>
											<a href="javascript:void(0);" onclick="addTab('http://www.baidu.com','系统用户管理');" title="系统用户管理">
												<span><img src="assets/img/setting_user.png" width="56" height="61" /></span>
												<p>系统用户管理</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','数据字典')" title="数据字典">
												<span><img src="assets/img/setting_data.png" width="48" height="48" /></span>
												<p>数据字典</p>
											</a>
										</li>
										<li>
											<a href="javascript:void(0);" onclick="parent.addTab('list.html','系统设置')" title="系统设置">
												<span><img src="assets/img/setting_set.png" width="48" height="48" /></span>
												<p>系统设置</p>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- -->
					<div class="main_desktop">
						<ul class="desktop_wrap">
							<li>
								<p>我的桌面</p>
								<a href="javascript:void(0);" onclick="showPanel(0);">
									<img src="assets/img/main_menu_home.png" width="48" height="48" />
								</a>
							</li>
							<li>
								<p>用户管理</p>
								<a href="javascript:void(0);" onclick="showPanel(1);">
									<img src="assets/img/main_menu_user.png" width="64" height="57" />
								</a>
							</li>
							<li>
								<p>积分商城</p>
								<a href="javascript:void(0);" onclick="showPanel(2);">
									<img src="assets/img/main_menu_pm.png" width="61" height="63" />
								</a>
							</li>
							<li>
								<p>活动课程</p>
								<a href="javascript:void(0);" onclick="showPanel(3);">
									<img src="assets/img/main_menu_ac.png" width="64" height="62" />
								</a>
							</li>
							<li>
								<p>统计分析</p>
								<a href="javascript:void(0);" onclick="showPanel(4);">
									<img src="assets/img/main_menu_st.png" width="60" height="58" />
								</a>
							</li>
							<li>
								<p>系统管理</p>
								<a href="javascript:void(0);" onclick="showPanel(5);">
									<img src="assets/img/main_menu_setting.png" width="60" height="58" />
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="footer" region="south" border="false">
		<center style="width:100%;">
			<div style="font-size:12px;margin-top:10px;">
				Copyright&copy;<a href="http://www.yilixun.cn/" target="_blank">合肥易立迅科技有限公司</a> All Rights Reserved(2018)版权所有
			</div>
		</center>
	</div>
	
	
</body>
</html>