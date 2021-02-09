<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminhf/header.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function go_search_member() {
	var theForm = document.frm;
	if( theForm.key.value=="") return;
	theForm.action =  "MemberManage";
	theForm.submit();
}
function go_total_member() {
	var theForm = document.frm;
	theForm.key.value="";
	theForm.action =  "MemberManage";
	theForm.submit();
}
function go_detail(useq){
	document.frm.action = "adminMemberDetail?useq=" + useq;
	document.frm.submit();
}
</script>
<article>
<br>
<br>
<br>
<h1>회원리스트</h1>  
<form name="frm" method="post">
<table style="margin-left: auto; margin-right: auto;">
  <tr>
  <td> 
  회원 아이디
  <input type="text" name="key" value="${key}">
  <input class="btn" type="button" value="검색" 
  													onclick="go_search_member()">
  <input class="btn" type="button" name="btn_total" value="전체보기 "
													onClick="go_total_member()">
	<input type="hidden" name="all_view" value="y">
  </td>
  </tr>
</table>
<br>
<table style="margin-left: auto; margin-right: auto;" width="500" cellpadding="0" cellspacing="0" border="1">
  <tr><th>아이디</th><th>이름</th><th>전화</th><th>가입일</th></tr>
  <c:forEach items="${memberList}" var="memberVO">  
  <tr>
    <td style="text-align:left; padding-left:50px; padding-right:0px;">
	<a href="#" onClick="go_detail('${memberVO.useq}')">${memberVO.id}</td>
    <td> ${memberVO.name}</td>
    <td> ${memberVO.phone}</td> 
    <td> <fmt:formatDate value="${memberVO.indate}"/></td>
  </tr>
  </c:forEach>
</table>



</form>
<jsp:include page="paging/paging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
    <jsp:param value="MemberManage" name="command"/>
</jsp:include>
</article>