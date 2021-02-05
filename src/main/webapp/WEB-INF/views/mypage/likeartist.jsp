<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	dd{position: relative; display: inline; padding: 0 4px 0 5px; font-size: 13px;}
	ul, li, dl{list-style: none;}
	#at-img{border-radius: 175px; overflow: hidden; border-radius: 175px;
	 background-repeat: no-repeat; background-position: 50% 50%; background-size: cover;
	 z-index: 3; position: relative; display: block; height: 100%; width: 100%;  border-radius: 6px;
    background-size: cover;   background-repeat: no-repeat;}
	#buttons li{list-style-type: none;  display: block; background: black; border-radius: 10px; color:white;
        display: inline-block; float:left; margin-left:10px; text-align:center;}
</style>
</head>
<body>
<div id="buttons">
	<ul>
		<li><a href='storage'>mymusic</a></li>
		<li><a href='likeartist'>myartist</a></li>
		<li><a href='likealbum'>myalbum</a></li>
	</ul>
</div>
<br><br><br>
<div id="artist">
		<c:forEach var="lml" items="${likemusiclist}" varStatus="status">
			<ul>
				<li>
					<div id="at-img">
						
					</div>
					<div id="at-info">
						<dl>
							<dd>atname</dd>
							<dd>group</dd>
							<dd>gender</dd>
							<dd>genre</dd>
						</dl>
					</div>
				</li>
				<li>
			</ul>
		</c:forEach>
</div>
</body>
</html>