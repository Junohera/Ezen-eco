<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminhf/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function go_mod(pseq){
	document.frm.action = "memberUpdateForm?useq=" + useq;
	document.frm.submit();
}
function go_mov(){
	location.href = "MemberManage";
}
</script>
<article>
<br>
<br>
<br>
<h1>상품 상세 보기</h1> 
<form name="frm" method="post">
<table width="500" cellpadding="0" cellspacing="0" border="1">
    <tr><th>회원명</th><td>${memberVO.name}</td></tr>
    <tr><th>전화번호</th><td>${memberVO.phone}</td></tr>
    <tr><th>성별</th> <td>${memberVO.gender}</td></tr>
    <tr><th>멤버쉽</th><td>${memberVO.membership}</td> </tr>
    <tr><th>가입일</th><td>${memberVO.indate}</td> </tr>
</table>
<input id="login"  type="button" value="목록" onClick="go_mov()">           
</form>


</article>