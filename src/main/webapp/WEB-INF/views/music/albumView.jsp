<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<style>
    ul, li {
        list-style-type: none;
        display: block;
    }
    li {
        display: inline-block;
    }
    a {
        text-decoration: none;
    }
</style>

${album}

<hr>

<br><br>
<h1>앨범 수록곡</h1>
<c:forEach var="music" items="${musicList}" varStatus="status">
    ${music} 
    <c:if test="${music.titleyn eq 'Y'}">
        <span style="color:blue; font-weight: bold; background:red;">타이틀</span>
    </c:if>
    <hr>
</c:forEach>
