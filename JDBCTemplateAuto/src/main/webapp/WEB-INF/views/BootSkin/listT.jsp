<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/header.jsp" %>
<body>
<div class="container">
    <!-- Top영역 -->
    <%@ include file="/top.jsp" %>
    <!-- Body영역 -->
    <div class="row">
        <!-- Left메뉴영역 -->
        <%@ include file="/left.jsp" %>
        <!-- Contents영역 -->
        <div class="col-9 pt-3">
            <h3>게시판 목록 - <small>자유게시판</small></h3>
            <!-- 검색 -->
            <div class="row">
                <form action="">
                    <div class="input-group ms-auto" style="width: 400px;">
                        <select name="" class="form-control">
                            <option value="">제목</option>
                            <option value="">내용</option>
                            <option value="">작성자</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Search" style="width: 200px;">
                        <button class="btn btn-success" type="submit">
                            <i class="bi-search" style="font-size: 1rem; color: white;"></i>
                        </button>
                    </div>
                </form>
            </div>
            <!-- 게시판 리스트 -->
            <div class="row mt-3 mx-1">
                <table class="table table-bordered table-hover table-striped">
                <thead>
                    <tr class="text-center">
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <!-- <th>첨부</th> -->
                    </tr>
                </thead>
                <tbody>
					<c:choose>
						<c:when test="${empty listRows }">
							<tr>
								<td colspan="6" class="text-center">
									등록된 게시물이 없습니다 ^^*
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${listRows }" var="row" 
								varStatus="loop">
								<!-- 리스트반복시작 -->
								<tr class="text-center">
									<td class="text-center">${row.virtualNum }</td>
									<td class="text-start">
										<a href="./viewT.do?idx=${row.idx}
											&nowPage=${nowPage}">${row.title}</a>
									</td>
									<td class="text-center">${row.name }</td>
									<td class="text-center">${row.postdate }</td>
									<td class="text-center">${row.hits }</td>
									<!-- <td><i class="bi-pin-angle-fill" style="font-size: 1rem;"></i></td> -->
								</tr>
								<!-- 리스트반복끝 -->
								
							</c:forEach>
						</c:otherwise>
					</c:choose>
                </tbody>
                </table>
                
                <!-- 페이지번호 -->
                <div class="row mt-3">
	                <div class="col">
	                    <ul class="pagination justify-content-center">
	                    	<li class="page-item">${pagingImg }</li>
	                    </ul>
	                </div>
	            </div>
            </div>
            <!-- 각종버튼 -->
            <div class="row">
                <div class="col d-flex justify-content-end">
                    <button type="button" class="btn btn-primary" onclick="location.href='./writeT.do';">글쓰기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright영역 -->
    <%@ include file="/copyright.jsp" %>
</div>
</body>
</html>