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
	<h1>套现信息</h1>
	<button class="ui-btn" onclick="add()">新增</button>
	</header>
	<section class="ui-container">

	<div class="demo-block">
		<table class="ui-table ui-border-tb">
			<thead>
				<tr>
					<th>序号</th>
					<th>卡号</th>
					<th>金额</th>
					<th>费率</th>
					<th>手续费</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list== null || fn:length(list) == 0}">
					<tr>
						<td colspan="5" align="center">没有内容</td>
					</tr>
				</c:if>
				<c:if test="${list!= null}">
					<c:forEach items="${list}" var="ca" varStatus="xh">
						<tr>
							<td>${xh.count}</td>
							<td>${ca.card.cardNo}(${ca.card.cardBank})</td>
							<td>${ca.cashAmount}</td>
							<td><fmt:formatNumber type="number"
									value="${ca.cashFate*100}" pattern="0.000"
									maxFractionDigits="2" />%</td>
							<td><fmt:formatNumber type="number"
									value="${ca.cashAmount*ca.cashFate}" pattern="0.00"
									maxFractionDigits="2" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	</section>
	<!-- /.ui-container-->
	<script>
		function add() {
			window.location.href = 'add.do';
		}
	</script>
</body>
</html>
