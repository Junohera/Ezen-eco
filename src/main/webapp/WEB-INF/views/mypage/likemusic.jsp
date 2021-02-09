<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<style type="text/css">
	#themeAndGenre li{width:100px; list-style-type: none; margin:10px; float:left;}
	th{height:80; width:895px;}
	th{padding-left:20px; text-align: left; white-space: nowrap; height: 39px; font-size: 13px; color: #a0a0a0;
		font-weight: 400; border-top: 1px solid #ebebeb;  border-bottom: 1px solid #ebebeb;}
	td{padding-left:20px; text-align: left; white-space: nowrap; height: 39px; font-size: 15px; color: #5D5D5D;
		font-weight: 450; }
	
</style>

<div id="themeAndGenre">
	<ul>
		<li class="selected"><a href='storage'>mymusic</a></li>
		<li><a href='likeartist'>myartist</a></li>
		<li><a href='likealbum'>myalbum</a></li>
		<li><a href='mybundle'>mybundle</a></li>
	</ul>
</div>
<br>
<br>
<table id="listBox">
        <tr>
            <th align="center"><input type="checkbox" name="allCheck"></th>
            <th>곡/앨범</th>
            <th>아티스트</th>
            <th>듣기</th>
            <th>재생목록</th>
            <th>내 리스트</th>
            <th>더보기</th>
        </tr>
        <c:choose>
		 <c:when test="${musicList.size() > 0}">
                <c:forEach var="music" items="${musicList}" varStatus="status">
                    <tr height="84" class="musicTr">
                        <input type="hidden" name="mseq" value="${music.mseq}">
                        <input type="hidden" name="abseq" value="${music.abseq}">
                        <input type="hidden" name="atseq" value="${music.atseq}">
                        <input type="hidden" name="title" value="${music.title}">
                        <input type="hidden" name="abimg" value="${music.abimg}">
                        <input type="hidden" name="name" value="${music.name}">
                        <td><input type="checkbox" name="mseq_checkbox" value="${music.mseq}"></td>
                        <td>
                            <div class="justWrap">
                                <div class="contentWrap">
                                    <img src="" alt="" width="60" height="60">
                                    <a href="albumView?abseq=${music.abseq}">${music.abimg}</a>
                                	<a href="musicView?mseq=${music.mseq}">${music.title}</a>
                                </div>
                            </div>
                        </td>
                        <td><a href="artistView?atseq=${music.atseq}">${music.name}</a></td>
                        <!-- 듣기 -->
                        <td style="text-align: center; padding: 0; margin: 0">
                            <a class="iconButton listen">&nbsp;
                                <span style="font-size: 20px; color: #333333;"><i class="fas fa-play"></i></span>
                            </a>
                        </td>
                        <!-- 재생목록 -->
                        <td style="text-align: center; padding: 0; margin: 0">
                            <a class="iconButton playListAdd">&nbsp;
                                <span style="font-size: 20px; color: #333333;"><i class="fas fa-outdent"></i></span>
                            </a>
                        </td>
                        <!-- 내 리스트 -->
                        <td style="text-align: center; padding: 0; margin: 0">
                            <a href="#" class="iconButton">&nbsp;
                                <span style="font-size: 20px; color: #333333;"><i class="fas fa-folder-plus"></i></span>
                            </a>
                        </td>
                        <!-- 더보기 -->
                        <td style="text-align: center; padding: 0; margin: 0">
                            <a class="iconButton moreDiv">&nbsp;
                                <span style="font-size: 20px; color: #333333;"><i class="fas fa-ellipsis-v"></i></span>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
        <c:otherwise>
            <tr>
                <td colspan="6" style="text-align: center;">좋아하는 곡을 추가해주세요</td>
            </tr>
        </c:otherwise>
    </c:choose>
</table>


<%@ include file="../include/headerfooter/footer.jsp" %>