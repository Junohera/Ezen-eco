<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
        /*musicMoreBox 더보기 버튼*/
        #musicMoreBox {
            position:fixed;
            z-index: 9999;
            width: 200px;
            height: 200px;
            border: 1px solid lightgray;
            box-sizing: border-box;
            box-shadow: 0px 0px 10px 5px lightgray;
            background: white;
            list-style: non;
            margin: 0;
            padding: 0;
            padding-top:18px;
        }

        #musicMoreBox a {
            text-decoration: none;
        }

        #musicMoreBox li {
            position: relative;
            width:198px;
            height:36px;
            margin: 0;
            padding: 0;
            display: block;
            overflow: hidden;
        }

        #musicMoreBox .imgBox {
            position: absolute;
            top: 7px;
            left: 12px;
            width: 23px;
            height: 23px;
            text-align: center;
        }

        #musicMoreBox .checkImgBox {
            position: absolute;
            top: 5px;
            right: 30px;
            width: 23px;
            height: 23px;
            text-align: center;
            display: none;
        }

        #musicMoreBox .textBox {
            position: absolute;
            top:8px;
            left:31px;
            height: 23px;
            line-height: 23px;
        }

        #musicMoreBox .textBox a{
            display: block;
            position: relative;
            padding-left: 17px;
            font-size: 14px;
            text-align: left;
            color: #353535;
        }

        #musicMoreBox .close {
            cursor: pointer;
            position: absolute;
            top: 0px;
            right: 0px;
            width: 23px;
            height: 23px;
            text-align: center;
            line-height: 23px;
            z-index: 9999;
        }

        /*musicMoreBox 더보기 버튼*/
    </style>
<!-- 뮤직에서 더보기버튼 눌렀을때 나오는 상자 -->
	<ul id="musicMoreBox" style="display:none;">
        <div class="close" onclick="$music.off_musicMoreBox();">X</div>
        <li>
            <div class="imgBox"><span style="font-size: 14px; color: #333333;"><i class="fas fa-music"></i></span></div>
            <div class="textBox"><a href="musicView?mseq=${music.mseq}">곡정보</a></div>
            <div class="checkImgBox"><span style="font-size: 14px; color: #cb78ff;"><i class="fas fa-check"></i></span></div>
        </li>
        <li>
            <div class="imgBox"><span style="font-size: 14px; color: #333333;"><i class="fas fa-bullseye"></i></span></div>
            <div class="textBox"><a href="albumView?abseq=${music.abseq}">앨범정보</a></div>
            <div class="checkImgBox"><span style="font-size: 14px; color: #cb78ff;"><i class="fas fa-check"></i></span></div>
        </li>
        <li>
            <div class="imgBox"><span style="font-size: 14px; color: #333333;"><i class="fas fa-microphone"></i></span></div>
            <div class="textBox"><a href="artistView?atseq=${music.atseq}">아티스트정보</a></div>
            <div class="checkImgBox"><span style="font-size: 14px; color: #cb78ff;"><i class="fas fa-check"></i></span></div>
        </li>
        <li>
            <div class="imgBox"><span style="font-size: 14px; color: #333333;"><i class="far fa-heart"></i></span></div>
            <div class="textBox"><a href="like?mseq=${music.mseq}">좋아요</a></div>
            <div class="checkImgBox"><span style="font-size: 14px; color: #cb78ff;"><i class="fas fa-check"></i></span></div>
        </li>
        <li>
            <div class="imgBox"><span style="font-size: 14px; color: #333333;"><i class="fas fa-ban"></i></span></div>
            <div class="textBox"><a href="ban?mseq=${music.mseq}">이 곡 안듣기</a></div>
            <div class="checkImgBox"><span style="font-size: 14px; color: #cb78ff;"><i class="fas fa-check"></i></span></div>
        </li>
    </ul>