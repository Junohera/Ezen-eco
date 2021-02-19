<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/adminhf/header.jsp" %>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
    $(function() {
        if ("${message}" !== "") {
            alert("${message}");
        }
    })
	$(function () {
		$("#datepicker").datepicker();
	});
    
    var picker = new Pikaday({ 
    	 field: document.getElementById('datepicker'),
    	 format: 'yyyy-MM-dd',
    	 toString(date, format) {
    	   let day = ("0" + date.getDate()).slice(-2);
    	   let month = ("0" + (date.getMonth() + 1)).slice(-2);
    	   let year = date.getFullYear();
    	   return `${year}-${month}-${day}`;
    	 }
    	});
			
</script>

<article style="min-height:500px;margin-top:100px;">
    
    <form action="albumManageInsert" method="POST" enctype="multipart/form-data">
        <label for="title">
            앨범 타이틀 <input type="text" name="title" value="${album.title}">
        </label>
        <br>
        <p>가수</p>
        <div style="width: 200px;border: 1px solid gray;height: 200px;overflow-y: scroll;">
            <c:forEach var="artist" items="${ArtistList}" varStatus="status">
                <label for="artist_${artist.atseq}" style="width: 100%;margin: 0;padding:0;display:block;">
                    <input id="artist_${artist.atseq}" type="radio" name="atseq" value="${artist.atseq}"
                        <c:if test="${artist.atseq eq artist.atseq}">checked</c:if>
                    >${artist.name}
                </label>
            </c:forEach>
        </div>
        <br>
        <p>장르</p>
        <div style="width: 200px;border: 1px solid gray;height: 200px;overflow-y: scroll;">
            <c:forEach var="genre" items="${genreList}" varStatus="status">
                <label for="genre_${genre.gseq}" style="width: 100%;margin: 0;padding:0;display:block;">
                    <input id="genre_${genre.gseq}" type="radio" name="gseq" value="${genre.gseq}"
                        <c:if test="${album.gseq eq genre.gseq}">checked</c:if>
                    >${genre.title}
                </label>
            </c:forEach>
        </div>
        <br>
        <label for="abtype_single">
            싱글 : <input id="abtype" type="radio" name="abtype" value="싱글"
                <c:if test="${album.abtype  eq '싱글' }">checked</c:if>
            >
        </label>
        <label for="abtype_Studio">
            정규 : <input id="abtype" type="radio" name="abtype" value="정규"
                <c:if test="${album.abtype  eq '정규' }">checked</c:if>
            >
        </label>
        <label for="abtype_digital">
            디지털싱글 : <input id="abtype" type="radio" name="abtype" value="디지털싱글"
                <c:if test="${album.abtype  eq '디지털싱글' }">checked</c:if>
            >
        </label>
        <label for="abtype_live">
            라이브 : <input id="abtype" type="radio" name="abtype" value="라이브"
                <c:if test="${album.abtype  eq '라이브' }">checked</c:if>
            >
        </label>
        <label for="abtype_OST">
            OST : <input id="abtype" type="radio" name="abtype" value="OST"
                <c:if test="${album.abtype  eq 'OST' }">checked</c:if>
            >
        </label>
        <br>
        <label for="img">
            이미지 등록
            <input id="file" type="file" name="filename" value="${album.img}">
            <img style="display:block;" id="img" src="${album.img}" width="100" onerror="this.src='../upload/noimage.jpg'">
        </label>
        <p>이미지 링크</p>
        <input type="text" name="imglink" value="" placeholder="링크 미사용시 빈칸을 유지하세요." 
            style="width: 400px;" 
            onchange="document.getElementById('img').src=this.value;">
        <br>
        <p>소개</p>
        <textarea name="content" cols="30" rows="10">${album.content}</textarea>
        <br>
        <label for="pdate">  앨범 발매일
        	<input id="datepicker" type="date" name="inputpdate" placeholder="날짜넣기">
        </label>
        <input type="button" value="list" onclick="history.back();">
        <input type="reset" value="cancel">
        <input type="submit" value="save">
    </form>
</article>

<script>
    //이미지 미리 보기
	fn_imgReader = function(){
		$("#file").on({
			change:function(){
				// 이미지 초기화
				$("#img").attr("src", "");
				
			    var fileList = this.files;
			    var reader = new FileReader();
			    reader.readAsDataURL(fileList[0]);
			    reader.onload = function(){
			        $("#img").attr("src", reader.result);
			    };
			}
		});
	}
	fn_imgReader();
</script>