<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<c:if test="${message==11}">
	<script>
		alert("이미 이용권이 구매되어 있습니다");
	</script>
</c:if>

<article>
<form class="joinForm" action="buying" method="post" name="formm">
	<h2>ECO 이용권 구매</h2>
	<div>
		<input type="radio" name="membership" value="1" checked>
		<div id="product30">무제한 듣기 30일</div>
	</div>
	<div>
		<input type="radio" name="membership" value="2">
		<div id="product7">무제한 듣기 7일</div>
	</div>
	<div>
		<input type="radio" name="membership" value="3" >
		<div id="product1">무제한 듣기 1일</div>
	</div>
	<input type="submit" value="구매하기">
	<input type="button" value="메인으로" onclick="location.href='/'">		
</form>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>