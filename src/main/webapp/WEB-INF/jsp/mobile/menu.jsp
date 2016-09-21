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
	<header class="ui-header ui-header-positive ui-border-b"> <i
		class="ui-icon-return" onclick="history.back()"></i>
	<h1>功能主页</h1>
	<button class="ui-btn" onclick="logout()">注销</button>
	</header>
	<section class="ui-container">
	<div class="demo-item">
		<div class="demo-block">
			<ul class="ui-list ui-list-link ui-border-tb">
				<c:forEach items="${list}" var="me">
					<li class="ui-border-t" onclick="javascript:got('${me.menuUrl}')">
						<div class="ui-list-info">
							<h4 class="ui-nowrap">${me.menuName}</h4>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	</section>


	<!-- /.ui-container-->
	<script>

		function got(url) {
			window.location.href = url;
		}
		
		function logout(){
			window.location.href = '../logout.do';
		}
	</script>
</body>
</html>
