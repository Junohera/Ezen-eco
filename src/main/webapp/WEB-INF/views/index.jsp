<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/headerfooter/header.jsp" %>


	<h1>ECO 추천</h1>
    <div class="recommendBox">
        <div class="recommendThemaBox">
            <input class="recommendThemaPlayButton" type="button">
            <div class="recommendThema">
                <a href="themaDetail?tseq=${ThemaVO.tseq}" class="recommendThema">
                    <img src="../images/${ThemaVO.image}">
                </a>
            </div>
        </div>
        <div class="recommendThemaListBox">
            <table id="recommendChart">
                <tr class="font"><th>순서</th><th>곡명</th><th>아티스트</th></tr>
                <c:forEach items="${ThemaListMusic }" var="TVo" begin="0" end="6">
                	<tr class="font"><td>${status.count }</td><td>${TVo.seq }</td><td>${TVo.name }</td></tr>
                </c:forEach>
            </table>
    	</div>
    </div>
    <div class="rotateButtonBox">
        <div class="rotateButtonAlign">
<<<<<<< HEAD
        	<c:forEach items="${ThemaList }" begin="0" end="4">
=======
        	<c:forEach items="${bundleList}" begin="0" end="4">
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
           		<div class="rotateButton"></div>
           	</c:forEach>
        </div>
    </div>
    
	 <c:forEach var="bundle" items="${bundleList}" varStatus="status">
<<<<<<< HEAD
            <div>
                ${status.count}번째 번들
                ${bundle}
                <hr>
                <ul>
                    <c:forEach var="music" items="${bundle.musicList}" varStatus="status">
                        <li>
                            ${status.count}번째 곡
                            ${music} 
                        </li>
                        <hr>
                    </c:forEach>
                </ul>
            </div>
        </c:forEach>
=======
        <div>
            ${status.count}번째 번들
            ${bundle}
            <hr>
            <ul>
                <c:forEach var="music" items="${bundle.musicList}" varStatus="status">
                    <li>
                        ${status.count}번째 곡
                        ${music} 
                    </li>
                    <hr>
                </c:forEach>
            </ul>
        </div>
    </c:forEach>
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
</div>

<%@ include file="include/headerfooter/footer.jsp" %>