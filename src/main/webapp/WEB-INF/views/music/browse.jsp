<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<article id="music_browse">
    <ul id="themeAndGenre">
        <!-- 차트 -->
        <c:forEach var="chart" items="${chartList}" varStatus="status">
            <li <c:if test="${selectedType eq 'chart' and selectedSeq eq chart.cseq}">class="selected"</c:if>>
                <a href="/browse?selectedType=chart&selectedSeq=${chart.cseq}">${chart.title}</a>
            </li> 
        </c:forEach>
    
        <!-- 장르 -->
        <c:forEach var="genre" items="${genreList}" varStatus="status">
            <li <c:if test="${selectedType eq 'genre' and selectedSeq eq genre.gseq}">class="selected"</c:if>>
                <a href="/browse?selectedType=genre&selectedSeq=${genre.gseq}">${genre.title}</a>
            </li> 
        </c:forEach>
    </ul>
    
    <div class="waste">
        <!-- 선택된 타입이 차트면 제목은 차트의 타이틀, 장르면 제목은 장르의 타이틀 (디폴트값이 chart, "1"이기 때문에 otherwise는 구문은 없음)-->
        <h4 class="selectedTitle">
            <c:choose>
                <c:when test="${selectedType eq 'chart'}">
                    <c:forEach var="chart" items="${chartList}" varStatus="status">
                        <c:if test="${chart.cseq == selectedSeq}">${chart.title}</c:if>
                    </c:forEach>        
                </c:when>
                <c:when test="${selectedType eq 'genre'}">
                    <c:forEach var="genre" items="${genreList}" varStatus="status">
                        <c:if test="${genre.gseq == selectedSeq}">${genre.title}</c:if>
                    </c:forEach>        
                </c:when>
            </c:choose>
        </h4>
    
        <!-- 전체듣기 -->
        <a class="allListen iconButton" id="playListAddAll" style="cursor: pointer;">
            <span style="font-weight: 100; font-size: 10px; color: #333333;">
                <i class="fas fa-play"></i>
            </span>
            전체듣기
        </a>
    </div>
    
    <div style="clear:both;"></div>
    
    
    <table id="listBox">
        <tr>
            <th align="center"><input type="checkbox" name="allCheck"></th>
            <th align="center">순위</th>
            <th>곡/앨범</th>
            <th>아티스트</th>
            <th>듣기</th>
            <th>재생목록</th>
            <th>내 리스트</th>
            <th>더보기</th>
        </tr>
        <c:choose>
            <c:when test="${musicList.size() > 0}">
                <c:forEach var="music" items="${musicList}" varStatus="status">
                    <tr height="84" class="musicTr">
                        <input type="hidden" name="mseq" value="${music.mseq}">
                        <input type="hidden" name="abseq" value="${music.abseq}">
                        <input type="hidden" name="atseq" value="${music.atseq}">
                        <input type="hidden" name="title" value="${music.title}">
                        <input type="hidden" name="src" value="${music.src}">
                        <input type="hidden" name="abimg" value="${music.abimg}">
                        <input type="hidden" name="name" value="${music.name}">

                        <!-- 좋아하는 음악 시퀀스 목록중 동일하면 isLike 출력 -->
                        <c:forEach var="likeMseq" items="${likeMusicList}">
                            <c:if test="${likeMseq eq music.mseq}">
                                <input type="hidden" name="likeyn" value="y">
                            </c:if>
                        </c:forEach>

                        <td><input type="checkbox" name="mseq_checkbox" value="${music.mseq}"></td>
                        <td>${status.count}</td>
                        <td>
                            <div class="justWrap">
                                <div class="contentWrap">
                                    <img src="${music.abimg}" alt="" width="60" height="60">
                                    <a href="musicView?mseq=${music.mseq}">${music.title}</a>
                                    <a href="albumView?abseq=${music.abseq}">${music.abtitle}</a>
                                </div>
                            </div>
                        </td>
                        <td><a href="artistView?atseq=${music.atseq}">${music.name}</a></td>
                        <!-- 듣기 -->
                        <td style="text-align: center; padding: 0; margin: 0">
                            <a class="iconButton listen">&nbsp;
                                <span style="font-size: 20px; color: #333333;"><i class="fas fa-play"></i></span>
                            </a>
                        </td>
                        <!-- 재생목록 -->
                        <td style="text-align: center; padding: 0; margin: 0">
                            <a class="iconButton playListAdd">&nbsp;
                                <span style="font-size: 20px; color: #333333;"><i class="fas fa-outdent"></i></span>
                            </a>
                        </td>
                        <!-- 내 리스트 -->
                        <td style="text-align: center; padding: 0; margin: 0">
                            <a class="iconButton myListAdd">&nbsp;
                                <span style="font-size: 20px; color: #333333;"><i class="fas fa-folder-plus"></i></span>
                            </a>
                        </td>
                        <!-- 더보기 -->
                        <td style="text-align: center; padding: 0; margin: 0">
                            <a class="iconButton moreDiv">&nbsp;
                                <span style="font-size: 20px; color: #333333;"><i class="fas fa-ellipsis-v"></i></span>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="8" style="text-align: center;">곡이 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>
