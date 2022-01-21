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
	<h2>JSP파일 인클루드하기</h2>
	<!-- 
	webapp하위에 생성된 jsp파일을 인클루드 할 때에는
	아래와 같이 루트경로를 사용하면 된다.
	 -->
	<%@ include file="/randomNum.jsp" %>
	
	<h2>JSP파일 링크 걸기</h2>
	<!-- 
	링크 생성시에도 컨텍스트 루트경로를 사용하면 된다.
	(여기서는 http://localhost:8888/springlegacy/)
	 -->
	<a href="<%= request.getContextPath()%>/randomNum.jsp">
		RandomNum.jsp 바로가기
	</a>
</body>
</html>