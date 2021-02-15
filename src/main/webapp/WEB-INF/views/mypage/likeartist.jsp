<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<style type="text/css">
	#themeAndGenre li{width:100px; list-style-type: none; margin:10px; float:left;}
	ul, li, dl{list-style: none;}

	#artistView{
		width:100%;
		height:500px;
		margin-top: -20px;
	    padding-top: 57px;
	}
	#artist-list{
		width:417px;
		height:189px;
		margin-top:27px;
		margin-left:22px;
		padding-right:12px;
		position:relative;
		float:left;
	}
	#artist-img{
		width:175px;
		height:175px;
		padding-top:14px;
		position:relative;
		float:left;
	}
	
	.photo {
	    width: 175px; height: 175px;
	    object-fit: cover;
	    object-position: top;
	    border-radius: 50%;
	}
	
	#artist-info{
		width:217px;
		height:175px;
		padding-top:14px;
		padding-left:20px;
		position:relative;
		float:left;
		vertical-align: middle;
	}
	
	#artist-name{
		width:204px;
		height:18px;
		position: relative;
	}
	#artist-name .artist{
		font-weight: 700;
		font-size: 15px;
		display: block;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	.hidden{display:none;}
	
	#artist-info dl {
	    padding-top: 7px;
	    overflow: hidden;
	}
	#artist-info dl dd:first-of-type {
	    padding-left: 0;
	}
	#artist-info dl dd {
	    position: relative;
	    display: inline;
	    padding: 0 4px 0 5px;
	    font-size: 13px;
	}
	#artist-info dl dd::after {
	    position: absolute;
	    top: 4px;
	    left: 0;
	    display: block;
	    width: 1px;
	    height: 8px;
	    background-color: #dcdcdc;
	    content: "";
	}
	#artist-info dd{
		margin:0px;
	}
	
	#artist-util{
		width:217px;
		height:23px;
		padding-top:15px;
		position: relative;
	}
	
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

<article id="artistView">
	<c:choose>
		<c:when  test="${artistList.size() > 0}">
			<c:forEach var="at" items="${artistList}" varStatus="status">
			<input type="hidden" name="atseq" value="${at.atseq}">
            <input type="hidden" name="atimg" value="${at.img}">
            <input type="hidden" name="name" value="${at.name}">
            <input type="hidden" name="groupyn" value="${at.groupyn}">
            <input type="hidden" name="gender" value="${at.gender}">
				<div id="artist-list">
					<div id="artist-img">
						<a href="artistView?atseq=${at.atseq}">
							<img class="photo" src="${at.img}">
						</a>
					</div>
					<div id="artist-info">
						<div id="artist-name">
							<p class="artist"><a href="artistView?atseq=${at.atseq}">${at.name}</a>
						</div>
						<dl>
							<dt class="hidden">아티스트 정보</dt>
							<dd>
								<c:if test="${at.groupyn eq 'Y'}">
	                             	그룹
	                            </c:if>
	                            <c:if test="${at.groupyn eq 'N'}">
	                             	솔로
	                            </c:if>
							</dd>
							<dd>
								<c:if test="${at.gender eq 'F'}">
	                             	여성
	                            </c:if>
								<c:if test="${at.gender eq 'M'}">
	                             	남성
	                            </c:if>
							</dd>
							<dd>
								${at.atgenre}
							</dd>
						</dl>
						<div id="artist-util">
							<dl>
					            
					        </dl>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
	           <tr>
	               <td colspan="6" style="text-align: center;">좋아하는 가수를 추가해주세요</td>
	           </tr>
		</c:otherwise>
	</c:choose>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>