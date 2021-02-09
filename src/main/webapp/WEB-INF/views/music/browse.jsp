<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<<<<<<< HEAD
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

    #listBox {
        position: relative;
    }

    #themeAndGenre li {
        background: purple;
        border-radius: 10px;
        color: white;
        font-weight: bold;
    }

    #themeAndGenre a {
        color: white;
        font-weight: bold;
    }

    #musicList a{
        color : lightslategray;
    }

    /* 혜민씨 css at likemusic.jsp */
    th{height:80; width:895px;}
	th{padding-left:20px; text-align: left; white-space: nowrap; height: 39px; font-size: 13px; color: #a0a0a0;
		font-weight: 400; border-top: 1px solid #ebebeb;  border-bottom: 1px solid #ebebeb;}
	td{padding-left:20px; text-align: left; white-space: nowrap; height: 39px; font-size: 15px; color: #5D5D5D;
		font-weight: 450; }
</style>

<%-- <h3>
    parameter info
</h3>
<ul>
    <li>${selectedType}</li>
    <li>${selectedSeq}</li>
    <li>${chartList}</li>
    <li>${genreList}</li>
    <li>${musicList}</li>
</ul> --%>

<ul id="themeAndGenre">
    <!-- 차트 -->
    <c:forEach var="chart" items="${chartList}" varStatus="status">
        <li>
            <a href="/browse?selectedType=chart&selectedSeq=${chart.cseq}">${chart.title}</a>
        </li> 
    </c:forEach>

    <!-- 장르 -->
    <c:forEach var="genre" items="${genreList}" varStatus="status">
        <li>
            <a href="/browse?selectedType=genre&selectedSeq=${genre.gseq}">${genre.title}</a>
        </li> 
    </c:forEach>
</ul>

<h1>
<!-- 선택된 타입이 차트면 제목은 차트의 타이틀, 장르면 제목은 장르의 타이틀 (디폴트값이 chart, "1"이기 때문에 otherwise는 구문은 없음)-->
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
</h1>

<table id="listBox">
	<tr>
		<th><input type="checkbox"></th>
        <th>순위</th>
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
                <tr height="84">
                    <td><input type="checkbox"></td>
                    <td>${status.count}</td>
                    <td>
                        <a href="재생목록에 추가">${music.title}</a> / 
                        <a href="albumView?abseq=${music.abseq}">${music.abtitle}</a>
                    </td>
                    <td>${music.name}</td>
                    <td>듣기</td>
                    <td>재생목록</td>
                    <td>내 리스트</td>
                    <td ><a href="#" onclick="$music.on_musicMoreBox(this, ${music.mseq});">더보기</a></td>
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

<%@ include file="../include/headerfooter/footer.jsp" %>
=======

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
    
    <%@ include file="../include/musicList.jsp" %>
    
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
