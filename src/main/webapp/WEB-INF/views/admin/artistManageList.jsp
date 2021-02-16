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
    
    <form action="artistManageList" method="GET">
        <label for="name">
            검색어 : 
            <input type="text" name="searchKeyword" value="${search.searchKeyword}">
        </label>
        <input type="hidden" name="searchCondition" value="name">
        <input type="submit" value="search">
        <input type="button" value="add" onclick="location.href='artistManageInsertForm'">
    </form>

    <table border="1" style="width:950px;margin: 0 auto;">
        <thead>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>그룹여부</th>
                <th>성별</th>
                <th>장르</th>
                <th>이미지</th>
                <th>순위</th>
                <th>좋아요수</th>
                <th>앨범수</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${artistList.size() ne 0}">
                    <c:forEach var="artist" items="${artistList}" varStatus="status">
                        <tr>
                            <td>${artist.rn}</td>
                            <td><a href="artistManageUpdateForm?atseq=${artist.atseq}">${artist.name}</a></td>
                            <td>${artist.groupyn}</td>
                            <td>${artist.gender}</td>
                            <td>${artist.atgenre}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty artist.img}">
                                        <img src="${artist.img}" width="50">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/upload/noimage.jpg" width="50">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${artist.rank}</td>
                            <td>${artist.likecount}</td>
                            <td>${artist.albumList.size()}</td>
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

<jsp:include page="paging/paging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
    <jsp:param value="ArtistManage" name="command"/>
</jsp:include>