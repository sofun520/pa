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
</style>

</head>
<body ontouchstart>
	<header class="ui-header ui-header-positive ui-border-b"> <a
		class="ui-icon-return" href="../menu.do"></a>
	<h1>银行卡信息</h1>
	<button class="ui-btn" onclick="add()">新增</button>
	</header>
	<section class="ui-container">

	<div class="demo-block">
		<ul class="ui-list ui-list-link ui-border-tb">
			<c:forEach items="${list}" var="ca">
				<li class="ui-border-t">
					<div class="ui-list-info">
						<h4 class="ui-nowrap">**********${ca.cardNo}</h4>
						<p>
							<span>${ca.cardBank}/${ca.cardType}</span>
						</p>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	</section>
	<!-- /.ui-container-->
	<script>
	function add(){
		window.location.href = 'add.do';
	}
	</script>
</body>
</html>
