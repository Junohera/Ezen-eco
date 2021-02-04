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
    background-size: cover;
    background-repeat: no-repeat;}
    #buttons{height: 32px; padding: 0 15px; font-size: 14px; line-height: 32px; text-align: center;
		border-radius: 16px; border: 1px solid rgba(0,0,0,.2); vertical-align: top; font-size: 16px; border: 0;}
</style>
</head>
<body>
<div id="buttons">
	<input type="button" value="mybundle">
	<input type="button" value="mymusick">
	<input type="button" value="myartist">
	<input type="button" value="myalbum">
</div>
<br><br><br>
<div id="artist">
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
</div>
</body>
</html>