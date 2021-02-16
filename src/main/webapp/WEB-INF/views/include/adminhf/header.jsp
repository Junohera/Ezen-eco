<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery-3.5.1-min.js"></script>

    <script>
        $(function() {
            $(".headerBox .menu")
               .on("mouseover", function() {
                  var index = $(this).index();
                  $(".dropMenubar").show();
                  $(".dropMenubar .submenu").eq(index).show().siblings().hide();
               })
               .on("mouseleave", function() {
                  $(".dropMenubar").hide();
               });

            $(".dropMenubar")
               .on("mouseover", function() {
                  $(this).show();
               })
               .on("mouseleave", function() {
                  $(this).hide();
               });
        });
    </script>
</head>

<body>
    <div class="headerBox">
        <div id="title">
            <a href="AIndex" style="font-size:300%;">
                <div class="logo"></div>
                <div id="titlefont">Administration</div>
            </a>
            <ul style="width: 1050px;height: 91px;margin: 0 auto;padding: 0;margin-top: 100px;display: flex;justify-content: space-around;">
                <li class="menu"><a href="MemberManage?first=yes" style="text-decoration:none;color: white;">회원관리</a></li>
                <li class="menu"><a href="musicManageList?first=yes" style="text-decoration:none;color: white;">음악관리</a></li>
                <li class="menu"><a href="notice?first=yes" style="text-decoration:none;color: white;">게시판관리</a></li>
            </ul>

            <div class="dropMenubar" style="position: fixed;top: 198px;left: 0;width: 100%;height: 100px;display:none;">
                <ul class="submenu" style="list-style: none;margin: 0;padding: 0;display: flex;justify-content: space-around;height: 100px;line-height: 100px;font-size: 150%;">

                </ul>
                <ul class="submenu" style="list-style: none;margin: 0;padding: 0;display: flex;justify-content: space-around;height: 100px;line-height: 100px;font-size: 150%;">
                    <li><a href="musicManageList?first=yes">음악정보</a></li>
                    <li><a href="albumManageList?first=yes">앨범정보</a></li>
                    <li><a href="artistManageList?first=yes">아티스트</a></li>
                    <li><a href="bundleManageList?first=yes">리스트</a></li>
                    <li><a href="ThemeManage?first=yes">테마</a></li>
                    <li><a href="ChartManage?first=yes">차트</a></li>
                    <li><a href="GenreManage?first=yes">장르</a></li>
                </ul>
                <ul class="submenu" style="list-style: none;margin: 0;padding: 0;display: flex;justify-content: space-around;height: 100px;line-height: 100px;font-size: 150%;">
                    <li><a href="notice?first=yes">공지사항</a></li>
                    <li><a href="event?first=yes">이벤트</a></li>
                    <li><a href="qnaManage?first=yes">Q&amp;A(1:1)</a></li>
                </ul>
            </div>
        </div>
        <div id="clientLink">
            <a href="/" style="color:white;font-size: 8px;text-decoration: none;position: absolute;right: 0;top: 0;">사용자화면</a>
        </div>
    </div>