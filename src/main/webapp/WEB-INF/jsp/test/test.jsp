<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="../sui/css/sui.css">
<link rel="stylesheet"
	href="http://g.alicdn.com/sj/dpl/1.5.1/css/sui-append.min.css">
<script src="http://g.tbcdn.cn/sj/lib/jquery/dist/jquery.min.js"></script>
<script src="http://g.alicdn.com/sj/dpl/1.5.1/js/sui.min.js"></script>
<style>
.sui-container {
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
						<label data-toggle="radio" class="radio-pretty inline"> <input
							type="radio" name="gender" value="1" data-rules="required"><span>男</span>
						</label> <label data-toggle="radio" class="radio-pretty inline"> <input
							type="radio" name="gender" value="2" data-rules="required"><span>女</span>
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
								data-toggle="dropdown" href="#" class="dropdown-toggle"> <input
									name="city" type="hidden" data-rules="required"><i
									class="caret"></i><span>请选择</span>
							</a>
								<ul id="menu4" role="menu" aria-labelledby="drop4"
									class="sui-dropdown-menu">
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="javascript:void(0);" value="bj">北京</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="javascript:void(0);" value="sb">圣彼得堡</a></li>
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
						<th colspan="5"><label class="checkbox pull-left"> <input
								type="checkbox">订单编号：7867473872181848
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

			<button id="J_addsuppliers" data-toggle="modal"
				data-target="#J_addsuppliersDialog" data-width="large"
				data-backdrop="static" class="sui-btn btn-primary">添加供应商</button>
			<div id="J_addsuppliersDialog" tabindex="-1" role="dialog"
				class="sui-modal hide fade" data-addsupplierurl="http://"
				data-getsuppliersurl="http://www.baidu.com">
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
				$supDialog.on('click', '.J_addOneSupplier', function(e) {
					$supDialog.modal('shadeIn');
					return $.confirm({
						title : '确认',
						body : '您确认添加该供应商吗？',
						backdrop : false,
						okHide : function() {
							$.alert({
								hasfoot : false,
								backdrop : false,
								title : '不管发生了什么，总之成功了',
								body : 'msg-large msg-block msg-',
								timeout : 1000
							});
						},
						hide : function() {
							return $supDialog.modal('shadeOut');
						}
					});
				});
			</script>

		</div>
	</div>
</body>
</html>