<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- fontawesome: image대신 아이콘을 활용할 수 있음. + 색깔변경 가능 -->
<script src="https://kit.fontawesome.com/aeb6e503f2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/main.css">
<script src="js/jquery-3.5.1-min.js"></script>
<script src="js/member.js"></script>

<!-- 페이지별 필요한 스크립트 사용 -->
<c:if test="${
	fn:contains(pageContext.request.requestURI,'music/browse')
	or fn:contains(pageContext.request.requestURI,'music/musicView')
	or fn:contains(pageContext.request.requestURI,'music/albumView')
	or fn:contains(pageContext.request.requestURI,'music/artistView')
}">
	<script src="js/music.js"></script>
</c:if>


</head>
<body>
	<!-- 화면단 로그인 여부 체크용 -->
	<input type="hidden" name="useq" value="${loginUser.useq}">
	<header>
		<div class="headerBox">
			<div class="header">
				<a href="/"><div class="logo"></div></a>
				<ul class="headerTextL">
					<li><a class="headerFont" href="browse">둘러보기</a></li>
					<li><a class="headerFont"  href="storage">보관함</a></li>
					<li><a class="headerFont"  href="membership">이용권</a></li>
				</ul>
				<div class="searchBox">
					<div class="searchImg"></div>
					<input class="searchText" type="text">
				</div>
				<c:choose>
					<c:when test="${empty loginUser}">
						<ul class="headerTextR">
						<li><a class="headerFont"  href="loginForm">로그인</a></li>
						<li><a class="headerFont"  href="contract">회원가입</a></li>
					</ul>	
					</c:when>
					<c:otherwise>
					<ul class="headerText">
						   <li>
							   <a class="headerFont" id="userNameBox"  href="memberEditForm">
									   ${loginUser.name} 님
							   </a>
						   </li>
						<li><a class="headerFont"  href="logout">로그아웃</a></li>
					</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>

	<div id="viewBox">
