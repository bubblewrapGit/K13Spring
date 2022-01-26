<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 스프링 시큐리티에서 제공하는 태그라이브러리를 사용하기 위한 지시어 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   

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
	<h2>스프링 시큐리티 Step2</h2>
	
	<h3>로그인 화면 커스텀으로 구현하기</h3>
	
	<h4>필요권한 : USER or ADMIN 중 하나가 필요</h4>
	
	<h4>
		사용자 아이디 : ${user_id }
	</h4>
	
	<form:form method="post" action="${pageContext.request.contextPath }/security2/logout">
		<input type="submit" value="로그아웃" />
	</form:form>
	
	<jsp:include page="/resources/common_link.jsp"/>
</div>
</body>
</html>