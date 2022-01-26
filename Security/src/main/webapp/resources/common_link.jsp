<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>
<body>
<div class="container">
<style>
ul {
	list-style-type:none;
}
ul li{
	float:left; border:1px solid #888888; padding-right:10px;
}
</style>
<ul>
	<li><a href="${pageContext.request.contextPath}/">홈 바로가기</a></li>
	<li><a href="${pageContext.request.contextPath}/security2/login.do">로그인 페이지 바로가기</a></li>
	<li><a href="${pageContext.request.contextPath}/security2/index.do">프론트 페이지 바로가기</a></li>
	<li><a href="${pageContext.request.contextPath}/security2/admin/main.do">관리자 모드 바로가기</a></li>
	<li><a href="${pageContext.request.contextPath}/security2/accessDenied.do">접근불가 페이지 바로가기</a></li>
</ul>


</div>
</body>
</html>