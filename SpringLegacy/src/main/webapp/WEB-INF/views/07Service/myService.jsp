<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

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
	<h2>Service객체 알아보기</h2>
	<p>
		Service객체는 Controller와 Model사이에서
		<br />
		중재자 역할을 한다.
		<ul>
			<li>Controller : 요청분석 후 서비스 객체 호출</li>
			<li>Service :요청을 처리할 비즈니스 로직 실행</li>
			<li>Model : DB관련 CRUD작업</li>
		</ul>
	</p>
</div>
</body>
</html>