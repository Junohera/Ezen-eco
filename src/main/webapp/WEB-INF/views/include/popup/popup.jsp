<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 뮤직에서 더보기버튼 눌렀을때 나오는 상자 -->
	<ul id="musicMoreBox" style="display:none;">
        <li>
            <div class="imgBox"><img src="" alt="" width="23" height="23"></div>
            <div class="textBox"><a href="musicView?mseq=${music.mseq}">곡정보</a></div>
        </li>
        <li>
            <div class="imgBox"><img src="" alt="" width="23" height="23"></div>
            <div class="textBox"><a href="albumView?abseq=${music.abseq}">앨범정보</a></div>
        </li>
        <li>
            <div class="imgBox"><img src="" alt="" width="23" height="23"></div>
            <div class="textBox"><a href="artistView?atseq=${music.atseq}">아티스트정보</a></div>
        </li>
        <li>
            <div class="imgBox"><img src="" alt="" width="23" height="23"></div>
            <div class="textBox"><a href="like?mseq=${music.mseq}">좋아요</a></div>
        </li>
        <li>
            <div class="imgBox"><img src="" alt="" width="23" height="23"></div>
            <div class="textBox"><a href="ban?mseq=${music.mseq}">이 곡 안듣기</a></div>
        </li>
    </ul>