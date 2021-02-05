<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
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
	<h1>Login</h1>
	<form method="post" action="login" name="loginFrm">
		<fieldset><legend>LogIn</legend>
			<label>User ID</label><input name="id" type="text" value="${dto.id}"><br> 
	        <label>Password</label><input name="pw" type="password"><br>
	    </fieldset>
	    <div id="buttons">
            <input type="submit" value="로그인" class="submit">
            <input type="button" value="회원가입" class="cancel"
            onclick="location.href='contract'">
            <input type="button" value="아이디 비밀번호 찾기" class="submit" onclick="find_id_pw()"> 
        </div>
	</form>
</article>
