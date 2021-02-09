<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<style>
	#themeAndGenre li{width:100px; list-style-type: none; margin:10px; float:left;}
	#albumList{width:100%; height:500px;}
	#albumImag{position:relative; width:173px; height:173px; border:1px solid red;
		border-radius: 6px;float:left;}
	#albuminfo{position:relative; float:left; margin-left:10px; margin-top:10px;
		width:217px; height:173px;}
	#albuminfo li{list-style:none;}
	#iconlist li{float: left; padding : 10px; margin-top:20px;}
</style>

<div id="themeAndGenre">
	<ul>
		<li><a href='storage'>mymusic</a></li>
		<li><a href='likeartist'>myartist</a></li>
		<li class="selected"><a href='likealbum'>myalbum</a></li>
		<li><a href='mybundle'>mybundle</a></li>
	</ul>
</div>
<div id="albumList">
	<c:choose>
		<c:when test="${albumList.size() > 0}">
			<c:forEach var="ab" items="${albumList}" varStatus="status">
            <input type="hidden" name="abseq" value="${ab.abseq}">
            <input type="hidden" name="atseq" value="${ab.atseq}">
            <input type="hidden" name="title" value="${ab.title}">
            <input type="hidden" name="abimg" value="${ab.img}">
            <input type="hidden" name="name" value="${ab.name}">
				<ul id="album1">
					<div id="albumImag"><a href="albumView?abseq=${ab.abseq}">${ab.img}</a></div>
					<div id="albuminfo">
						<li style="font-size: 15px; font-weight: 700;">
							<a href="albumView?abseq=${ab.abseq}">
							${ab.title}
						</li>
						<li style="font-size: 14px;">
							<a href="artistView?atseq=${ab.atseq}">
							${ab.name}
						</li>
						<li>${ab.pdate}</li>
                        <div id="iconlist">
                        	<li><a href="#" class="iconButton">&nbsp;
                                <span style="font-size: 20px; color: #333333;"><i class="fas fa-folder-plus"></i></span>
                            </a></li>
                            <li><a class="iconButton playListAdd">&nbsp;
                                <span style="font-size: 20px; color: #333333;"><i class="fas fa-outdent"></i></span>
                            </a></li>
                        </div>
					</div>
				</ul>
			</c:forEach>
		</c:when>
		<c:otherwise>
			 <tr>
                <td colspan="6" style="text-align: center;">좋아하는 앨범을 추가해주세요</td>
            </tr>
		</c:otherwise>
	</c:choose>
	
</div>

<%@ include file="../include/headerfooter/footer.jsp" %>