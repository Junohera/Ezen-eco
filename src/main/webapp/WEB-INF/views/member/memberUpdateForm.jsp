<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>
<article style="height: 800px;">
	<form id="join" action="memberUpdate" method="post" name="formm" >
		<div id="inputInfo" style="margin-left: 80px">
			<label><input class="join_textbox" name="id" id="id"
					type="text" size="36" 	style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"
					value="${loginUser.id}" readonly></label><br>
			<label style="color:red;font-size:80%;">${message1}</label>
			
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
				value="${loginUser.name}"
				style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"></label><br>
			<label style="color:red;font-size:80%;">${message3}</label>
			
			<br><label style="font-size:140%;">성별&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
				<input type="radio" name="gender" value="1"
				<c:choose>
					<c:when test="${empty loginUser.gender}">checked</c:when>
					<c:otherwise>
						<c:if test="${loginUser.gender eq '1'}">checked</c:if>
					</c:otherwise>
				</c:choose>
				> 남성 &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
				<input type="radio" name="gender" value="2"
				<c:choose>
					<c:when test="${empty loginUser.gender}"></c:when>
					<c:otherwise>
						<c:if test="${loginUser.gender eq '2'}">checked</c:if>
					</c:otherwise>
				</c:choose>
				> 여성
			</label><br>
			
			<br><label><input class="join_textbox" name="phone"
				placeholder="전화번호('-'포함 13자리)" type="text" size="36"
				value="${loginUser.phone}"
				style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"></label><br>
			<label style="color:red;font-size:80%;">${message4}</label><br>
			
			<div id="join_buttons">
				<input class="btn" type="submit" value="정보수정" class="submit"> 
				<input class="btn" type="reset" value="다시작성" class="cancel">
				<input class="btn" type="button" value="취소" class="return" onclick="location.href='/'">
			</div>
			</div>
			<div class="clear"></div>
	</form>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>