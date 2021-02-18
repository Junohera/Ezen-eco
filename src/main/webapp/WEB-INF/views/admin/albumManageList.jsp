<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminhf/header.jsp" %>    
<style>
    * {
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
    <form action="albumManageList" method="GET">
        <input type="hidden" name="searchFilter" value="${search.searchFilter}">
        <label for="name">
            <select name="searchkeywordTarget">
                <option value="title" <c:if test="${empty search.searchkeywordTarget or search.searchkeywordTarget eq 'title'}">selected</c:if>>앨범제목</option>
                <option value="name" <c:if test="${search.searchkeywordTarget eq 'name'}">selected</c:if>>아티스트이름</option>
            </select>
            검색어 : 
            <input type="text" name="searchKeyword" value="${search.searchKeyword}">
        </label>
        <input type="submit" value="search">
        (${search.paging.totalCount})
        <select name="displayRow" onchange="this.form.submit();">
            <option value="5" <c:if test="${search.paging.displayRow eq 5}">selected</c:if>>5개씩 보기</option>
            <option value="10" <c:if test="${search.paging.displayRow eq 10}">selected</c:if>>10개씩 보기</option>
            <option value="15" <c:if test="${search.paging.displayRow eq 15}">selected</c:if>>15개씩 보기</option>
            <option value="20" <c:if test="${search.paging.displayRow eq 20}">selected</c:if>>20개씩 보기</option>
            <option value="30" <c:if test="${search.paging.displayRow eq 30}">selected</c:if>>30개씩 보기</option>
        </select>
        <input type="button" value="add" onclick="location.href='albumManageInsertForm'">
        <table border="1" style="width:950px;margin: 0 auto;" style="table-layout: fixed">
            <thead>
                <tr>
                    <th width="10px">번호</th>
                    <th width="10px">아티스트</th>
                    <th width="10px">앨범제목</th>
                    <th width="10px">앨범재킷</th>
                    <th width="10px">발매일</th>
                    <th width="10px">앨범타입</th>
                    <th width="10px">장르</th>
                    <th width="10px">순위</th>
                    <th width="10px">좋아요</th>
                    <th width="10px">곡수</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${albumList.size() ne 0}">
                        <c:forEach var="album" items="${albumList}" varStatus="status">
                            <tr>
                                <td>${album.rn}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty album.atimg}">
                                            <img src="${album.atimg}" width="30" height="30">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/upload/noimage.jpg" width="30" height="30">
                                        </c:otherwise>
                                    </c:choose>
                                    <br>
                                    ${album.name}
                                </td>
                                <td><a href="albumManageUpdateForm?atseq=${album.abseq}">${album.title}</a></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty album.img}">
                                            <img src="${album.img}" width="50">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/upload/noimage.jpg" width="50">
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><fmt:formatDate value="${album.pdate}" pattern="yyyy.MM.dd"></fmt:formatDate></td>
                                <td>${album.abtype}</td>
                                <td>${album.abgenre}</td>
                                <td>${album.rank}</td>
                                <td>${album.likecount}</td>
                                <td>${album.mucount}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="10"><h1 style="margin: 0 auto;font-size: 150%;color: black;min-height: 400px;line-height: 400px;">데이터가 없습니다.</h1></td></tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </form>

    <jsp:include page="paging/paging.jsp">
        <jsp:param value="${search.paging.page}" name="page"/>
        <jsp:param value="${search.paging.beginPage}" name="beginPage"/>
        <jsp:param value="${search.paging.endPage}" name="endPage"/>
        <jsp:param value="${search.paging.prev}" name="prev"/>
        <jsp:param value="${search.paging.next}" name="next"/>
        <jsp:param value="${search.paging.displayRow}" name="displayRow"/>
        <jsp:param value="albumManage" name="command"/>
    </jsp:include>
</article>