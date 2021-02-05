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

    /*musicMoreBox 더보기 버튼*/
    #musicMoreBox {
        position:fixed;
        z-index: 9999;
        width: 200px;
        height: 200px;
        border: 1px solid lightgray;
        box-sizing: border-box;
        box-shadow: 0px 0px 10px 5px lightgray;
        background: white;
        list-style: non;
        margin: 0;
        padding: 0;
        padding-top:10px;
        padding-bottom:10px;
    }

    #musicMoreBox li {
        position: relative;
        width:200px;
        height:36px;
        margin: 0;
        padding: 0;
        padding-left: 17px;
        display: block;
        overflow: hidden;
    }

    #musicMoreBox .imgBox {
        position: absolute;
        top:8px;
        left: 8px;
        width: 23px;
        height: 23px;
    }

    #musicMoreBox .textBox {
        position: absolute;
        top:8px;
        left:31px;
        height: 23px;
        line-height: 23px;
    }

    #musicMoreBox .textBox a{
        display: block;
        position: relative;
        padding-left: 17px;
        font-size: 14px;
        text-align: left;
        color: #353535;
    }

    /*musicMoreBox 더보기 버튼*/


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
                <tr>
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
                    <td ><a href="#" onclick="$music.showMusicMoreBox(this);">더보기</a></td>
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
