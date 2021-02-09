<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<<<<<<< HEAD
    <style>
        footer {
            position: relative;
            width: 1050px;
            background: none;
            margin: 0 auto;
            border: 1px solid red;
            margin-top: 80px;
        }

        footer ul {
            margin: 0;
            padding: 0;
            margin-bottom: 10px;
            font-weight: bold;
        }
        footer li {
            list-style: none;
            display: inline-block;
        }

        .hr {
            width: 100%;
            background: blue;
            height: 1px;
            margin-top:20px;
            margin-bottom: 20px;
        }

        footer .ul1 {
            position: absolute;
            top: 0px;
            left: 0px;
            color: #333;
        }

        footer .snsList {
            position: absolute;
            top:0px;
            right: 0px;
        }

        footer .ul2 , footer .ul3 , footer .ul4 {
            color: #909090;
            font-size: 70%;
        }

        footer .seperator {
            font-weight: 100;
            margin-left: 5px;
            margin-right: 5px;
        }

        footer .ul4 .right{
            position: absolute;
            bottom: 5px;
            right: 5px;
        }

        footer .ul4 .bold {
            color: #333;
        }
    </style>

    </div>

    <%-- 팝업류 include --%>
    <%@ include file="../popup/popup.jsp" %>
=======
    </div>

    <%-- 팝업류 include --%>
    <%@ include file="../popup/music.jsp" %>
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a

<footer>
    <ul class="ul1">
        <li>ECO 소개</li>
        <li>공지사항</li>
        <li>고객센터</li>
        <!-- <li>ECO 플레이어 다운로드</li> -->
    </ul>

    <ul class="snsList">
<<<<<<< HEAD
        <li><img src="images/facebook.png" alt="facebook"></li>
        <li><img src="images/instagram.png" alt="instagram"></li>
        <li><img src="images/youtube.png" alt="youtube"></li>
        <li><img src="images/twitter.png" alt="twitter"></li>
=======
        <li><i class="fab fa-facebook"></i></li>
        <li><i class="fab fa-instagram-square"></i></li>
        <li><i class="fab fa-youtube"></i></li>
        <li><i class="fab fa-twitter-square"></i></li>
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
    </ul>

    <!-- 구분선 -->
    <div class="hr"></div>

    <ul class="ul2">
        <li>제작자 정보</li>
        <li class="seperator">|</li>
        <li>이용약관</li>
        <li class="seperator">|</li>
        <li>개인정보 처리방침</li>
        <li class="seperator">|</li>
        <li>청소년 보호정책</li>
        <li class="seperator">|</li>
        <li>사업자정보 확인</li>
    </ul>

    <ul class="ul3">
        <li>대표이사 : 누군가</li>
        <li class="seperator">|</li>
        <li>이메일 : eco@music-eco.com</li>
        <li class="seperator">|</li>
        <li>사업자 등록번호 : 999-99-99999</li>
        <li class="seperator">|</li>
        <li>통신판매업 신고번호 : 9999-서울신촌-9999</li>
    </ul>

    <ul class="ul4">
        <li class="bold">(주)이젠아카데미</li>
        <li class="bold">ALL RIGHTS RESERVED</li>
        <li class="right">본 사이트는 Chrome 브라우저에서 사용 가능합니다.</li>
    </ul>
</footer>
</body>
</html>