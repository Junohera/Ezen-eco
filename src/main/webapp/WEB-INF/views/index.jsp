<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/headerfooter/header.jsp" %>
<%
	pageContext.setAttribute("cn", "\n");
%>
<c:if test="${message==12}">
	<script>
			alert("이용권 구매가 완료되었습니다");
	</script>
</c:if>
<div class="mainTitle"><h1>ECO 추천</h1></div>
	
	<!-- --------------------------------------Top----------------------------------------------- -->
	<!-- <a href="test">
		<div style="width: 100px; height: 100px; background: red; float: left;">
			테스트 이동
		</div>
	</a> -->
	<!-- recommend 화면 모습 -->
        <div class="recommendBox">
        <!-- 롤링박스 전체 크기 -->
        		<div id="re_Lbtn" onclick="move(1)" style="z-index: 2;">
               		<i class="fas fa-chevron-left fa-4x" ></i>
               </div>
               <div id="re_Rbtn" onclick="move(2)" style="z-index: 2;">
               		<i class="fas fa-chevron-right fa-4x"></i>
               </div> 
               <div id="recommendBoxRo">
               <!-- 롤링 박스 시작 -->
               <input type="hidden" value="${fn:length(bundleList)}" id="test">
               <c:forEach items="${bundleList }" var="bundleListALL" varStatus="status">
                   <div class="recommend">
                        <div class="recommendThemaBox">
                            <div class="recommendTitle"> 
                            	<c:forEach items="${bundleList }" var="bundle" begin="${status.index}" end="${status.index}">
                            			<h1>${fn:replace(bundle.title, cn, "<br>")}</h1>
                            	</c:forEach>
                            </div>
                            <div class="recommendContent">
                            <c:forEach items="${bundleList }" var="bundle" begin="${status.index}" end="${status.index}">
                            			총 
                            			${fn:length(bundle.musicList)}
                            			곡 | <fmt:formatDate value="${bundle.cdate }" type="date" pattern="yyyy.MM.dd"/>
                            </c:forEach>
                            </div>
                            <form action="recommendPlay" method="post">
                            	<c:forEach items="${bundleList }" var="bundle" begin="${status.index}" end="${status.index}">
		                            <div class="recommendPlayBox" onclick="$music.method.musicList.playListAddAll($(this).closest('.recommend').find('.mainTr'));">
		                                <i class="fas fa-play-circle fa-4x"></i>
		                            </div>
	                            	<input type="hidden" value="${bundle.musicList }">
	                            </c:forEach>
                            </form>
                        </div>
                    <div class="recommendThemaListBox">
                        <table id="recommendChart">
                        	<c:forEach items="${bundleList }" var="bundle" begin="${status.index}" end="${status.index}">
                            		<c:forEach items="${bundle.musicList }" var="music" begin="0" end="3">
			                            		<tr class="mainTr">
													<input type="hidden" name="mseq" value="${music.mseq}">
													<input type="hidden" name="abseq" value="${music.abseq}">
													<input type="hidden" name="atseq" value="${music.atseq}">
													<input type="hidden" name="title" value="${music.title}">
													<input type="hidden" name="src" value="${music.src}">
													<input type="hidden" name="abimg" value="${music.abimg}">
													<input type="hidden" name="name" value="${music.name}">
				                					<td class="albumS">
					                					<a href="musicView?mseq=${music.mseq}">
					                						<div class="albumImg">		
					                                    			<img src="${music.abimg}">
					                                    	</div>
					                                    </a>
				                					</td>
					                					<td class="MusicT">
						                					<a href="musicView?mseq=${music.mseq}">
						                						${music.title }
						                					</a>
					                					</td>
				                					<td class="MusicA">
				                						<a href="artistView?atseq=${music.atseq}">
				                							${music.name }
				                						</a>
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
			                						<a href="musicView?mseq=${music.mseq}">
					                						<div class="albumImg">		
					                                    			<img src="${music.abimg}">
					                                    	</div>
					                                    </a>
			                					</td>
			                					<td class="MusicT">
			                						<a href="musicView?mseq=${music.mseq}">
						                					${music.title }
						                			</a>
			                					</td>
			                					<td class="MusicA">
			                						<a href="artistView?atseq=${music.atseq}">
				                							${music.name }
				                					</a>
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
						<a href="musicView?mseq=${nlist.mseq}">	
					    	<img src="${nlist.abimg}">
					   	</a>
					   <div class="abPlayBtn" >
					    		<i class="fas fa-play"></i>
					    </div>
					</div>
					<div class="MainMusicContentBox">
						<a href="musicView?mseq=${nlist.mseq}">
							${nlist.title }
						</a>
					</div>
					<div class="MainMusicContentBox">
						<a href="artistView?atseq=${nlist.atseq}">
							${nlist.name }
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<h1>맞춤 아티스트</h1>
		<div class="mainRecommedBox">
			<c:forEach items="${recommendMusicList }" var="nlist" begin="0" end="3">
			<div class="MainAlbum">
				<div class="MainAlbumImg">
					<a href="musicView?mseq=${nlist.atseq}">	
					    	<img src="${nlist.atimg}">
					</a>
					<div class="abPlayBtn" >
					    <i class="fas fa-play" aria-hidden="true"></i>
					</div>
				</div>
				<div class="MainMusicContentBox">
					<a href="musicView?mseq=${nlist.atseq}">
						${nlist.name }
					</a>
				</div>
				<div class="MainMusicContentBox">
					<a href="/browse?selectedType=genre&selectedSeq=${nlist.gseq}">
						${nlist.gtitle }
					</a>
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
 <script type="text/javascript">
		window.onload = function() {
			recommendBoxRo.style.width = "950" * document.getElementById("test").value + "px";
		}
</script>
<%@ include file="include/headerfooter/footer.jsp" %>