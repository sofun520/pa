<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="baseDir" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人助手</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<link rel="stylesheet" href="${baseDir}/frozen/css/frozen.css">
<link rel="stylesheet" href="${baseDir}/frozen/css/demo.css">
<script src="${baseDir}/frozen/js/lib/zeptojs/zepto.min.js"></script>
<script src="${baseDir}/frozen/js/frozen.js"></script>
<style type="text/css">
input, select {
	line-height: 44px;
}
</style>
</head>

<body ontouchstart>
	<header class="ui-header ui-header-positive ui-border-b">
	<h1>用户登录</h1>
	</header>
	<section class="ui-container"> <section id="dialog">
	<div class="demo-item">
		<div class="demo-block">


			<div class="ui-form ui-border-t">
				<br>
				<div class="ui-form-item ui-border-b">
					<label>用户名</label> <input type="text" placeholder="用户名"
						id="username" />
				</div>
				<div class="ui-form-item ui-border-b">
					<label>密码</label> <input type="password" placeholder="密码"
						id="password" />
				</div>
			</div>
			<div class="ui-btn-wrap">
				<button class="ui-btn-lg ui-btn-primary" onclick="submit()">确定</button>
			</div>


			<div class="ui-dialog" id="dialog1">
				<div class="ui-dialog-cnt">
					<header class="ui-dialog-hd ui-border-b">
					<h3 id="dialog1_title">新手任务</h3>
					<i class="ui-dialog-close" data-role="button" onclick="hide()"></i>
					</header>
					<div class="ui-dialog-bd">
						<div id="dialog1_content">开通年费QQ会员即可领取欢乐斗地主感恩节回馈礼包！</div>
					</div>
					<div class="ui-dialog-ft">
						<button type="button" data-role="button" onclick="hide()">确定</button>
					</div>
				</div>
			</div>



		</div>
		<script class="demo-script">
			$(function() {
				//$("#dia").dialog("hide");
			});

			function show() {
				$("#dialog1").dialog("show");
				console.log('sdf');
			}

			function hide() {
				$("#dialog1").dialog("hide");
			}

			function submit() {
				var username = $("#username").val();
				var password = $("#password").val();
				if (username.length != 0 && password.length != 0) {
					var url = 'mobileCheckLogin.do';
					var param = {
						username : username,
						password : password
					};
					$.post(url, param, function(data) {
						if (data.success == 0) {
							window.location.href = 'mobile/menu.do';
						} else {
							$("#dialog1_title").html("系统提示");
							$("#dialog1_content").html("用户名和密码错误");
							$("#dialog1").dialog("show");
						}
					});

				} else {
					$("#dialog1_title").html("系统提示");
					$("#dialog1_content").html("必填项不能为空");
					$("#dialog1").dialog("show");
				}
			}
		</script>
	</div>
	</section> </section>
	<!-- /.ui-container-->
</body>
</html>