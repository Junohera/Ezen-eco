<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Admin.css">

</head>
<body>
<div class="headerBox">
  <div id="title">
   <a href="AdminIndex.html" style="font-size:300%;"><div class="logo"></div>
       <div id="titlefont">Administration</div></a>
   <div class="menubar">
         <ul>
            <li class="menu" ><a href="MemberManage"  style="text-decoration:none;color: white;">회원관리</a></li>
           <div class="drop">
            <li class="menu">음악관리</li>
               <ul class="submenu1">
                <li><a href="MusicManage" style="text-decoration:none;color:purple;">음악정보</a></li>
                <li><a href="AlbumManage" style="text-decoration:none;color:purple;">앨범정보</a></li>
                <li><a href="AlbumManage" style="text-decoration:none;color:purple;">아티스트</a></li>
               </ul>
            </div>
            <div class="drop">
            <li class="menu">게시판관리</li>
               <ul class="submenu2">
                <li><a href="notice" style="text-decoration:none;color:purple;">공지사항</a></li>
                <li><a href="event" style="text-decoration:none;color:purple;">이벤트</a></li>
                <li><a href="qnaManage" style="text-decoration:none;color:purple;">Q&amp;A(1:1)</a></li>
               </ul>
            </div>  
        </ul> 
      </div>      
  </div>   
    <div class="header">
        
    
  </div>    
</div>    