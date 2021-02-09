<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
 
<article>
<form id="join" action="join" method="post" name="formm" >
	<div id="inputInfo" style="margin-left: 80px">
		<label><input class="join_textbox" name="id" id="id"
				placeholder="아이디(이메일)" type="text" size="36"
				style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"
				value="${dto.id}"></label><br>
		<label style="color:red;font-size:80%;">${message1}</label>
		
		<input type="hidden" name="reid" value="${reid}">
		    <br><a style="font-size:12pt;">*(반드시 이메일 형식으로 작성해주세요)
		    <input id="recheck" type="button" value="중복 체크" class="dup" onclick="idCheck()"></a><br>
	    <label style="color:red;font-size:80%;">${message5}</label>
	    
	    <br><label><input class="join_textbox" name="pw"
			placeholder="비밀번호(8자 이상)" type="password" size="36"
			style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"></label><br>
			<label style="color:red;font-size:80%;">${message2}</label> 
	    
	    <br><label><input class="join_textbox" name="pwCheck"
			placeholder="비밀번호확인(8자 이상)" type="password" size="36"
			style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"></label><br>
		<label style="color:red;font-size:80%;">${message6}</label>
			
	    <br><label><input class="join_textbox" name="name"
			placeholder="이름(성명)" type="text" size="36"
			style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"></label><br>
		<label style="color:red;font-size:80%;">${message3}</label>
	    
	    <br><label style="font-size:140%;">성별&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
		    <input type="radio" name="gender" value="1" checked> 남성 &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
			<input type="radio" name="gender" value="2"> 여성
		</label><br>
		
		<br><label><input class="join_textbox" name="phone"
			placeholder="전화번호('-'포함 13자리)" type="text" size="36"
			style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"></label><br>
	    <label style="color:red;font-size:80%;">${message4}</label><br>
		
		<div id="join_buttons">
		    <input class="btn" type="submit" value="회원가입" class="submit"> 
		    <input class="btn" type="reset" value="취소" class="cancel">
		</div>
		</div>
		<div class="clear"></div>
</form>
</article>
<%@ include file="../include/headerfooter/footer.jsp" %>