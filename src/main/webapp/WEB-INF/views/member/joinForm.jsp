<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
 
<article>
<form id="join" action="join" method="post" name="formm" >
	<fieldset>
		<legend>Basic Info</legend>
		<label>아이디</label><input type="text" name="id" size="12" value="${dto.id}">
		
		<input type="hidden" name="reid" value="${reid}">
		    <input type="button" value="중복 체크" class="dup" onclick="idcheck()"><br>
		    *(반드시 이메일 형식으로 작성해주세요)
		    <br>
		    <label>비밀번호</label><input type="password" name="pw"><br> 
		    <label>비밀번호 확인</label><input type="password" name="pwCheck"><br> 
		    <label>성함</label><input type="text"  name="name"><br> 
		    <label>성별</label>
			    <input type="radio" name="gender" value="1" checked> 남성 &nbsp; &nbsp; &nbsp;
				<input type="radio" name="gender" value="2"> 여성<br>
			<label>전화번호</label><input  type="text" name="phone"><br>
		    <label>${message}</label><br>
	</fieldset>
	<div class="clear"></div>
	<div id="buttons">
	    <input type="submit" value="회원가입" class="submit"> 
	    <input type="reset" value="취소" class="cancel">
	</div>
</form>
</article>
