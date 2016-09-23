<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../sui/css/sui.css">
<link rel="stylesheet"
	href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.min.css">
<script src="http://g.tbcdn.cn/sj/lib/jquery/dist/jquery.min.js"></script>
<script src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
<style>
</
head> <style>.sui-container {
	padding: 10px;
}

html, body {
	height: 100%;
	margin: 0;
}

#top {
	height: 25px;
	background-color: #efefef;
}

#page {
	width: 1120px;
	margin: 0px auto;
	padding-top: 5px;
}
</style>
<body>
	<div id="top">
		<div style="width: 1120px; margin: 0px auto; text-align: right;">
			admin,欢迎登陆京汉安驰系统 <a href="logout.do">[注销]</a>
		</div>
	</div>
	<div
		style="border-bottom: 1px solid #e6e6e6; background-color: #ffffff;">
		<div class="sui-navbar" style="width: 1120px; margin: 0px auto;">
			<div class="navbar-inner">
				<a href="#" class="sui-brand">JHAC财务系统&nbsp;&nbsp;</a>
				<ul class="sui-nav" id="menus">
					<li class="active"><a href="#">首页</a></li>
					<li><a href="#">组件</a></li>
					<li><a href="#">关于</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="page">
		<div class="sui-row-fluid">
			<div class="span2" id="navi" style="border-right: 1px #efefef solid;">
				<ul class="sui-nav nav-list" id="submenus"
					style="background-color: #f9fafd">
					<li class="nav-header"><i class="sui-icon icon-tb-cascades"></i>个人财物</li>
					<li class="active"><a href="#"
						onclick="loadFrame('test.do',1,1)"><i
							class="sui-icon icon-tb-right"></i>卡信息管理</a></li>
					<li><a><i class="sui-icon icon-tb-right"></i>套现管理</a></li>
					<li><a><i class="sui-icon icon-tb-right"></i>流水账信息</a></li>

				</ul>
			</div>
			<div class="sui-container span10">

				<div style="margin-bottom: 5px;">
					<button data-toggle="modal" data-target="#myModal"
						data-keyboard="false" class="sui-btn btn-primary btn-lg">新增</button>
					<a href="javascript:void(0);" class="sui-btn">新增</a>
					<button id="J_addsuppliers" data-toggle="modal"
						data-target="#J_addsuppliersDialog" data-backdrop="static"
						class="sui-btn btn-primary">添加供应商</button>
					<div id="J_addsuppliersDialog" tabindex="-1" role="dialog"
						class="sui-modal hide fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" data-dismiss="modal" aria-hidden="true"
										class="sui-close">×</button>
									<h4 id="myModalLabel" class="modal-title">供应商收编</h4>
								</div>
								<div class="modal-body sui-form form-horizontal">
									<div class="sui-msg msg-block msg-default msg-tips">
										<div class="msg-con">以下为供销平台上已经获得小二授权经营您的品牌但还未被您进行收编的供应商</div>
										<s class="msg-icon"></s>
									</div>
									<table class="sui-table table-bordered-simple">
										<thead>
											<tr>
												<th>供应商昵称</th>
												<th>公司名称</th>
												<th>供应商类型</th>
												<th>分销商数量</th>
												<th>授权品牌</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><span>only淘宝商城官方旗舰店</span></td>
												<td><span>九牧官方旗舰店</span></td>
												<td><span>企业</span></td>
												<td><span class="distributor-num">432</span></td>
												<td>
													<ul class="authorize-brand">
														<li>海尔</li>
														<li>统帅</li>
													</ul>
												</td>
												<td data-supplierid="111">
													<button class="sui-btn btn-small J_addOneSupplier">添加</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<script>
						$supDialog = $('#J_addsuppliersDialog')
						$supDialog
								.on(
										'click',
										'.J_addOneSupplier',
										function(e) {
											$supDialog.modal('shadeIn');
											return $
													.confirm({
														title : '确认',
														body : '您确认添加该供应商吗？',
														backdrop : false,
														okHide : function() {
															$
																	.alert({
																		hasfoot : false,
																		backdrop : false,
																		title : '不管发生了什么，总之成功了',
																		body : 'msg-large msg-block msg-',
																		timeout : 1000
																	});
														},
														hide : function() {
															return $supDialog
																	.modal('shadeOut');
														}
													});
										});
					</script>

				</div>
				
				<table class="sui-table table-bordered">
					<tbody>
						<tr>
							<th style="width: 50px">序号</th>
							<th>卡号</th>
							<th>发卡行</th>
							<th>卡种</th>
							<th>时间</th>
							<th>操作</th>
						</tr>
						<c:if test="${list== null || fn:length(list) == 0}">
							<tr>
								<td colspan="6" align="center">没有内容</td>
							</tr>
						</c:if>
						<c:if test="${list!=null}">
							<c:forEach var="ca" items="${list}" varStatus="xh">
								<tr>
									<td><c:out value="${xh.count}" /></td>
									<td><c:out value="${ca.cardNo}" /></td>
									<td><c:out value="${ca.cardBank}" /></td>
									<td><c:out value="${ca.cardType}" /></td>
									<td><fmt:formatDate value="${ca.cardAddDate}"
											pattern="yyyy-MM-dd" /></td>
									<td><a href="javascript:void(0)"
										onclick="del('${ca.cardId}')"><i
											class="fa fa-fw fa-remove"></i>删除</a>&nbsp;&nbsp;<a href=""><i
											class="fa fa-fw fa-edit"></i>修改</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				
				<ul class="sui-nav nav-tabs">
					<li class="active"><a href="#index" data-toggle="tab">表单</a></li>
					<li><a href="#profile" data-toggle="tab">表格</a></li>
					<li><a href="#about" data-toggle="tab">对话框</a></li>
				</ul>
				<div class="tab-content">
					<div id="index" class="tab-pane active">
						<form class="sui-form form-horizontal sui-validate">
							<div class="control-group">
								<label for="inputEmail" class="control-label">邮箱：</label>
								<div class="controls">
									<input type="text" id="inputEmail" name="name" placeholder="邮箱"
										data-rules="required|email">
								</div>
							</div>
							<div class="control-group">
								<label for="inputEmail" class="control-label">登记日期：</label>
								<div class="controls">
									<input type="text" id="inputEmail" data-toggle="datepicker"
										name="name" placeholder="邮箱" data-rules="required">
								</div>
							</div>
							<div class="control-group">
								<label for="inputPassword" class="control-label">密码：</label>
								<div class="controls">
									<input type="password" id="inputPassword" name="password"
										placeholder="密码" data-rules="required" title="密码">
								</div>
							</div>
							<div class="control-group">
								<label for="inputRepassword" class="control-label">重复密码：</label>
								<div class="controls">
									<input type="password" id="inputRepassword" name="repassword"
										placeholder="重复密码" data-rules="required|match=password">
								</div>
							</div>
							<div class="control-group">
								<label for="inputGender" class="control-label">性别：</label>
								<div class="controls">
									<label data-toggle="radio" class="radio-pretty inline">
										<input type="radio" name="gender" value="1"
										data-rules="required"><span>男</span>
									</label> <label data-toggle="radio" class="radio-pretty inline">
										<input type="radio" name="gender" value="2"
										data-rules="required"><span>女</span>
									</label>
								</div>
							</div>
							<div class="control-group">
								<label for="inputPassword" class="control-label">年龄：</label>
								<div class="controls">
									<input type="text" id="inputPassword" name="age"
										placeholder="整数，需要小于100" data-rules="required|number|lt=100"
										title="年龄">
								</div>
							</div>
							<div class="control-group">
								<label for="inputGender" class="control-label">地址：</label>
								<div class="controls">
									<span class="sui-dropdown dropdown-bordered select"><span
										class="dropdown-inner"><a role="button"
											data-toggle="dropdown" href="#" class="dropdown-toggle">
												<input name="city" type="hidden" data-rules="required"><i
												class="caret"></i><span>请选择</span>
										</a>
											<ul id="menu4" role="menu" aria-labelledby="drop4"
												class="sui-dropdown-menu">
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="javascript:void(0);" value="bj">北京</a></li>
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="javascript:void(0);" value="sb">圣彼得堡</a></li>
											</ul></span></span>
								</div>
							</div>
							<div class="control-group">
								<label for="inputDes" class="control-label v-top">自我介绍：</label>
								<div class="controls">
									<textarea id="inputDes" name="des" placeholder="自我介绍"
										data-rules="required"></textarea>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"></label>
								<div class="controls">
									<button type="submit" class="sui-btn btn-primary">立即注册</button>
								</div>
							</div>
						</form>
					</div>
					<div id="profile" class="tab-pane">
						<table class="sui-table table-bordered">
							<thead>
								<tr>
									<th colspan="5"><label class="checkbox pull-left">
											<input type="checkbox">订单编号：7867473872181848
									</label><span class="pull-right">成交时间：2014-01-11 11:59</span></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td width="50%">
										<div class="typographic">
											<img src="#"><a href="#" class="block-text">包邮
												正品玛姬儿压缩面膜无纺布纸膜100粒 送泡瓶面膜刷喷瓶 新款</a><span>1</span>
											<ul class="unstyled">
												<li>申请售后</li>
												<li>投诉卖家</li>
											</ul>
										</div>
									</td>
									<td rowspan="2" width="11%" class="center">56.50</td>
									<td rowspan="2" width="13%" class="center">
										<ul class="unstyled">
											<li>交易成功</li>
											<li><a href="#">订单详情</a></li>
											<li><a href="#">对方已评</a></li>
										</ul>
									</td>
									<td rowspan="2" width="13%" class="center"><a href="#"
										class="btn">评价 </a></td>
									<td rowspan="2" width="13%" class="center">
										<ul class="unstyled">
											<li><a href="#">删除</a></li>
											<li><a href="#">标记</a></li>
											<li><a href="#">分享</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="50%">
										<div class="typographic">
											<img src="#"><a href="#" class="block-text">包邮
												正品玛姬儿压缩面膜无纺布纸膜100粒 送泡瓶面膜刷喷瓶 新款</a><span>1</span>
											<ul class="unstyled">
												<li>申请售后</li>
												<li>投诉卖家</li>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

						<table class="sui-table table-bordered">
							<thead>
								<tr>
									<th>＃</th>
									<th>待付款</th>
									<th>宝宝数量</th>
									<th>交易金额</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>所有交易</td>
									<td>9999.00</td>
									<td>999</td>
									<td>99999.00</td>
								</tr>
								<tr>
									<td>待付款</td>
									<td>9999.00</td>
									<td>999</td>
									<td>99999.00</td>
								</tr>
								<tr>
									<td>已发货</td>
									<td>9999.00</td>
									<td>999</td>
									<td>99999.00</td>
								</tr>
								<tr>
									<td>已成功</td>
									<td>9999.00</td>
									<td>999</td>
									<td>99999.00</td>
								</tr>
							</tbody>
						</table>

						<div class="sui-msg msg-block msg-default msg-tips">
							<div class="msg-con">以下为供销平台上已经获得小二授权经营您的品牌但还未被您进行收编的供应商</div>
							<s class="msg-icon"></s>
						</div>
						<table class="sui-table table-bordered-simple">
							<thead>
								<tr>
									<th>供应商昵称</th>
									<th>公司名称</th>
									<th>供应商类型</th>
									<th>分销商数量</th>
									<th>授权品牌</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span>only淘宝商城官方旗舰店</span></td>
									<td><span>九牧官方旗舰店</span></td>
									<td><span>企业</span></td>
									<td><span class="distributor-num">432</span></td>
									<td>
										<ul class="authorize-brand">
											<li>海尔</li>
											<li>统帅</li>
										</ul>
									</td>
									<td data-supplierid="111">
										<button class="sui-btn btn-small J_addOneSupplier">添加</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="about" class="tab-pane">
						<button data-toggle="modal" data-target="#myModal"
							data-keyboard="false" class="sui-btn btn-primary btn-lg">对话框已写入html</button>
						<!-- Modal-->



					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- Modal-->
				<div id="myModal" tabindex="-1" role="dialog" data-hasfoot="false"
					class="sui-modal hide fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" data-dismiss="modal" aria-hidden="true"
									class="sui-close">×</button>
								<h4 id="myModalLabel" class="modal-title">Modal title</h4>
							</div>
							<div class="modal-body">
								<form class="sui-form form-horizontal sui-validate"
									method="post" action="card/save.do">
									<div class="control-group">
										<label for="inputEmail" class="control-label">卡号：</label>
										<div class="controls">
											<input type="text" id="inputEmail" name="cardNo"
												data-rules="required">
										</div>
									</div>
									<div class="control-group">
										<label for="inputEmail" class="control-label">发卡行：</label>
										<div class="controls">
											<input type="text" id="inputEmail" name="cardBank"
												data-rules="required">
										</div>
									</div>
									<div class="control-group">
										<label for="inputGender" class="control-label">卡种：</label>
										<div class="controls">
											<label data-toggle="radio" class="radio-pretty inline">
												<input type="radio" name="cardType" value="借记卡"
												data-rules="required"><span>借记卡</span>
											</label> <label data-toggle="radio" class="radio-pretty inline">
												<input type="radio" name="cardType" value="信用卡"
												data-rules="required"><span>信用卡</span>
											</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label"></label>
										<div class="controls">
											<button type="submit" class="sui-btn btn-primary">立即注册</button>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
	</body>
	<script type="text/javascript">
	$(function() {
		var height = document.body.clientHeight - 72;
		$("#navi").attr('style',
				'height:' + height + 'px;border-right: 1px #efefef solid;');
		//alert(height);

		var height1 = document.body.clientHeight - 92;
		$("#iframe1").attr('height', height1);
		$("#iframe1").attr('width', 931);

		getMenu();

	});
	
	
	function loadFrame(url, i, len) {
		cancleLiActive(len);
		var obj = document.getElementById("li" + i);
		obj.setAttribute("class", "active");
		//$("#iframe1").load(url);
		window.location.href = '../'+url;
	}

	function cancleLiActive(len) {
		for (var i = 0; i < len; i++) {
			var obj = document.getElementById("li" + i);
			obj.removeAttribute("class");
		}
	}

	//获取一级菜单
	function getMenu() {
		$.get('../../menu/userMenu.do?roleId=${user.uRoleId}', function(data,
				status) {
			var hh = '';
			var menuId;
			var menuName;
			$.each(data.data, function(i, value) {
				if (i == 0) {
					menuId = value.menuId;
					menuName = value.menuName;
				}
				hh += '<li><a href="javascript:void(0)" onclick="subMenue(\''
						+ value.menuId + '\',\'' + value.menuName + '\')">'
						+ value.menuName + '</a></li>';
			});
			$('#menus').html(hh);
			//subMenue("1","基础数据管理");
			subMenue(menuId, menuName);
		});
	}

	function subMenue(id, name) {
		$
				.get(
						'../menu/userMenu.do?roleId=${user.uRoleId}&menuParent='
								+ id,
						function(data) {
							var url = "";
							var index;
							var len;
							var ht = '<li class="nav-header"><i class="sui-icon icon-tb-cascades"></i>'
									+ name + '</li>';
							$
									.each(
											data.data,
											function(i, value) {
												if (i == 0) {
													url = value.menuUrl;
													index = i;
													len = data.data.length;
												}
												ht += '<li id="li'+i+'"><a href="javascript:void(0)" onclick="loadFrame(\''
														+ value.menuUrl
														+ '\',\''
														+ i
														+ '\',\''
														+ data.data.length
														+ '\')"><i class="sui-icon icon-tb-right"></i><span>'
														+ value.menuName
														+ '</span></a></li>';
											});
							$("#submenus").html(ht);
							loadFrame(url, index, len);
						});
	}
	
	
	function del(id) {
		$.get('delete.do?id=' + id, function(data) {
			//$("#iframe1").load('card/query.do');
			window.location.reload();
		});
	}
</script>
</html>