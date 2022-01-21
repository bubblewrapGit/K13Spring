<%@page import="java.util.Random"%>
<%@page import="common.LottoCreater"%>
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
	<h2>RandomNum</h2>
	<%
	// 스크립트렛 내에서 코드 작성이 가능하다.
	Random random = new Random();
	out.println("난수 : " + random.nextInt(100));
	%>
	
	<h2>Lotto6/45</h2>
	<%
	// 클래스도 동일하게 사용할 수 있다.
	LottoCreater lottoCreater = new LottoCreater();
	int[] lottoNum = lottoCreater.lotto();
	for(int lo : lottoNum){
		out.println(lo);
	}
	%>
</body>
</html>