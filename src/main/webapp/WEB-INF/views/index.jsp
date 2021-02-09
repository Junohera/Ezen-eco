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
                            			<!-- 갯수 자리 -->
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
			                                    		<img src="../images/${music.abimg}">
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
						<img src="../images/${nlist.abimg}">
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
					<img src="../images/${nlist.atimg}">
				</div>
				<div class="MainMusicContentBox">
					${nlist.name }
				</div>
				<div class="MainMusicContentBox">
					${nlist.theme }
				</div>
			</div>
			</c:forEach>
		</div>
		
		<h1>맞춤 곡</h1>
		<div class="mainRecommedBox">
			<!-- 반복문 작성 -->
			<div class="MainAlbum">
				<div class="MainAlbumImg">
					<img src="../images/${music.abimg}">
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
		
		<script type="text/javascript">
		function $(id){
		   return document.getElementById(id);
		}
		var src='https://docs.google.com/uc?export=open&id=1YWv-0SIQ74_RUSBfPBbVSLBfUUkqMjEf';
		var audio = new Audio(src);
		
		audio.addEventListener(
		   "timeupdate", function(e){
		      $("time_info").innerHTML = "진행 : " + audio.currentTime + "/" + audio.duration;   
		      $("volume_info").innerHTML = "볼륨 : " + audio.volume;         
		   }
		);
		
		function changeVolume(v){
		   var new_v = audio.volume + v;
		   if( 0 <= new_v && new_v <= 1.0){
		      audio.volume = new_v;   
		   }
		}
		
		function audio_play(){
		   audio.play();
		}
		
		function audio_pause(){
		   audio.pause();
		}
		
		function audio_stop(){
		   audio.currentTime = 0;
		   audio.pause();   
	}
</script>
<h2>사운드플레이어</h2>
   <div id="time_info"></div>
   <div id="volume_info"></div>
   <div id="player_div">
      <input type="button" value="play" onClick="audio_play()" />
      <input type="button" value="pause" onClick="audio_pause()" />  
      <input type="button" value="Vol+" onClick="changeVolume(+0.2)" />      
      <input type="button" value="Vol-" onClick="changeVolume(-0.2)" />          
   </div>
		

<%@ include file="include/headerfooter/footer.jsp" %>