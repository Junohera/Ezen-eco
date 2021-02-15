<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/headerfooter/header.jsp" %>

<style>
#themeAndGenre li{width:100px; list-style-type: none; margin:10px; float:left;}
th{height:80; width:895px;}
th{padding-left:20px; text-align: left; white-space: nowrap; height: 39px; font-size: 13px; color: #a0a0a0;
	font-weight: 400; border-top: 1px solid #ebebeb;  border-bottom: 1px solid #ebebeb;}
td{padding-left:20px; text-align: left; white-space: nowrap; height: 39px; font-size: 15px; color: #5D5D5D;
	font-weight: 450; }
#bundleDetailView{width:100%; height:1000px; border: 1px solid #ebebeb; padding-top:50px;}
#bundled-inner{width:845px; height:245px; padding-left:50px;border: 1px solid #ebebeb; position: relative;}
#bundled-mainImg{width:240px; height:240px;border: 1px solid #ebebeb;position: relative; float:left;}
#bundled-info{width:515px; height:240px; padding-right: 50px; padding-left: 35px; border: 1px solid red; position: relative; float:left;}
</style>

<article id="bundleDetailView">
	<div id="bundled-inner">
		<div id="bundled-mainImg"></div>
		<div id="bundled-info"></div>
	</div>
	<div id="bundled-musicList">
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
	       		<c:when test="${bundleDetailList.size() > 0}">
			    	<c:forEach var="bdl" items="${bundle.musicList}" varStatus="status">
			    		<tr>
			    			<td>${bdl.title}</td>
			    			<td>${bdl.abimg}</td>
			    			<td>${bdl.name}</td>
			    		</tr>
			    	</c:forEach>
			    </c:when>
			    <c:otherwise>
			    	<tr colspan="7" style="text-align: center;">곡이 없습니다.</tr>
			    </c:otherwise>
	       	</c:choose>
		</table>
	</div>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>