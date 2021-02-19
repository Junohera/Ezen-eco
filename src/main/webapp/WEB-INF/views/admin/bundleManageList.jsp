<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminhf/header.jsp" %>

<style>
    article * {
        font-size: 95%;
    }
</style>
<script>
    $(function() {
        if ("${message}" !== "") {
            alert("${message}");
        }
    });
</script>
<article style="min-height:500px;margin-top:100px;">
    <form action="bundleManageList" method="GET">
        
    </form>
</article>

<jsp:include page="paging/paging.jsp">
    <jsp:param value="${paging.page}" name="page" />
    <jsp:param value="${paging.beginPage}" name="beginPage" />
    <jsp:param value="${paging.endPage}" name="endPage" />
    <jsp:param value="${paging.prev}" name="prev" />
    <jsp:param value="${paging.next}" name="next" />
    <jsp:param value="ArtistManage" name="command" />
</jsp:include>