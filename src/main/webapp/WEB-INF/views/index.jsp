<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/headerfooter/header.jsp" %>
	<div class="mainTitle"><h1>ECO 추천</h1></div>
	
	<!-- --------------------------------------Top----------------------------------------------- -->
	
	<!-- recommend 화면 모습 -->
        <div class="recommendBox">
        <!-- 롤링박스 전체 크기 -->
               <div class="recommendBoxRo">
               <!-- 롤링 박스 시작 -->
               <div id="re_Lbtn">
                           <i class="fas fa-chevron-left fa-4x" ></i>
                        </div>
                        <div id="re_Rbtn">
                           <i class="fas fa-chevron-right fa-4x"></i>
               </div>
               <c:forEach items="${bundleList }" var="bundleListALL" varStatus="status">
                   <div class="recommend">
                        <div class="recommendThemaBox">
                            <div class="recommendTitle"> 
                            	<c:forEach items="${bundleList }" var="bundle" begin="${status.index}" end="${status.index}">
                            			<h1>${bundle.title }</h1>
                            	</c:forEach>
                            </div>
                            <div class="recommendContent">
                            <c:forEach items="${bundleList }" var="bundle" begin="${status.index}" end="${status.index}">
                            			총 
                            			${fn:length(bundle.musicList)}
                            			곡 | <fmt:formatDate value="${bundle.cdate }" type="date" pattern="yyyy.MM.dd"/>
                            </c:forEach>
                            </div>
                            <div class="recommendPlayBox">
                                <i class="fas fa-play-circle fa-4x"></i>
                            </div>
                        </div>
                    <div class="recommendThemaListBox">
                        <table id="recommendChart">
                        	<c:forEach items="${bundleList }" var="bundle" begin="${status.index}" end="${status.index}">
                            		<c:forEach items="${bundle.musicList }" var="music" begin="0" end="3">
		                            		<tr>
			                					<td class="albumS">
			                						<div class="albumImg">
			                                    		<img src="${music.abimg}">
			                                    	</div>
			                					</td>
			                					<td class="MusicT">
			                						${music.title }
			                					</td>
			                					<td class="MusicA">
			                						${music.name }
			                					</td>
			                				</tr>
		                			</c:forEach>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="recommendThemaListBox">
                        <table id="recommendChart">
                            <c:forEach items="${bundleList }" var="bundle" begin="${status.index}" end="${status.index}">
                            		<c:forEach items="${bundle.musicList }" var="music" begin="4" end="7">
		                            		<tr>
			                					<td class="albumS">
			                						<div class="albumImg">
			                                    	<!-- 앨범 이미지 자리 -->
			                                    	</div>
			                					</td>
			                					<td class="MusicT">
			                						${music.title }
			                					</td>
			                					<td class="MusicA">
			                						${music.name }
			                					</td>
			                				</tr>
		                			</c:forEach>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                </c:forEach>
        </div>
       </div>
       <!-- 롤링박스 끝 -->
       
        <div class="rotateButtonBox">
            <div class="rotateButtonAlign">
	            <c:forEach items="${bundleList }" var="bundleListALL" varStatus="status">
	                <div class="rotateButton"></div>
				</c:forEach>
        	</div>
        </div>
        
<!-- --------------------------------------Middle----------------------------------------------- -->
        
		<h1>최신곡</h1> <!-- 링크 태그 필요 -->
		<div class="mainRecommedBox">
			<c:forEach items="${newMusicList }" var="nlist" begin="0" end="3">
				<div class="MainAlbum">
					<div class="MainAlbumImg">
						<img src="${nlist.abimg}">
					</div>
					<div class="MainMusicContentBox">
						${nlist.title }
					</div>
					<div class="MainMusicContentBox">
						${nlist.name }
					</div>
				</div>
			</c:forEach>
		</div>
		
		<h1>맞춤 아티스트</h1>
		<div class="mainRecommedBox">
			<c:forEach items="${recommendMusicList }" var="nlist" begin="0" end="3">
			<div class="MainAlbum">
				<div class="MainAlbumImg">
					<img src="${nlist.atimg}">
				</div>
				<div class="MainMusicContentBox">
					${nlist.name }
				</div>
				<div class="MainMusicContentBox">
					${nlist.gtitle }
				</div>
			</div>
			</c:forEach>
		</div>
		
		<h1>맞춤 곡</h1>
		<div class="mainRecommedBox">
			<!-- 반복문 작성 -->
			<div class="MainAlbum">
				<div class="MainAlbumImg">
					<img src="${music.abimg}">
				</div>
				<div class="MainMusicContentBox">
					${music.title }
				</div>
				<div class="MainMusicContentBox">
					${music.name }
				</div>
			</div>
			<!-- 반복문 끝 -->
		</div>
		
<!-- --------------------------------------botton----------------------------------------------- -->
<script src="js/audioplayer.js"></script>
<li id="audio-list">
    <div class="audio-player">
        <div class="track-title">사운드 플레이어</div>
        <div id="seekObjContainer">
            <div id="timeBox">	
            	<small class="start-time"></small><small class="end-time"></small>
            </div>	
            <div id="timeline1">
                <div id="seekObj1" class="playhead" style="width: 0px;"></div>
            </div>
        </div>
        <div class="player-controls scrubber">
          <input type="button" value="◀" class="prev">
          <input type="button" value="play-pause" class="play-pause">
          <input type="button" value="stop" class="stop" onclick="stop">
          <input type="button" value="mute" class="mute" onclick="mute()">
          <input type="button" value="▶" class="next">
          <input type="button" value="한곡반복" class="oneLoop">
          <input type="button" value="전체반복" class="wholeLoop">
          <input id="volumecontrol" type="range" max="1" step="any" onchange="updateVolume()">
        </div>
        <div class="controls-box">
      		<i class="previous-track-btn disabled"><span class="screen-reader-text">Previous track button</span></i>
      		<i class="next-track-btn"><span class="screen-reader-text">Next track button</span></i>
    	</div>
        
        
        <div class="audio-wrapper">
            <audio id="player2" preload="auto">
            <%-- <c:forEach items="${music}" var="playlist" begin="${music.mseq}" end="${music.mseq}"> --%>
			      <source src="https://docs.google.com/uc?export=open&id=1YWv-0SIQ74_RUSBfPBbVSLBfUUkqMjEf" type="audio/mp3">
			<%-- </c:forEach> --%>      
            </audio>
        </div>
    </div>
 </li>
   
              
<%@ include file="include/headerfooter/footer.jsp" %>