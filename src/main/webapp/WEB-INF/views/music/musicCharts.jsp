<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    #themeNavigation li {
        background: purple;
        border-radius: 10px;
        color: white;
        font-weight: bold;
    }

    #themeNavigation a {
        color: white;
        font-weight: bold;
    }

    #musicList a{
        color : lightslategray;
    }
</style>
</head>
<body>

    <ul id="themeNavigation">
        <c:forEach var="theme" items="${themeList}" varStatus="status">
            <li>
                <a href="/musicCharts?tseq=${theme.tseq}">${theme.theme}</a>
            </li> 
        </c:forEach>
    </ul>

    <h1>
        <c:forEach var="theme" items="${themeList}" varStatus="status">
            <c:if test="${theme.tseq == tseq}">${theme.theme}</c:if>
        </c:forEach>
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
                <c:forEach var="chart" items="${chartList}" varStatus="status">
                    <li>
                        <ul>
                            <li>${status.count}</li>
                            <li>
                                <a href="재생목록에 추가">${chart.title}</a> / 
                                <a href="albumView?abseq=${chart.abseq}">${chart.abtitle}</a>
                            </li>
                            <li>${chart.name}</li>
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

</body>
</html>