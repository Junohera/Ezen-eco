<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<style>
	#themeAndGenre li{width:100px; list-style-type: none; margin:10px; float:left;}
	ul, li, dl{list-style: none;}
	
	#albumView{
		width:100%;
		height:500px;
		margin-top: -20px;
	    padding-top: 57px;
	}
	#album-list{
		width:417px;
		height:189px;
		margin-top:27px;
		margin-left:22px;
		padding-right:12px;
		position:relative;
		float:left;
	}
	#album-img{
		width:175px;
		height:175px;
		padding-top:14px;
		position:relative;
		float:left;
	}
	
	.photo1 {
	    width: 175px; height: 175px;
	    object-fit: cover;
	    object-position: top;
	    border-radius: 6px;
	}
	
	#album-info{
		width:217px;
		height:175px;
		padding-top:14px;
		padding-left:20px;
		position:relative;
		float:left;
		vertical-align: middle;
	}
	
	#album-info .title{
	    padding-top: 15px;
	    font-size: 15px;
	    font-weight: 700;
	}
	#album-info .artist{
	    padding-top: 8px;
    	font-size: 14px;
    	display: block;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	#album-info dl{
		padding-top: 15px;
		overflow: hidden;
	}
	.hidden{display:none;}
	
</style>

<div id="themeAndGenre">
	<ul>
		<li><a href='storage'>mymusic</a></li>
		<li><a href='likeartist'>myartist</a></li>
		<li class="selected"><a href='likealbum'>myalbum</a></li>
		<li><a href='mybundle'>mybundle</a></li>
	</ul>
</div>

<br><br><br>

<article id="albumView">
	<c:choose>
		<c:when test="${albumList.size() > 0}">
			<c:forEach var="ab" items="${albumList}" varStatus="status">
            <input type="hidden" name="abseq" value="${ab.abseq}">
            <input type="hidden" name="atseq" value="${ab.atseq}">
            <input type="hidden" name="title" value="${ab.title}">
            <input type="hidden" name="abimg" value="${ab.img}">
            <input type="hidden" name="name" value="${ab.name}">
			<div id="album-list">
				<div id="album-img">
					<a href="albumView?abseq=${ab.abseq}">
						<img class="photo1" src="${ab.img}">
					</a>
				</div>
				<div id="album-info">
					<div id="album-title">
						<p class="title"><a href="albumView?abseq=${ab.abseq}">${ab.title}</a></p>
						<p class="artist"><a href="artistView?atseq=${ab.atseq}">${ab.name}</a></p>
					</div>
					<dl>
						<dt class="hidden">앨범 정보</dt>
						<dd class="date">
							${ab.pdate}
						</dd>
					</dl>
					<div id="album-util"></div>
				</div>
			</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			 <tr>
                <td colspan="6" style="text-align: center;">좋아하는 앨범을 추가해주세요</td>
            </tr>
		</c:otherwise>
	</c:choose>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>