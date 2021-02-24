<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/adminhf/header.jsp" %>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
    $(function() {

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

<article style="min-height:500px;margin-top:100px; width:1000px; margin:0 auto;">
    <form action="albumManageUpdate" method="POST" enctype="multipart/form-data">
    	${message}<br>
        <label for="title">
            앨범 타이틀 <input type="text" name="title" value="${album.title}">
        </label>
        <br>
        <%-- 
      	<label for="pdate">  
        	앨범 발매일 : <fmt:formatDate value="${album.pdate}" type="date" pattern="yyyy.MM.dd"/>
        </label>
         --%>
        <br>
        <div style="width: 45%;display:inline-block;float:left;">
	        <p>가수</p>
	        <div style="width: 450px;border: 1px solid gray;height: 250px;overflow-y: scroll;">
	            <c:forEach var="artist" items="${ArtistList}" varStatus="status">
	                <label for="artist_${artist.atseq}" style="width: 100%;margin: 0;padding:0;display:block;">
	                    <input id="artist_${artist.atseq}" type="radio" name="atseq" value="${artist.atseq}"
	                        <c:if test="${album.atseq eq artist.atseq}">checked</c:if>
	                    >${artist.name}
	                </label>
	            </c:forEach>
	        </div>
        </div>
        <div style="width: 45%;display:inline-block;float:left;">
	        <p>장르</p>
	        <div style="width: 450px;border: 1px solid gray;height: 250px;overflow-y: scroll;">
	            <c:forEach var="genre" items="${genreList}" varStatus="status">
	                <label for="genre_${genre.gseq}" style="width: 100%;margin: 0;padding:0;display:block;">
	                    <input id="genre_${genre.gseq}" type="radio" name="gseq" value="${genre.gseq}"
	                        <c:if test="${album.gseq eq genre.gseq}">checked</c:if>
	                    >${genre.title}
	                </label>
	            </c:forEach>
	        </div>
	     </div>
	     <%-- 
        <div style="width: 33%;display:inline-block;float:left;">
        	<p>앨범타입 : <input type="text" name="abtype1"  placeholder="추가할 앨범타입을 입력하세요" style="font-size:11px;">
        		<input type="button" value="add" onclick="add(this.form, '${album.abtype}');">
        		<input type="button" value="del" onclick="del(this.form, '${album.abtype}');"></p>
	        <div style="width: 300px;border: 1px solid gray;height: 250px;overflow-y: scroll;">
	            <c:forEach var="abtype" items="${abtypeListByAlbum}" varStatus="status">
	                <label for="abtype_${abtype}" style="width: 100%;margin: 0;padding:0;display:block;">
	                    <input id="abtype_${abtype}" type="radio" name="abtype" value="${abtype}"
	                        <c:if test="${album.abtype eq abtype}">checked</c:if>
	                    >${abtype}
	                </label>
	            </c:forEach>
	        </div>
	    </div>
	     --%>
	    <div style="width: 30%;display:inline-block;">
	    	<label for=abtype>
	            앨범 타이틀 <input type="text" name="abtype" value="${album.abtype}">
	            <input type="button" value="abtype" class="submit" onclick="AbtypeList();">
	        </label>
	         <p>이미지</p>
	         <label for="img">
	         	<img style="display:block;" id="img" src="${album.img}" width="100" height="100" onerror="this.src='../upload/noimage.jpg'">
	         </label>
	         <input id="file" type="file" name="img" value="${album.img}" style="width: 400px;">
	         <input type="text" name="imglink" value="" placeholder="링크 미사용시 빈칸을 유지하세요." 
	                style="width: 400px;" 
	                onchange="document.getElementById('img').src=this.value;">
	        <br>
	        <label for="pdate">  앨범 발매일
	        	<input id="datepicker" type="date" name="inputpdate" placeholder="날짜넣기">
	        </label>
	        <p>소개</p>
	        <textarea name="content" cols="30" rows="10">${album.content}</textarea>
	        <br>
        </div>
        <br>
        <input type="button" value="list" onclick="location.href='albumManageList'">
        <input type="reset" value="cancel">
        <input type="submit" value="save">
        <input type="button" value="del" onclick="del(this.form, '${album.abseq}');">
    </form>
</article>

<script>
function AbtypeList(){
    var url = "AbtypeList?first=yes";
    var opt = "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=800, ";
    opt = opt + "height=700, top=300, left=300";
    window.open(url, "AbtypeList", opt);
}
	function del(form, abseq) {
	    if (confirm("삭제하시겠습니까?")) {
	        form.action = "albumManageDelete?abseq=" + abseq;
	        form.submit();
	    }
	}
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