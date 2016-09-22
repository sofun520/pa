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
	height: 23px;
	background-color: #efefef;
	padding-top: 1px;
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
	<div style="border-bottom: 1px solid #f6f6f6;">
		<div class="sui-navbar" style="width: 1120px; margin: 0px auto;">
			<div class="navbar-inner">
				<a href="#" class="sui-brand">JHAC财务系统&nbsp;&nbsp;</a>
				<ul class="sui-nav"  id="menus">
					<li class="active"><a href="#">首页</a></li>
					<li><a href="#">组件</a></li>
					<li><a href="#">关于</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="page">
		<div class="sui-row-fluid">
			<div class="span2" id="navi">
				<ul class="sui-nav nav-list" id="submenus">
					<li class="nav-header"><i class="sui-icon icon-tb-cascades"></i>个人财物</li>
					<li class="active"><a href="#" onclick="loadFrame('test.do',1,1)"><i
							class="sui-icon icon-tb-right"></i>卡信息管理</a></li>
					<li><a><i class="sui-icon icon-tb-right"></i>套现管理</a></li>
					<li><a><i class="sui-icon icon-tb-right"></i>流水账信息</a></li>

				</ul>
			</div>
			<div class="sui-container span10">
				<div id="iframe1" style="border: 0px;"></div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			var height = document.body.clientHeight - 72;
			$("#navi").attr('style',
					'height:' + height + 'px;border-right: 1px #efefef solid;');
			//alert(height);
			
			var height1 = document.body.clientHeight - 92;
			$("#iframe1").attr('height',height1);
			$("#iframe1").attr('width',931);
			
			getMenu();
			
		});
		
		function loadFrame(url, i, len){
			cancleLiActive(len);
			var obj = document.getElementById("li" + i);
			obj.setAttribute("class", "active");
			$("#iframe1").load(url);
		}
		
		function cancleLiActive(len) {
			for (var i = 0; i < len; i++) {
				var obj = document.getElementById("li" + i);
				obj.removeAttribute("class");
			}
		}
		
		//获取一级菜单
		function getMenu() {
			$
					.get(
							'../menu/userMenu.do?roleId=${user.uRoleId}',
							function(data, status) {
								var hh = '';
								var menuId;
								var menuName;
								$
										.each(
												data.data,
												function(i, value) {
													if (i == 0) {
														menuId = value.menuId;
														menuName = value.menuName;
													}
													hh += '<li><a href="javascript:void(0)" onclick="subMenue(\''
															+ value.menuId
															+ '\',\''
															+ value.menuName
															+ '\')">'
															+ value.menuName
															+ '</a></li>';
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
								var ht = '<li class="nav-header"><i class="sui-icon icon-tb-cascades"></i>' + name + '</li>';
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
															+value.menuUrl
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
	</script>
</body>
</html>