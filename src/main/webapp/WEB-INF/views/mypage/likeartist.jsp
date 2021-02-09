<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<style type="text/css">
	#themeAndGenre li{width:100px; list-style-type: none; margin:10px; float:left;}
	dd{ font-size: 13px; margin-top:10px; margin-bottm:10px;}
	ul, li, dl{list-style: none;}
	#artist{width:100%; height:500px;}
	#at-img{width:175px; height:175px; border-radius:50%; border:1px solid red; position:relative; float:left}
	#at-info{width:217px; height:175px;  border:1px solid red; position:relative; float:left;}
	#buttons li{list-style-type: none;  display: block; background: black; border-radius: 10px; color:white;
        display: inline-block; float:left; margin-left:10px; text-align:center;}
</style>

<div id="themeAndGenre">
	<ul>
		<li><a href='storage'>mymusic</a></li>
		<li class="selected"><a href='likeartist'>myartist</a></li>
		<li><a href='likealbum'>myalbum</a></li>
		<li><a href='mybundle'>mybundle</a></li>
	</ul>
</div>
<br><br><br>
<div id="artist">
	<c:choose>
		<c:when  test="${artistList.size() > 0}">
			<c:forEach var="at" items="${artistList}" varStatus="status">
				<ul>
					<li>
						<div id="at-img">
							<dd><a href="artistView?atseq=${at.atseq}">${at.img}</a></dd>
						</div>
						<div id="at-info">
							<dl>
								<dd><a href="artistView?atseq=${at.atseq}">${at.name}</a></dd>
								<dd>${at.groupyn} | ${at.gender} | ${at.genre }</dd>

							</dl>
						</div>
					</li>
					<li>
				</ul>
			</c:forEach>
			</c:when>
        <c:otherwise>
            <tr>
                <td colspan="6" style="text-align: center;">좋아하는 가수를 추가해주세요</td>
            </tr>
        </c:otherwise>
    </c:choose>
</div>


<%@ include file="../include/headerfooter/footer.jsp" %>