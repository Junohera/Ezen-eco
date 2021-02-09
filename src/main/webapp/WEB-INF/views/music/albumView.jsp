<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<style>
<<<<<<< HEAD
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
=======
    #music_albumView {
        margin-top:100px;
    }

    #music_albumView .contentBox * {
        position: relative;
        display:block;
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
        transition: 0.3s;
    }

    #music_albumView .contentBox{
        width: 100%;
        height: 254px;
        margin: 0 auto;
        padding: 0;
        position: relative;
        padding-left:50px;
    }

    #music_albumView .album{
        position: relative;
    }

    #music_albumView .thumbnail{
        width: 240px;
        height: 240px;
        background: silver;
        position: relative;
        border-radius: 10px;
        overflow: hidden;
        cursor: pointer;
        display: inline-block;
        float: left;
    }

    #music_albumView .thumbnail > span {
        position: absolute;
        font-weight: 100;
        font-size: 30px;
        color: white;
        right: 12px;
        bottom: 12px;
        width: 30px;
        height: 30px;
        z-index: 2;
    }

    #music_albumView .thumbnail > span:hover {
        color: #3f3fff;
    }

    #music_albumView #thumbnail_dim {
        position: absolute;
        top: 0px;
        left: 0px;
        z-index: 1;
        background: none;
    }

    #music_albumView #thumbnail_dim:hover {
        background:rgba(0, 0, 0, 0.3);
    }

    #music_albumView .info {
        width: 672px;
        height: 226px;
        background: yellow;
        display: inline-block;
        padding-left: 34px;
        padding-top: 14px;
        float: left;
    }

    #music_albumView .info ul {
        height: 226px;
        margin: 0;
        padding: 0;
    }
    

    #music_albumView .info ul li {
        width: 100%;
        height: 20px;
    }
</style>

<article id="music_albumView">
    <div class="contentBox">
        <div class="album">
            <div class="thumbnail">
                <img src="${album.img}" alt="">
                <div id="thumbnail_dim"></div>
                <span>
                    <i class="fas fa-play"></i>
                </span>
            </div>
            <div class="info">
                <ul>
                    <li>${album.title}</li>
                    <li>${album.name}</li>
                    <li>
                        <c:choose>
                            <c:when test="${album.groupyn eq 'y'}">그룹</c:when>
                            <c:otherwise>싱글</c:otherwise>
                        </c:choose>
                        |
                        ${album.atgenre}
                    </li>
                    <li></li>
                </ul>
                <ul>
                    <li></li>
                </ul>
            </div>
        </div>
    </div>

    <ul id="infoAndList">
        <li>
            <a onclick="$('#infoBox').toggle();">상세정보</a>
        </li> 
        <li>
            <a onclick="$('#trackBox').toggle();">수록곡</a>
        </li>
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
    
    </div>

    <div id="infoBox" style="display:none;">
        
    </div>

    <div id="trackBox">
        <!-- 전체듣기 -->
        <a class="allListen iconButton" id="playListAddAll" style="cursor: pointer;font-size: 13px;margin-bottom:20px;">
            <span style="font-weight: 100; font-size: 10px; color: #333333;">
                <i class="fas fa-play"></i>
            </span>
            전체듣기
        </a>

        <%@ include file="../include/musicList.jsp" %>
    </div>
    
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
