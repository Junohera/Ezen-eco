<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function go_search_theme() {
	var theForm = document.frm;
	if( theForm.key.value=="") return;
	theForm.action =  "ThemeManage?first=yes";
	theForm.submit();
}
function go_total_theme() {
	var theForm = document.frm;
	theForm.key.value="";
	theForm.action =  "ThemeManage?first=yes";
	theForm.submit();
}
function go_detail(tseq){
	document.frm.action = "adminThemeDetail?tseq=" + tseq;
	document.frm.submit();
}
function insertTheme(){
	document.frm.action = "themeInsertForm";
	document.frm.submit();
}
</script>
<article>
<br>
<br>
<br>
<h1>테마리스트</h1>  
<form name="frm" method="post">
<table style="margin-left: auto; margin-right: auto;">
  <tr>
  <td> 
  테마 제목
  <input type="text" name="key" value="${key}">
  <input class="btn" type="button" value="검색" 
  													onclick="go_search_theme()">
  <input class="btn" type="button" name="btn_total" value="전체보기 "
													onClick="go_total_theme()">
	<input type="hidden" name="all_view" value="y">
	<input class="btn" type="button" value="테마추가"
													onClick="insertTheme()">
  </td>
  </tr>
</table>
<br>
<table border="1" style="width:500px;margin: 0 auto;">
  <tr><th>테마번호</th><th>테마제목</th><th>테마이미지</th>
  <c:forEach items="${themeList}" var="ThemeVO">  
  <tr>
    <td align="center">${ThemeVO.tseq}</td>
    <td style="text-align:left; padding-left:50px; padding-right:0px;">
	<a href="#" onClick="go_detail('${ThemeVO.tseq}')">${ThemeVO.title}</td>
    <td align="center" valign="top">
				<c:choose>
					<c:when test="${empty ThemeVO.img}">
						<img src="/upload/noimage.jpg" width="20">
					</c:when>
					<c:otherwise>
						<img src="/upload/${ThemeVO.img}" width="20">
					</c:otherwise>
				</c:choose>
			</td>
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
    <jsp:param value="ThemeManage" name="command"/>
</jsp:include>
</article>