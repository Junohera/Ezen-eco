<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<article id="music_artistView">
    <!-- 좋아하는 아티스트 시퀀스 목록중 동일하면 isLike 출력 -->
    <c:forEach var="likeAtseq" items="${likeArtistList}">
        <c:if test="${likeAtseq eq artist.atseq}">
            <input type="hidden" name="artistlikeyn" value="y">
        </c:if>
    </c:forEach>

    <div class="contentBox">
        <div class="artist">
            <div class="thumbnail">
                <img src="${artist.img}" alt="">
                <div id="thumbnail_dim"></div>
            </div>
            <span class="thumbnailPlayBtn" onclick="$('#playListAddAll').trigger('click');">
                <i class="fas fa-play"></i>
            </span>
            <div class="info">
                <ul>
                    <li style="font-size: 28px;margin-bottom: 20px;height: 40px;">
                        <a>
                            ${artist.name}
                        </a>
                    </li>
                    <li style="font-size: 13px;margin-bottom: 5px;font-weight:400;">
                        <c:choose>
                            <c:when test="${artist.groupyn eq 'Y'}">그룹</c:when>
                            <c:otherwise>솔로</c:otherwise>
                        </c:choose>
                        <span style="display:inline;font-size: 8px;font-weight: 100;color:#969696;">l</span>
                        <c:choose>
                            <c:when test="${artist.gender eq 'M'}">남성</c:when>
                            <c:when test="${artist.gender eq 'F'}">여성</c:when>
                            <c:when test="${artist.gender eq 'A'}">혼성</c:when>
                            <c:otherwise></c:otherwise>
                        </c:choose>
                        <span style="display:inline;font-size: 8px;font-weight: 100;color:#969696;">l</span>
                        ${artist.genre}
                    </li>
                    <li style="font-size: 13px; color: #969696;font-weight:100;"><fmt:formatDate value="${album.pdate}" pattern="yyyy.MM.dd"></fmt:formatDate></li>
                </ul>
                <ul class="iconList">
                    <li>
                        <a class="iconButton unlike" onclick="$music.method.unlike('${artist.atseq}', null, null);">
                            <span style="font-size: 24px;color: red;opacity: 1;">
                                <i class="fas fa-heart"></i>
                            </span>
                        </a>
                        <a class="iconButton like" onclick="$music.method.like('${artist.atseq}', null, null);">
                            <span style="font-size: 24px;color: rgb(51, 51, 51);opacity: 1;">
                                <i class="far fa-heart"></i>
                            </span>
                        </a>
                    </li>
                    <li style="padding-top: 6px;padding-left: 2px;">
                        <a class="iconButton playListAdd" onclick="$music.method.musicList.playListAddAll($('#listBox .musicTr'));">
                            <span style="font-size: 12px;color: rgb(51, 51, 51);opacity: 1;"><i class="fas fa-outdent"></i></span>
                            <span style="font-size: 11px;font-weight: 500;color: rgb(51, 51, 51);opacity: 1;position: absolute;top: -3px;left: 16px;width: max-content;">인기곡 듣기</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <ul id="trackAndAlbum">
        <li class="selectTab">
            <a>곡</a>
        </li> 
        <li>
            <a>앨범</a>
        </li>
    </ul>

    <div id="trackBox">
        <ul class="filterList">
            <li style="float:left;">
                <!-- 전체듣기 -->
                <a class="allListen iconButton" id="playListAddAll" style="cursor: pointer;font-size: 12px;margin-bottom:20px;font-weight: 100;margin-left:20px">
                    <span style="font-weight: 100; font-size: 10px; color: #333333;">
                        <i class="fas fa-play"></i>
                    </span>
                    전체듣기
                </a>
            </li>
            <li><a href="artistView?atseq=${artist.atseq}&tab=track&searchFilter=titleDesc">가나다순</a></li>
            <li><a href="artistView?atseq=${artist.atseq}&tab=track&searchFilter=pdateDesc">최신순</a></li>
            <li><a href="artistView?atseq=${artist.atseq}&tab=track&searchFilter=albumLikeDesc">인기순</a></li>
            <li><a href="artistView?atseq=${artist.atseq}&tab=track" class="selectedFilter">전체</a></li>
        </ul>

        <%@ include file="../include/musicList.jsp" %>
    </div>

    <div id="albumBox" style="display:none;">
        <ul class="filterList">
            <li><a href="artistView?atseq=${artist.atseq}&tab=album&searchFilter=titleDesc">가나다순</a></li>
            <li><a href="artistView?atseq=${artist.atseq}&tab=album&searchFilter=pdateDesc">최신순</a></li>
            <li><a href="artistView?atseq=${artist.atseq}&tab=album&searchFilter=albumLikeDesc">인기순</a></li>
            <li><a href="artistView?atseq=${artist.atseq}&tab=album" class="selectedFilter">전체</a></li>
        </ul>

        <ul style="margin:0; padding:0;">
            <c:choose>
                <c:when test="${albumList.size() eq 0}">
                    <h3 style="font-size: 20px;width: 100%;height: 300px;color: #969696;font-weight: 100;text-align: center;line-height: 300px;">
                        등록된 앨범이 없습니다.
                    </h3>
                </c:when>
                <c:otherwise>
                    <li class="albumItem">
                        <div class="album">
                            <div class="thumbnail">
                                <img src="${album.img}" alt="">
                                <div id="thumbnail_dim"></div>
                                <span onclick="$('#playListAddAll').trigger('click');">
                                    <i class="fas fa-play"></i>
                                </span>
                            </div>
                            <div class="info">
                                <ul>
                                    <li style="font-size: 15px;height: max-content;">
                                        <a href="albumView?abseq=${album.abseq}">
                                            ${album.title} title
                                        </a>
                                    </li>
                                    <li style="font-size: 14px;font-weight:100;height: max-content;color:#333333;">
                                        <a style="color:#333333;" href="artistView?atseq=${album.atseq}">
                                            ${album.name} name
                                        </a>
                                    </li>
                                    <li style="font-size: 13px;font-weight:100;margin-top: 12px;height: max-content;">
                                        ${album.abtype} 앨범 타입
                                    </li>
                                    <li style="font-size: 13px; color: #969696;font-weight:100;"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd"></fmt:formatDate></li>
                                </ul>
                                <ul class="iconList">
                                    <li>
                                        <a class="iconButton playListAdd" onclick="$music.method.musicList.playListAddAll($('#listBox .musicTr'));">
                                            <span style="font-size: 16px; color: #333333;"><i class="fas fa-outdent"></i></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="iconButton myListAdd" onclick="$music.method.myList.on_listByDetail();">
                                            <span style="font-size: 16px; color: #333333;"><i class="fas fa-folder-plus"></i></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="iconButton unlike" onclick="$music.method.unlike(null, '${album.abseq}', null);">
                                            <span style="font-size: 16px; color: red;">
                                                <i class="fas fa-heart"></i>
                                            </span>
                                        </a>
                                        <a class="iconButton like" onclick="$music.method.like(null, '${album.abseq}', null);">
                                            <span style="font-size: 16px; color: #333333;">
                                                <i class="far fa-heart"></i>
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>