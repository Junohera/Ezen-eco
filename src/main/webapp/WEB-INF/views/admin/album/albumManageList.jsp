<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/adminhf/header.jsp" %>

<article style="min-height:500px;margin-top:100px;">
    
    <form action="albumManageList" method="GET">
        <label for="name">
            검색어 : 
            <input type="text" name="searchKeyword" value="${search.searchKeyword}">
        </label>
        <input type="hidden" name="searchCondition" value="title">
        <input type="submit" value="search">
        <input type="button" value="add" onclick="location.href='albumManageInsertForm'">
    </form>

    <table border="1" style="width:950px;margin: 0 auto;">
        <thead>
            <tr>
                <th>앨범번호</th>
                <th>이미지</th>
                <th>타이틀</th>
                <th>가수</th>
                <th>장르</th>
                <th>앨범타입</th>
                <th>발매일</th>
                <th>좋아요수</th>
                <th>수록곡수</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${albumList.size() ne 0}">
                    <c:forEach var="album" items="${albumList}" varStatus="status">
                        <tr>
                            <td>${album.abseq}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty album.img}">
                                        <img src="${album.img}" width="50">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="../upload/noimage.jpg" width="50">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><a href="albumManageUpdateForm?abseq=${album.abseq}">${album.title}</a></td>
                            <td>${album.name}</td>
                            <td>${album.abgenre}</td>
                            <td>${album.abtype}</td>
                            <td><fmt:formatDate value="${album.pdate}" type="date" pattern="yyyy.MM.dd"/></td>
                            <td>${album.likecount}</td>
                            <td>${album.musicList.size()}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="9"><h1 style="margin: 0 auto;font-size: 150%;color: black;min-height: 400px;line-height: 400px;">데이터가 없습니다.</h1></td></tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</article>

<jsp:include page="../paging/paging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
    <jsp:param value="albumManageList" name="command"/>
</jsp:include>