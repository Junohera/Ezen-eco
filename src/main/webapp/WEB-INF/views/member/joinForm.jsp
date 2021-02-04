<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
 
<article>
<form id="join" action="join" method="post" name="formm" >
	<fieldset>
		<legend>Basic Info</legend>
		<label>User ID</label><input type="text" name="id" size="12" value="${dto.id}">
		*(반드시 이메일 형식으로 작성해주세요)
		<input type="hidden" name="reid" value="${reid}">
		    <input type="button" value="중복 체크" class="dup" onclick="idcheck()"><br>
		    <label>Password</label><input type="password" name="pwd"><br> 
		    <label>Retype Password</label><input type="password" name="pwdCheck"><br> 
		    <label>Name</label><input type="text"  name="name"><br> 
		    <label>E-Mail</label><input type="text"  name="email"><br>
		    <label>${message}</label><br>
			<label>Phone Number</label><input  type="text" name="phone"><br>
	</fieldset>
	<div class="clear"></div>
	<div id="buttons">
	    <input type="submit" value="회원가입" class="submit"> 
	    <input type="reset" value="취소" class="cancel">
	</div>
</form>
</article>
