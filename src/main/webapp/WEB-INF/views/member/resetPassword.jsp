<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{background:pink;}
</style>
<script type="text/javascript" >
function resetPw(){
	if(document.frm.pw==""){
		alert("비밀번호를 입력하세요");
		document.frm.pw.focus();
		return false;
	}
	if(document.frm.pw==document.frm.pwd_chk){
		alert("비밀번호확인이 일치하지 않습니다");
		document.frm.pwd_chk.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<c:if test="${message==1}">
	<script>
	alert("비밀번호를 입력하세요");
	</script>
</c:if>
<c:if test="${message==2}">
	<script>
	alert("비밀번호가 일치하지 않습니다");
	</script>
</c:if>

<h2>비밀번호 재설정</h2>
<h4>아래에 비밀번호를 입력하여 비밀번호를 재설정 해주세요</h4>
<form method="post" name="frm" action="resetPw">
<input type="hidden" name="id" value="${member.id}">
<table align="center" bgcolor="black" cellspacing="1" width="400">
	<tr align="center" bgcolor="white" >
		<td width="430">
			<h3>비밀번호 <input type="password" name="pw"></h3></td>
	</tr>
	<tr align="center" bgcolor="white" >
		<td width="430">
			<h3>비밀번호확인 <input type="password" name="pwd_chk"></h3></td>
	</tr>
	<tr align="center" bgcolor="white" >
		<td width="430"><h3>
		<input type="submit" value="비밀번호 재설정" onClick="return resetPw();"></h3></td>
	</tr>
</table>
</form>
</body>
</html>