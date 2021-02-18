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
        <input type="hidden" name="searchFilter" value="${search.searchFilter}">
        <label for="name">
            <select name="searchCondition">
                <option value="name" <c:if test="${empty search.searchCondition or search.searchCondition eq 'name'}">selected</c:if>>이름</option>
            </select>
            검색어 : 
            <input type="text" name="searchKeyword" value="${search.searchKeyword}">
        </label>
        <input type="submit" value="search">
        <input type="button" value="add" onclick="location.href='artistManageInsertForm'">
        <select name="displayRow" onchange="this.form.submit();">
            <option value="5" <c:if test="${search.paging.displayRow eq 5}">selected</c:if>>5개씩 보기</option>
            <option value="10" <c:if test="${search.paging.displayRow eq 10}">selected</c:if>>10개씩 보기</option>
            <option value="15" <c:if test="${search.paging.displayRow eq 15}">selected</c:if>>15개씩 보기</option>
            <option value="20" <c:if test="${search.paging.displayRow eq 20}">selected</c:if>>20개씩 보기</option>
            <option value="30" <c:if test="${search.paging.displayRow eq 30}">selected</c:if>>30개씩 보기</option>
        </select>
        <table border="1" style="width:950px;margin: 0 auto;" style="table-layout: fixed">
            <thead>
                <tr>
                    <th width="10px">번호</th>
                    <th width="160px"><a href="#"
                        onclick="
                            <c:choose>
                                <c:when test="${search.searchFilter eq 'nameAsc'}">document.forms[0].searchFilter.value='nameDesc';</c:when>
                                <c:otherwise>document.forms[0].searchFilter.value='nameAsc';</c:otherwise>
                            </c:choose>
                            document.forms[0].submit();
                        ">이름</a></th>
                    <th width="15px"><a href="#"
                        onclick="
                            <c:choose>
                                <c:when test="${search.searchFilter eq 'groupynAsc'}">document.forms[0].searchFilter.value='groupynDesc';</c:when>
                                <c:otherwise>document.forms[0].searchFilter.value='groupynAsc';</c:otherwise>
                            </c:choose>
                            document.forms[0].submit();
                        ">그룹여부</a></th>
                    <th width="10px"><a href="#"
                        onclick="
                            <c:choose>
                                <c:when test="${search.searchFilter eq 'genderAsc'}">document.forms[0].searchFilter.value='genderDesc';</c:when>
                                <c:otherwise>document.forms[0].searchFilter.value='genderAsc';</c:otherwise>
                            </c:choose>
                            document.forms[0].submit();
                        ">성별</a></th>
                    <th width="10px"><a href="#"
                        onclick="
                            <c:choose>
                                <c:when test="${search.searchFilter eq 'gseqAsc'}">document.forms[0].searchFilter.value='gseqDesc';</c:when>
                                <c:otherwise>document.forms[0].searchFilter.value='gseqAsc';</c:otherwise>
                            </c:choose>
                            document.forms[0].submit();
                        ">장르</a></th>
                    <th width="50px">이미지</th>
                    <th width="10px"><a href="#"
                        onclick="
                            <c:choose>
                                <c:when test="${search.searchFilter eq 'rankAsc'}">document.forms[0].searchFilter.value='rankDesc';</c:when>
                                <c:otherwise>document.forms[0].searchFilter.value='rankAsc';</c:otherwise>
                            </c:choose>
                            document.forms[0].submit();
                        ">순위</a></th>
                    <th width="10px"><a href="#"
                        onclick="
                            <c:choose>
                                <c:when test="${search.searchFilter eq 'likecountAsc'}">document.forms[0].searchFilter.value='likecountDesc';</c:when>
                                <c:otherwise>document.forms[0].searchFilter.value='likecountAsc';</c:otherwise>
                            </c:choose>
                            document.forms[0].submit();
                        ">좋아요</a></th>
                    <th width="10px"><a href="#"
                        onclick="
                            <c:choose>
                                <c:when test="${search.searchFilter eq 'abcountAsc'}">document.forms[0].searchFilter.value='abcountDesc';</c:when>
                                <c:otherwise>document.forms[0].searchFilter.value='abcountAsc';</c:otherwise>
                            </c:choose>
                            document.forms[0].submit();
                        ">앨범수</a></th>
                    <th width="10px"><a href="#"
                        onclick="
                            <c:choose>
                                <c:when test="${search.searchFilter eq 'mucountAsc'}">document.forms[0].searchFilter.value='mucountDesc';</c:when>
                                <c:otherwise>document.forms[0].searchFilter.value='mucountAsc';</c:otherwise>
                            </c:choose>
                            document.forms[0].submit();
                        ">음악수</a></th>
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
                                <td>${artist.abcount}</td>
                                <td>${artist.mucount}</td>
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
        <jsp:param value="ArtistManage" name="command"/>
    </jsp:include>
</article>