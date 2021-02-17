<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>

<article >
	<form class="joinForm" action="memberUpdate" method="post" name="formm" >
		<div class="infoBox">	
			<label><input class="textbox" name="id" id="id"
					type="text" size="40" 	style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"
					value="${loginUser.id}" readonly></label><br>
			<label style="color:red;font-size:20px;">${message1}</label>
		</div>
		<div class="infoBox">	
			<br><label><input class="textbox" name="pw"
				placeholder="비밀번호(8자 이상)" type="password" size="40"
				style="padding-left: 0px; height: 60px; align-content: center;;"></label><br>
				<label style="color:red;font-size:80%;">${message2}</label> 
		</div>
		<div class="infoBox">	
			<br><label><input class="textbox" name="pwCheck"
				placeholder="비밀번호확인(8자 이상)" type="password" size="40"
				style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"></label><br>
			<label style="color:red;font-size:80%;text-align:left;margin-left:0px;">${message6}</label>
		</div>
		<div class="infoBox">		
			<br><label><input class="textbox" name="name"
				placeholder="이름(성명)" type="text" size="40"
				value="${loginUser.name}"
				style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"></label><br>
			<label style="color:red;font-size:80%;">${message3}</label>
		</div>
		<div class="infoBox">	
			<br><label style="font-size:100%;">성별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
				<input type="radio" name="gender" value="1" style="cursor:pointer"
				<c:choose>
					<c:when test="${empty loginUser.gender}">checked</c:when>
					<c:otherwise>
						<c:if test="${loginUser.gender eq '1'}">checked</c:if>
					</c:otherwise>
				</c:choose>
				> 남성 &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="gender" value="2" style="cursor:pointer"
				<c:choose>
					<c:when test="${empty loginUser.gender}"></c:when>
					<c:otherwise>
						<c:if test="${loginUser.gender eq '2'}">checked</c:if>
					</c:otherwise>
				</c:choose>
				> 여성
			</label><br>
		</div>
		<div class="infoBox">
			<br><label><input class="textbox" name="phone"
				placeholder="전화번호('-'포함 13자리)" type="text" size="40"
				value="${loginUser.phone}"
				style="padding-left: 0px; height: 60px; align-content: center; border-bottom: 2px solid silver;"></label><br>
			<label style="color:red;font-size:80%;">${message4}</label><br>
		</div>	
				<input class="submit" type="submit" value="정보수정" class="submit" style="width:74%">
				<br> 
				<div id="other_buttons">
					<input class="btn" type="reset" value="다시작성" style="height:60px;"class="cancel">
					<input class="btn" type="button" value="취소" style="margin-left:44px;height:60px;"class="return" onclick="location.href='/'">
				</div>
			<div class="clear"></div>
	</form>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>