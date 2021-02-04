<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

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
	${message}
</article>
