<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>
<style>
	/* Login Css */
    /* 로그인  css 시작(헤더에 css있으므로, css적용 후 스타일부분 제거할 것)*/
    #userLoginForm {position:relative;margin:0 auto;width:600px;height:480px;border:3px solid silver;background:none;padding:50px;padding-top:100px; z-index:20;}
   #inputInfo{align-content:center;width:100%;height:100%;z-index:3;}
    .textbox{position:relative;color:black; border:0px;margin-bottom:20px; border-bottom:2px silver;font-size:18px;height:50px;font-weight:bold;}
    input::placeholder{color: silver;}
    #login{width:402px;height:70px;padding:0px;margin:30px 0px;border:none;background:#C9C6F7;border-radius:10px;font-size:140%;color:black;font-weight:bold;}
    .btn{position:relative;width:196px;height:50px;border:none;background:#C9C6F7;border-radius:10px;font-size:100%;color:black;font-weight:bold;}
    /* 로그인 끝 */
</style>
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
	<form id="userLoginForm" method="post" action="login" name="loginFrm">
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