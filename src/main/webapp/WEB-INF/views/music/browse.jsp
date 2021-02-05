<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<style>
    article ul,article li {
        list-style-type: none;
        display: block;
        padding: 0;
    }
    article li {
        display: inline-block;
    }
    article a {
        text-decoration: none;
    }

    #listBox {
        position: relative;
    }

    #themeAndGenre li {
        border-radius: 10px;
        font-weight: bold;
        height: 32px;
        padding: 0 15px;
        font-size: 14px;
        line-height: 32px;
        text-align: center;
        border-radius: 16px;
        border: 1px solid rgba(0,0,0,.2);
        margin-bottom: 4px; 
    }
    #themeAndGenre li:not(.selected):hover {
        border: 1px solid #311851;
    }

    #themeAndGenre li:not(.selected):hover a{
        color: #311851;
    }

    #themeAndGenre a {
        color: #5D5D5D;
    }
    #themeAndGenre li.selected{
        background: #311851;
        border: 1px solid #311851;
    }
    #themeAndGenre .selected a{
        color: white;
    }

    #musicList a{
        color : lightslategray;
    }

    .waste {
        width: 100%;
        height: 42px;
        position: relative;
        margin-bottom: 16px;
    }

    .waste .selectedTitle {
        margin: 0;
        height: 42px;
        font-size: 22px;
        color: #333;
        font-weight: 700;
        float: left;
        line-height: 42px;
    }

    .waste img {
        vertical-align: middle;
        padding-bottom: 5px;
    }

    .waste .allListen {
        float: right;
        font-size: 13px;
        color: #333;
        height: 42px;
        line-height: 42px;
    }

    #listBox a {
        font-size:15px;color:#333333;font-weight: 100;
    }

    #listBox .justWrap{
        position: relative;
        padding-top: 12px;
        padding-bottom: 12px;
        padding-left: 20px;
        width: 360px;
        height: 60px;
        overflow: hidden;
    }

    #listBox .justWrap .contentWrap{
        position: relative;
        height: 100%;
    }

    #listBox .justWrap .contentWrap > a{
        position: absolute;
        height: 22px;
        left: 76px;
        line-height: 22px;
        display: inline-block;
    }
    #listBox .justWrap .contentWrap > a:nth-of-type(1){top:8px;}
    #listBox .justWrap .contentWrap > a:nth-of-type(2){top:32px;font-size:13px;color:#969696;}

    i{
        color: #333333;
    }
    i:hover{
        color:#311851;
    }

    /* 혜민씨 css at likemusic.jsp */
    th{height:80; width:895px;}
	th{padding-left:20px; text-align: left; white-space: nowrap; height: 39px; font-size: 13px; color: #a0a0a0;
		font-weight: 400; border-top: 1px solid #ebebeb;  border-bottom: 1px solid #ebebeb;}
	td{padding-left:20px; text-align: left; white-space: nowrap; height: 39px; font-size: 15px; color: #5D5D5D;
		font-weight: 450; }
</style>

<article>
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
        <a href="#" class="allListen" onclick="$music.allListen();"><img src="" alt="" width="23" height="23">전체듣기</a>
    </div>
    
    <div style="clear:both;"></div>
    
    
    <table id="listBox">
        <tr>
            <th align="center"><input type="checkbox"></th>
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
                    <tr height="84">
                        <td><input type="checkbox"></td>
                        <td>${status.count}</td>
                        <td>
                            <div class="justWrap">
                                <div class="contentWrap">
                                    <img src="" alt="" width="60" height="60">
                                    <a href="재생목록에 추가">${music.title}</a>
                                    <a href="albumView?abseq=${music.abseq}">${music.abtitle}</a>
                                </div>
                            </div>
                        </td>
                        <td><a href="artistView?atseq=${music.atseq}">${music.name}</a></td>
                        <td><a href="#" class="iconButton"><i class="fas fa-play"></i></a></td>
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
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>
