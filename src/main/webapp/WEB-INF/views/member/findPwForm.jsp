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
</head>
<body>
<c:if test="${message==5}">
	<script>
	alert("일치하는 아이디가 없습니다");
	</script>
</c:if>
<c:if test="${message==6}">
	<script>
	alert("이름이 일치하지 않습니다");
	</script>
</c:if>
<c:if test="${message==7}">
	<script>
	alert("전화번호가 일치하지 않습니다");
	</script>
</c:if>
<h2>비밀번호 찾기</h2>
<form method="post" name="frm" action="lookupIdNamePhone">
<table align="center" bgcolor="black" cellspacing="1" width="400">
	<tr align="center" bgcolor="white" >
		<td width="430">
			<h3>아이디 <input type="text" name="id" value="${id}"></h3></td></tr>
	<tr align="center" bgcolor="white" >
		<td width="430">
			<h3>성명 <input type="text" name="name" value="${name}"></h3></td></tr>
	<tr align="center" bgcolor="white" >
		<td width="430">
			<h3>전화번호 <input type="text" name="phone"  value="${phone}"></h3></td>
	</tr>
	<tr align="center" bgcolor="white" >
		<td width="430"><h3>	<input type="submit" value="인증번호 전송"></h3></td>
	</tr>
</table>
</form>
</body>
</html>