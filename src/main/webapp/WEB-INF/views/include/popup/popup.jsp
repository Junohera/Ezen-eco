<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 뮤직에서 더보기버튼 눌렀을때 나오는 상자 -->
	<ul id="musicMoreBox" style="display:none;">
        <div class="close" onclick="$music.off_musicMoreBox();">X</div>
        <li>
            <div class="imgBox"><span style="font-size: 14px; color: #333333;"><i class="fas fa-music"></i></span></div>
            <div class="textBox"><a href="#">곡정보</a></div>
            <div class="checkImgBox"><span style="font-size: 14px; color: #cb78ff;"><i class="fas fa-check"></i></span></div>
        </li>
        <li>
            <div class="imgBox"><span style="font-size: 14px; color: #333333;"><i class="fas fa-bullseye"></i></span></div>
            <div class="textBox"><a href="#">앨범정보</a></div>
            <div class="checkImgBox"><span style="font-size: 14px; color: #cb78ff;"><i class="fas fa-check"></i></span></div>
        </li>
        <li>
            <div class="imgBox"><span style="font-size: 14px; color: #333333;"><i class="fas fa-microphone"></i></span></div>
            <div class="textBox"><a href="#">아티스트정보</a></div>
            <div class="checkImgBox"><span style="font-size: 14px; color: #cb78ff;"><i class="fas fa-check"></i></span></div>
        </li>
        <li>
            <div class="imgBox"><span style="font-size: 14px; color: #333333;"><i class="far fa-heart"></i></span></div>
            <div class="textBox"><a href="#">좋아요</a></div>
            <div class="checkImgBox"><span style="font-size: 14px; color: #cb78ff;"><i class="fas fa-check"></i></span></div>
        </li>
        <li>
            <div class="imgBox"><span style="font-size: 14px; color: #333333;"><i class="fas fa-ban"></i></span></div>
            <div class="textBox"><a href="#">이 곡 안듣기</a></div>
            <div class="checkImgBox"><span style="font-size: 14px; color: #cb78ff;"><i class="fas fa-check"></i></span></div>
        </li>
    </ul>