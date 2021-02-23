<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
    #audioBottom {
        position: fixed;
        bottom: 0;
        left: 0;
        z-index: 100;
        background: black;
        width: 100%;
        height: 100px;
        margin: 0;
        padding: 0;
    }
    #audioBottom * {
        /* border: 1px solid red; */
        margin: 0;
        padding: 0;
        list-style-type: none;
    }
    #audioBottom > ul {
        position: relative;
        margin: 0 auto;
        width: 950px;
        display: flex;
        justify-content: center;
    }
    #audioBottom > ul > li {
        position: relative;
        display: inline-block;
        height: 100px;
    }

    #audioBottom .right > ul > li > ul {
        position: absolute;
        width: 200px;
        right: 0px;
        top: 24px;
    }

    #audioBottom .right > ul > li {
        position: relative;
        display: inline-block;
        margin-left: 20px;
    }

    #audioBottom .center {
        position: relative;

    }

    #audioBottom #controller {
        font-size: 7px;
        color: #333333;
    }

    #audioBottom #controller ul {
        width: 100%;
        margin: 0 auto;
        position: relative;
        display: flex;
        justify-content: space-around;
    }
    #audioBottom #controller ul li {
        display: inline-block;
        position: relative;
    }
    #audioBottom #controller ul:nth-of-type(2) li:nth-of-type(2) {
        width: 260px;
    }
    
    #audioBottom #controller #gage {
        position: absolute;
        top: 12px;
        left: 0px;
        width: 100%;
        height: 4px;
        border-radius: 5px;
        background: #333333;
        cursor: pointer;
    }
    
    #audioBottom #controller #gage > div{
        height: 100%;
        width: 0%;
        background: #3f3fff;
        border-radius: 5px;
    }
</style>

<form style="position: absolute;width: 0;height: 0;" id="loginUserLikeList">
    <c:forEach var="likeMseq" items="${loginUser.likeList}" varStatus="status">
        <input type="hidden" name="likeMusicByLoginUser" value="${likeMseq}">
    </c:forEach>
</form>

<div id="audioBottom" style="display:none;">
    <input id="mseq" type="hidden" name="mseq" value="">
    <ul>
        <li style="width:300px;margin-top: 10px;height: 80px;">
            <img id="abimg" style="position: absolute;top: 10px;" src="" onerror="this.style.display='none';" width="63px" height="63px">
            <p id="title" style="position: absolute;left: 80px;top: 20px;font-size: 12px;color: white;"></p>
            <p id="name" style="position: absolute;left: 80px;top: 48px;color: gray;font-size: 7px;"></p>
        </li>
        <li id="controller" style="width:340px;" class="center">
            <ul style="margin-top:20px;">
                <li style="margin-top: 10px;"><span class="icon loop" style="cursor:pointer;font-size: 14px; color: gray;"><i class="fas fa-retweet"></i></span></li>
                <li style="margin-top: 5px;"><span class="icon prev" style="cursor:pointer;font-size: 20px; color: white;"><i class="fas fa-step-backward"></i></span></li>
                <li><span class="icon play" style="cursor:pointer;font-size: 24px; color: white;"><i class="fas fa-play"></i></span></li>
                <li style="display:none;"><span class="icon pause" style="cursor:pointer;font-size: 24px; color: white;"><i class="fas fa-pause"></i></span></li>
                <li style="margin-top: 5px;"><span class="icon next" style="cursor:pointer;font-size: 20px; color: white;"><i class="fas fa-step-forward"></i></span></li>
                <li style="margin-top: 10px;"><span class="icon shuffle" style="cursor:pointer;font-size: 14px; color: gray;"><i class="fas fa-random"></i></span></li>
            </ul>
            <ul style="margin-top:10px;">
                <li id="current" style="line-height: 27px;font-size: 7px;">00:00</li>
                <li>
                    <div id="gage">
                        <div></div>
                    </div>
                </li>
                <li id="total" style="line-height: 27px;font-size: 7px;">00:00</li>
            </ul>
        </li>
        <li style="width:300px;" class="right">
            <ul style="position: absolute;right: 40px;top: 35px;">
                <li>
                    <span class="icon like" style="cursor:pointer;font-size: 20px; color: gray;"><i class="far fa-heart"></i></span>
                </li>
                <li>
                    <span class="icon volume" style="cursor:pointer;font-size: 20px; color: gray;"><i class="fas fa-volume-up"></i></span>
                </li>
                <li>
                    <span class="icon list" style="cursor:pointer;font-size: 20px; color: gray;"><i class="fas fa-list-ul"></i></span>
                </li>
            </ul>
        </li>

    </ul>
</div>