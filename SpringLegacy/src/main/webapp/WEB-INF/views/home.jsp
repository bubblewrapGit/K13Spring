<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="/springlegacy/static/bootstrap-5.1.3/css/bootstrap.css" />
	<script type="text/javascript" src="/springlegacy/resources/jquery/jquery-3.6.0.js"></script>
</head>
<body>
<div class="container">
	<h2>Spring Framework 시작하기</h2>
	<br><hr><br>
<!-- 
Spring MVC에서는 이미지와 같은 정적 리소스를 사용하기 위해 별도의 resources 폴더를 제공한다.
해당 폴더의 매핑은 servlet-context.xml에서 변경하거나 추가할 수 있다.
 -->
	<h3>resources 폴더 사용하기</h3>
	<!-- 
	views폴더 하위에 있는 해당 이미지는 출력되지 않는다.
	views폴더는 View파일, 즉 jsp만 위차할 수 있다.
	 -->
	<img src="./img_avatar1.png" alt="부트스트랩 아바타1" />
	<!-- 
	원래의 폴더명은 resources이나 아래와 같이 개발자가 별도로 별칭을 부여하여 매필할 수 있다.
	 -->
	<img src="./resources/images/img_avatar2.png" alt="아바타2" width="200"/>
	<img src="./static/images/1.png" alt="스펀지밥" width="200"/>

	<br><hr><br>
	<!-- 1. 컨트롤러 제작을 위해 요청명을 결정한다. -->
	<h3>첫번째 컨트롤러 만들기</h3>
	<li>
		<a href="./home/helloSpring" target="_blank">첫번째 컨트롤러</a>
	</li>

	<br><hr><br>
	<!-- 컨트롤러 : FormController.java -->
	<h3>form값 처리하기1</h3>
	<li>
		<a href="./form/servletRequest?id=kosmo&pw=1234" target="_black">
			HttpServletRequest로 폼값 받기
		</a>
	</li>
	
	<h3>form값 처리하기2</h3>
	<li>
		<a href="./form/requestParam.do?id=kosmo&pw=1234&name=홍길동&email=hong@gildong.com" target="_black">
			requestParam로 폼값 받기
		</a>
	</li>

	<h3>form값 처리하기3</h3>
	<li>
		<a href="./form/commandObjGet.do?id=kosmo&pw=1234&name=홍길동&email=hong@gildong.com" target="_black">
			커맨트(Command)객체로 한번에 폼값받기
		</a>
	</li>
	
	<h3>form값 처리하기4</h3>
	<li>
		<a href="./form/gildong99/코스모" target="_black">
			pathVariable 어노테이션으로 폼값받기
		</a>
	</li>
	
	<br><hr><br>
	
	<!-- 컨트롤러 : RequestMappingController.java -->
	<h3>@RequestMapping 어노테이션 활용</h3>
	<li>
		<a href="./requestMapping/index.do" target="_black">
			requestMapping 시작페이지 바로가기
		</a>
	</li>

	<br><hr><br>
	
	<!-- 컨트롤러 : ValidateController.java -->
	<h3>폼 데이터 검증하기 - Validator</h3>
	<li>
		<a href="validate/memberRegist.do" target="_black">
			회원가입 바로가기
		</a>
	</li>
	
	<br><hr><br>
	
	<!-- 컨트롤러 : EnvironmentController -->
	<h3>Environment 객체를 이용한 외부파일 참조하기</h3>
	<li>
		<a href="environment/main1" target="_black">
			외부파일 참조하기 1(Environment 객체 사용)
		</a>
	</li>
	
	<br><hr><br>
	
	<!-- 컨트롤러 : DIController.java-->
	<h3>DI(Dependency Injection) : 의존성 주입</h3>
	<li>
		<a href="di/mydi1.do" target="_black">
			XML설정파일을 통한 빈 생성1(생성자와 setter)
		</a>
	</li>

	<li>
		<a href="di/mydi2.do" target="_black">
			XML설정파일을 통한 빈 생성2(다양한 멤버변수)
		</a>
	</li>
	
	<li>
		<a href="di/mydi3.do" target="_black">
			어노테이션을 통한 빈 생성
		</a>
	</li>
	
	<br><hr><br>
	<h3>파일업로드</h3>
	<li>
		<a href="fileUpload/uploadPath.do" target="_black">
			upload폴더의 물리적 경로 확인하기
		</a>
	</li>
	<li>
		<a href="fileUpload/uploadForm.do" target="_black">
			파일업로드 폼
		</a>
	</li>
	<li>
		<a href="fileUpload/uploadList.do" target="_black">
			파일목록보기
		</a>
	</li>
	
	<br><hr><br>
	
	<h3>@Controller :  @Service : @Repository : 어노테이션</h3>
	<h4>Auto scan 으로 자동으로 생성되는 빈</h4>
	<li>
		<a href="./service/myService.do" target="_blank">
			myService 바로가기
		</a>
	</li>
	<li>
	<!-- resources폴더에는 html파일을 생성한 후 직접 실행할 수 있다. -->
		<a href="./resources/lottoForm.html" target="_blank">
			Lotto 바로가기
		</a>
	</li>
	
	<br><hr><br>
	<h3>HTML / JSP 파일 사용하기</h3>
	<!-- 
	HTML파일은 webapp 하위에서는 사용할 수 없다.
	resources 폴더 하위에서만 사용할 수 있다.
	 -->
	<li>
		<a href="./notFound.html" target="_blank">HTML 파일 사용X</a>
		&nbsp;&nbsp;&nbsp;
		<a href="./resources/found.html" target="_blank">html 파일 사용O</a>
		&nbsp;&nbsp;&nbsp;
		<a href="./static/found.html" target="_blank">html 파일 사용O(링크경로 별칭 사용)</a>
	</li>
	<!-- 
		webapp하위에서는 JSP파일은 사용할 수 없다.
		jsp이므로 스크립트렛이나 클래스 임포트 등도 모루 가능하다.
	 -->
 	<li>
 		<a href="./randomNum.jsp" target="_blank">jsp 파일 사용하기</a>
 	</li>
 	<li>
 		<a href="./htmlJspUsed/includeUse.do" target="_blank">
 			요청명 방식에서 파일 인클루드 하기
 		</a>
 	</li>

	
</div>
</body>
</html>
