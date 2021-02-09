<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>
<c:if test="${message==4}">
	<script>
		alert("ID를 입력하세요");
	</script>
</c:if>
<c:if test="${message==5}">
	<script>
		alert("비밀번호를 입력하세요");
	</script>
</c:if>

<c:if test="${message==3}">
	<script>
		alert("ID가 없습니다");
	</script>
</c:if>
<c:if test="${message==2}">
	<script>
		alert("비밀번호 오류. 관리자에게 문의하세요");
	</script>
</c:if>
<c:if test="${message==1}">
	<script>
		alert("비밀번호가 맞지 않습니다");
	</script>
</c:if>
<article>
	<form method="post" action="login" name="loginFrm">
		<div id="inputInfo" style="margin-left: 80px">
			<label><input class="textbox" name="id"
				placeholder="아이디(이메일)" type="text" size="36"
				style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"
				value="${dto.id}"></label><br>
			<br> <label><input class="textbox" name="pw"
				placeholder="비밀번호(8자 이상)" type="password" size="36"
				style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"></label><br>

			<input id="login" type="submit" value="로그인" class="submit">
			<br>
			<input class="btn" type="button" value="회원가입" class="join"
				onclick="location.href='contract'">&nbsp;&nbsp;&nbsp;<input class="btn"
				type="button" value="아이디 비밀번호 찾기" class="submit"
				onclick="find_id_pw()">
		</div>
	</form>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>