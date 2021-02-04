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
    <c:choose>
        <!-- 선택된 타입이 차트면 제목은 선택한 차트의 타이틀 -->
        <c:when test="${selectedType eq 'chart'}">
            <c:forEach var="chart" items="${chartList}" varStatus="status">
                <c:if test="${chart.cseq == selectedSeq}">${chart.title}</c:if>
            </c:forEach>        
        </c:when>
        <!-- 선택된 타입이 장르면 제목은 선택한 장르의 타이틀 -->
        <c:when test="${selectedType eq 'genre'}">
            <c:forEach var="genre" items="${genreList}" varStatus="status">
                <c:if test="${genre.gseq == selectedSeq}">${genre.title}</c:if>
            </c:forEach>        
        </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>
</h1>

<div id="musicList">
    <div class="head">
        <ul>
            <li>순위</li>
            <li>곡/앨범</li>
            <li>아티스트</li>
            <li>듣기</li>
            <li>재생목록</li>
            <li>내 리스트</li>
            <li>더보기</li>
        </ul>
    </div>
    <div class="body">
        <ul>
            <c:forEach var="music" items="${musicList}" varStatus="status">
                <li>
                    <ul>
                        <li>${status.count}</li>
                        <li>
                            <a href="재생목록에 추가">${music.title}</a> / 
                            <a href="albumView?abseq=${music.abseq}">${music.abtitle}</a>
                        </li>
                        <li>${music.name}</li>
                        <li><a href="">듣기</a></li>
                        <li><a href="">재생목록</li>
                        <li><a href="">내 리스트</a></li>
                        <li><a href="">더보기</a></li>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
