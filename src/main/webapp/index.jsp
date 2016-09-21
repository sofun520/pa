<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		/*
		 * 智能机浏览器版本信息:
		 *
		 */
		var browser = {
			versions : function() {
				var u = navigator.userAgent, app = navigator.appVersion;
				return {//移动终端浏览器版本信息
					trident : u.indexOf('Trident') > -1, //IE内核
					presto : u.indexOf('Presto') > -1, //opera内核
					webKit : u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
					gecko : u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
					mobile : !!u.match(/AppleWebKit.*Mobile.*/)
							|| !!u.match(/AppleWebKit/), //是否为移动终端
					ios : !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
					android : u.indexOf('Android') > -1
							|| u.indexOf('Linux') > -1, //android终端或者uc浏览器
					iPhone : u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
					iPad : u.indexOf('iPad') > -1, //是否iPad
					webApp : u.indexOf('Safari') == -1
				//是否web应该程序，没有头部与底部
				};
			}(),
			language : (navigator.browserLanguage || navigator.language)
					.toLowerCase()
		}

		if (browser.versions.ios) {
			window.location.href='mobileLogin.do';
		} else if (browser.versions.android) {
			window.location.href='mobileLogin.do';
		} else if (browser.versions.iPhone) {
			window.location.href='mobileLogin.do';
		}else{
			window.location.href='login.do';
		}

		document.writeln("语言版本: " + browser.language + "<br/>");
		document.writeln(" 是否为移动终端: " + browser.versions.mobile + "<br/>");
		document.writeln(" ios终端: " + browser.versions.ios + "<br/>");
		document.writeln(" android终端: " + browser.versions.android + "<br/>");
		document.writeln(" 是否为iPhone: " + browser.versions.iPhone + "<br/>");
		document.writeln(" 是否iPad: " + browser.versions.iPad + "<br/>");
		document.writeln("userAgent:" + navigator.userAgent + "<br/>");
	</script>
</body>
</html>