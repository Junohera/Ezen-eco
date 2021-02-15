<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<style>
/* #bundleviewbox{list-style:none;}
#themeAndGenre ul{position:relative; width:100%; height:40px; list-style-type: none; margin:10px; float:left; border:1px solid red;}
#themeAndGenre li{width:100px; margin:10px; float:left;}
.myBundleList{width:100%; height:500px; position:relative;}
.myBundleList li{position:relative; float:left}
.bl-img{width:173px; height:173px; border:1px solid red; position:relative; float:left}
.bl-info{width:217px; height:175px; border:1px solid red; position:relative; float:left} */

	#themeAndGenre li{width:100px; list-style-type: none; margin:10px; float:left;}
	ul, li, dl{list-style: none;}
	
	#bundleView{
		width:100%;
		height:500px;
		margin-top: -20px;
	    padding-top: 57px;
	}
	#bundlelist{
		width:417px;
		height:189px;
		margin-top:27px;
		margin-left:22px;
		padding-right:12px;
		position:relative;
		float:left;
	}
	#bundle-img{
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
	#bundle-info{
		width:217px;
		height:175px;
		padding-top:14px;
		padding-left:20px;
		position:relative;
		float:left;
		vertical-align: middle;
	}
	#bundle-title{
		width:204px;
		height:18px;
		position: relative;
	}
	
	#bundle-title .bundle{
		font-weight: 700;
		font-size: 15px;
		display: block;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	.hidden{
		display:none;
	}
	#bundle-info dl {
	    padding-top: 7px;
	    overflow: hidden;
	}
	#bundle-info dl dd {
	    display: inline;
	    padding: 0 4px 0 5px;
	    font-size: 13px;
	}
	
	#bundle-info dl dd.date {
	    display: block;
	    padding: 7px 0 0 0;
	    clear: both;
	    color: #969696;
	}
	
	#bundle-info dd{
		margin:0px;
	}
</style>

<div id="themeAndGenre">
	<ul>
		<li ><a href='storage'>mymusic</a></li>
		<li><a href='likeartist'>myartist</a></li>
		<li><a href='likealbum'>myalbum</a></li>
		<li class="selected"><a href='mybundle'>mybundle</a></li>
	</ul>
</div>
<br><br><br>
<article id="bundleView">
	<c:choose>
		<c:when  test="${bundleList.size() > 0}">
			<c:forEach var="bl" items="${bundleList}" varStatus="status">
				<div id="bundlelist">
					<div id="bundle-img">
						<a href="bundleDetailView?bmseq=${bl.bmseq}">
							<img class="photo1" src=""><!-- 번들이미지 들어가야함 -->
						</a>
					</div>
					<div id="bundle-info">
						<div id="bundle-title">
							<p class="bundle"><a href="bundleDetailView?bmseq=${bl.bmseq}">${bl.title}</a>
						</div>
						<dl>
							<dt class="hidden">번들리스트 정보</dt>
							<dd>${bl.musicList.size()}</dd>
							<dd class="date"><fmt:formatDate value="${bl.cdate }" type="date" pattern="yyyy.MM.dd"/></dd>
						</dl>
						<div id="bundle-util">
							<!-- 구조??물어보기 -->
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="6" style="text-align: center;">리스트를 추가해주세요</td>
	        </tr>
		</c:otherwise>
	</c:choose>
</article>

<%-- <div class="myBundleList">
	<c:choose>
			<c:when  test="${bundleList.size() > 0}">
				<c:forEach var="bl" items="${bundleList}" varStatus="status">
					<li>
						<div id="bl-img">
							<img src ="${bl.musicList.abimg}" >${bl.title}
						</div>
						<div class="bl-info">
							<dd><a href="bundleDetailView?bmseq=${bl.bmseq}">${bl.title}</dd>
							<dd>${bl.musicList.size()}</dd>
							<dd>${bl.cdate}</dd>
						</div>
					</li>
				</c:forEach>
			</c:when>
	        <c:otherwise>
	            <tr>
	                <td colspan="6" style="text-align: center;">좋아하는 리스트를 추가해주세요</td>
	            </tr>
	        </c:otherwise>
	    </c:choose>
</div>
</article> --%>

<%@ include file="../include/headerfooter/footer.jsp" %>