<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- TODO: 추후 header.jsp의 공통css로 옮겨야함 -->
<style>
    ul, li , p{
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style-type: none;
        display: block;
    }
#mainSlide {
    position: relative;
    width: 1050px;
    height: 400px;
    margin: 0 auto;
}
.bundleBox {
    position: absolute;
    width: 990px;
    height: 460px;
    top: 0px;
    left: 0px;
    display: none;
    background: #4c4863;
    padding: 30px 30px;
    color: white;
}
/* 첫번째만 show 나머지는 script로 제어 */
.bundleBox:nth-of-type(1) {
    display: block;
}
.bundleInfo {
    width: 30%;
    float: left;
}
.musicList {
    width: 70%;
    float: left;
}
.small {
    font-size: 90%;
}
.musicBox {
    width: 40%;
    height: 50px;
    background: lightblue;
    float: left;
    padding: 10px 10px;
    margin-right: 50px;
}
.imageBox {
    background-color: black;
    width: 50px;
    height: 50px;
    float: left;
}
.descBox {
    float: left;
    width: 224px;
    background: blueviolet;
    height: 28px;
    padding-left: 20px;
    line-height: 28px;
}

#mainSlideHandler {
    width: 1050px;
    background: white;
    margin: 0 auto;
    color: white;
    display:flex;
    justify-content: center;
}

#mainSlideHandler li {
    display:inline-block;
    background:red;
}
</style>
<!-- TODO: 추후 header.jsp의 공통css로 옮겨야함 -->
</head>
<body>
    <ul id="mainSlide">
        <c:forEach var="b" items="${bundleList}" varStatus="status">
            <li class="bundleBox">
                <div class="bundleInfo">
                    <h2>${b.title}</h2>
                    <p class="small">
                        <span>총 ${b.musicList.size()} 곡</span> |
                        <span><fmt:formatDate value="${b.cdate}"></fmt:formatDate></span>
                    </p>
                    <div>&gt; TODO:이미지로 변경</div>
                </div>
                <div class="musicList">
                    <ul>
                        <c:forEach var="m" items="${b.musicList}" varStatus="status">
                            <div class="musicBox">
                                <li>
                                    <div class="imageBox">
                                        <img src="" alt="">    
                                    </div>
                                    <div class="descBox">
                                        <p>${m.title}</p>
                                        <p>${m.title} -> TODO:album제목으로</p>
                                    </div>
                                </li>
                            </div>
                        </c:forEach>
                    </ul>
                </div>
            </li> 
        </c:forEach>
    </ul>

    <ul id="mainSlideHandler">
        <c:forEach var="b" items="${bundleList}" varStatus="status">
            <li>
                o
            </li>
        </c:forEach>
    </ul>
    
</body>
</html>