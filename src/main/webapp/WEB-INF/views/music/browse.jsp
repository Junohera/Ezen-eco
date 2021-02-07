<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<style>
    #myListBox {
        position: fixed;
        z-index: 9999;
        width: 530px;
        height: 600px;
        margin: 0;
        bottom: 195px;
        top: 100px;
        left: calc(100vw - 50vw - 235px);
        overflow: hidden;
    }

    #myListBox > div:nth-of-type(2) {
        position: relative;
        margin: 0 auto;
        width: 470px;
        background: white;
        min-height: 300px;
        border-radius: 10px;
        padding: 30px;
    }

    #myListBox h2 {
        font-size: 18px;
        color: #333333;
        width: 470px;
        height: 22px;
        line-height: 22px;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(1){
        width: 470px;
        height: 100px;
        position: relative;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(1) * {
        display: block;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(1) .textBox {
        width: 470px;
        height: 40px;
        margin: 0 auto;
        border: none;
        border-bottom: 1px solid #333333;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(1) .inputText {
        width: 450px;
        height: 100%;
        float: left;
        margin-left: 10px;
        margin-right: 2px;
        font-size: 90%;
        font-weight: 100;
        border: none;
        background: none;
        outline: none;
        color: #333333;
    }

    #myListBox .close {
        position: absolute;
        right: 4px;
        top: 10px;
        font-size: 20px;
        font-weight: 100;
        cursor: pointer;
    }

    #myListBox .btn {
        margin-top: 10px;
        width: 50px;
        color: #333333;
        float: right;
        font-size: 100%;
        background: none;
        border: none;
        cursor: pointer;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) {
        overflow-y: scroll;
        height: 380px;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList:first {
        border-top: 1px solid #dddddd;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList {
        height: 66px;
        overflow: hidden;
        border-bottom: 1px solid #dddddd;
        padding: 5px;
        cursor: pointer;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList *{
        display: block;
        position: relative;
        margin: 0;
        padding: 0;
        list-style-type: none;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList > ul {
        width: 445px;
        height: 78px;
        padding-top: 3px;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList > ul > li:nth-of-type(1) {
        width: 60px;
        height: 60px;
        float: left;
        background: #dddddd;
        border-radius: 6px;
        margin-right: 20px;
        color: white;
        font-size: 30px;
        text-align: center;
        vertical-align: middle;
        overflow: hidden;
        border: none;
    }
    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList > ul > li:nth-of-type(1) * {
        width: 100%;
        height: 100%;
        display:block;
        margin: 0;
        padding: 0;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList > ul > li:nth-of-type(1) span {
        position: absolute;
        top: 15px;
        left: -1px;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList > ul > li:nth-of-type(2) {
        float: left;
        width: 360px;
        height: 60px;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList > ul > li:nth-of-type(2) ul {
        width: 100%;
        height: 100%;
        margin-top: 6px;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList > ul > li:nth-of-type(2) ul li:nth-of-type(1){
        font-size: 15px;
        font-weight: 100;
        color: #333333;
        margin-bottom: 8px;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(2) .bundleList > ul > li:nth-of-type(2) ul li:nth-of-type(2){
        font-size: 12px;
        font-weight: 100;
        color: #333333;
    }

    #myListBox > div:nth-of-type(2) > div:nth-of-type(1) input::placeholder {
        color: lightgray;
    }

    #dim {
        background-color: rgba(0, 0, 0, 0.5);
        position: fixed;
        z-index: 200;
        width: 100%;
        height: 100%;
        transition: 0.2;
        top: 0px;
        left: 0px;
    }
</style>

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
                        <td><input type="checkbox" name="mseq_checkbox" value="${music.mseq}"></td>
                        <td>${status.count}</td>
                        <td>
                            <div class="justWrap">
                                <div class="contentWrap">
                                    <img src="" alt="" width="60" height="60">
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
                            <a href="#" class="iconButton">&nbsp;
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
