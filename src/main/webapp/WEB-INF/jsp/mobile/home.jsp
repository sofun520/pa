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
<title>AdminLTE 2 | Top Navigation</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<link rel="stylesheet" href="${baseDir}/frozen/css/frozen.css">
<link rel="stylesheet" href="${baseDir}/frozen/css/demo.css">
<script src="${baseDir}/frozen/lib/zeptojs/zepto.min.js"></script>
<script src="${baseDir}/frozen/js/frozen.js"></script>
<style type="text/css">
</style>

</head>
<body ontouchstart>
	
	<iframe id="subFrame" src="menu.do"
				style="border: 0px; width: 100%; min-height: 600px; background-color: #ecf0f5;"></iframe>
	<script>
		$('.ui-list li,.ui-tiled li').click(function() {
			if ($(this).data('href')) {
				location.href = $(this).data('href');
			}
		});
		$('.ui-header .ui-btn').click(function() {
			location.href = 'index.html';
		});
	</script>
</body>
</html>
