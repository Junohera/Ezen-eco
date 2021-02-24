<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<style type="text/css">
	.searchCategory {width: 496px;
							    margin: 0 auto;
							    height: 55px;}

	.selectedSearch {float: left;
								background: none;
							    border: 2px solid black;
							    margin: 5px;
							    width: 100px;
							    text-align: center;
							    height: 30px;
							    line-height: 30px;
							    border-radius: 15px 15px;
								cursor: pointer;}
	.selectedSearch:hover {background: black; color: white; }
	
	
</style>
<article>
	<h1>'${keyward }' 검색 결과</h1>
	<hr>
	<div class="searchCategory">
		<form action="allSearch" method="get">
			<input type="hidden" name="selected" value="title">
			<input type="hidden" name="table" value="music_view">
			<input type="hidden" name="keyward" value="${keyward}">
			<input type="submit" class="selectedSearch" value="곡">
		</form>
		<form action="alSearch" method="get">
			<input type="hidden" name="selected" value="title">
			<input type="hidden" name="table" value="album_view">
			<input type="hidden" name="keyward" value="${keyward}">
			<input type="submit" class="selectedSearch" value="앨범">
		</form>
		<form action="atSearch" method="get">
			<input type="hidden" name="selected" value="name">
			<input type="hidden" name="table" value="artist_view">
			<input type="hidden" name="keyward" value="${keyward}">
			<input type="submit" class="selectedSearch" value="아티스트">
		</form>
		<form action="lyricsSearch" method="get">
			<input type="hidden" name="selected" value="content">
			<input type="hidden" name="table" value="music_view">
			<input type="hidden" name="keyward" value="${keyward}">
			<input type="submit" class="selectedSearch" value="가사">
		</form>

	</div>
	<hr>
	<div>
		${boardList }
	</div>

	
</article>
<%@ include file="../include/headerfooter/footer.jsp" %>