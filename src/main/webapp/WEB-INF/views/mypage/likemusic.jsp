<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#buttons li{list-style-type: none;  display: block; background: black; border-radius: 10px; color:white;
        display: inline-block; float:left; margin-left:10px;}
	th{height:80; width:895px;}
	th{padding-left:20px; text-align: left; white-space: nowrap; height: 39px; font-size: 13px; color: #a0a0a0;
		font-weight: 400; border-top: 1px solid #ebebeb;  border-bottom: 1px solid #ebebeb;}
	td{padding-left:20px; text-align: left; white-space: nowrap; height: 39px; font-size: 15px; color: #5D5D5D;
		font-weight: 450; }
	#buttons{height: 32px; padding: 0 15px; font-size: 14px; line-height: 32px; text-align: center;
		border-radius: 16px; vertical-align: top; font-size: 16px; border: 0;}
</style>
</head>
<body>

<div id="buttons">
	<ul>
		<li><a href='likemusic'>mymusic</a></li>
		<li><a href='likeartist'>myartist</a></li>
		<li><a href='likealbum'>myalbum</a></li>
	</ul>
</div>
<br>
<br>
<table>
	<tr>
		<th><input type="checkbox"></th><th >title</th><th>artist</th><th>play</th><th>like</th><th>more</th>
	</tr>
		 <c:forEach var="lml" items="${likemusiclist}" varStatus="status">
			<tr>
				<td><input type="checkbox"></td>
				<td>{lml.title}</td>
				<td>{lml.id}</td>
				<td>icon</td>
				<td>icon</td>
				<td>icon</td>
			</tr>
		</c:forEach>
</table>

</body>
</html>