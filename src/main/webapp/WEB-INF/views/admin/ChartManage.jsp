<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function go_search_chart() {
	var theForm = document.frm;
	if( theForm.key.value=="") return;
	theForm.action =  "ChartManage?first=yes";
	theForm.submit();
}
function go_total_chart() {
	var theForm = document.frm;
	theForm.key.value="";
	theForm.action =  "ChartManage?first=yes";
	theForm.submit();
}
function go_detail(atseq){
	document.frm.action = "adminArtistDetail?atseq=" + atseq;
	document.frm.submit();
}
function insertChart(){
	document.frm.action = "chartInsertForm";
	document.frm.submit();
}
</script>
<article>
<br>
<br>
<br>
<h1>차트리스트</h1>  
<form name="frm" method="post">
<table style="margin-left: auto; margin-right: auto;">
  <tr>
  <td> 
  차트 제목
  <input type="text" name="key" value="${key}">
  <input class="btn" type="button" value="검색" 
  													onclick="go_search_chart()">
  <input class="btn" type="button" name="btn_total" value="전체보기 "
													onClick="go_total_chart()">
	<input type="hidden" name="all_view" value="y">
	<input class="btn" type="button" value="차트추가"
													onClick="insertChart()">
  </td>
  </tr>
</table>
<br>
<table style="margin-left: auto; margin-right: auto;" width="500" cellpadding="0" cellspacing="0" border="1">
  <tr><th>차트번호</th><th>차트제목</th><th>차트이미지</th>
  <c:forEach items="${chartList}" var="ChartVO">  
  <tr>
    <td>${ChartVO.cseq}</td>
    <td> ${ChartVO.title}</td>
    <td align="center" valign="top">
				<c:choose>
					<c:when test="${empty ChartVO.img}">
						<img src="/upload/noimage.jpg" width="20">
					</c:when>
					<c:otherwise>
						<img src="/upload/${ChartVO.img}" width="20">
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
    <jsp:param value="ChartManage" name="command"/>
</jsp:include>
</article>