<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminhf/header.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function go_search_artist() {
	var theForm = document.frm;
	if( theForm.key.value=="") return;
	theForm.action =  "ArtistManage";
	theForm.submit();
}
function go_total_artist() {
	var theForm = document.frm;
	theForm.key.value="";
	theForm.action =  "ArtistManage";
	theForm.submit();
}
function go_detail(atseq){
	document.frm.action = "adminArtistDetail?atseq=" + atseq;
	document.frm.submit();
}
</script>
<article>
<br>
<br>
<br>
<h1>아티스트리스트</h1>  
<form name="frm" method="post">
<table style="margin-left: auto; margin-right: auto;">
  <tr>
  <td> 
  아티스트 이름
  <input type="text" name="key" value="${key}">
  <input class="btn" type="button" value="검색" 
  													onclick="go_search_artist()">
  <input class="btn" type="button" name="btn_total" value="전체보기 "
													onClick="go_total_artist()">
	<input type="hidden" name="all_view" value="y">
  </td>
  </tr>
</table>
<br>
<table style="margin-left: auto; margin-right: auto;" width="500" cellpadding="0" cellspacing="0" border="1">
  <tr><th>아티스트명</th><th>그룹유무</th><th>성별</th><th>장르</th></tr>
  <c:forEach items="${artistList}" var="Artist">  
  <tr>
    <td style="text-align:left; padding-left:50px; padding-right:0px;">
	<a href="#" onClick="go_detail('${Artist.atseq}')">${Artist.name}</td>
    <td> ${Artist.groupyn}</td>
    <td> ${Artist.gender}</td>
    <td> ${Artist.gseq}</td>
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
    <jsp:param value="ArtistManage" name="command"/>
</jsp:include>
</article>