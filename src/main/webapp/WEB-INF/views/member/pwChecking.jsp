<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>
<article style="height: 400px;">
	<form id="wrap" method="post" action="pwRechecking" name="checkingFrm">
		<div>비밀번호를 입력하세요
		<br>
			아이디:<a id="id" name="id">${loginUser.id}</a><br>
			<input type="password" id="pw" name="pw">
			<input type="submit" id="submit" value="확인">
			<br><label>${message}</label>
		</div>
	</form>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>