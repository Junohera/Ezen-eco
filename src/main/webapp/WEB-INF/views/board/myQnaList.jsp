<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<article class="qna">
	<h1>문의 내역</h1>
	<a href="qnaWrite" class="QnaButton">
			<div>
				문의 작성
			</div>
	</a>
	<a href="qnaList" class="QnaButton" style="margin-right: 5px;">
			<div>
				돌아가기
			</div>
	</a>
		<table id="listBox" style="width: 950px; color: black">
			<tr>
				<th width="50px">문의 번호</th>
				<th width="800px">제목</th>
				<th width="50px">답변 여부</th>
				<th width= "50px">작성일</th>
				<th width= "50px"></th>
			</tr>
			<c:forEach var="qna" items="${myboardList}" varStatus="status">
				<tr>
					<td>${qna.qseq }</td>
					<td class="dropTitle">
						<details>
    						<summary>${qna.title }</summary>
    						<p>${qna.qnacontent }</p>
						</details>
					</td>
					<td>
						<c:choose>
							<c:when test="${empty qna.replycontent}">
								답변 중
							</c:when>
							<c:otherwise>
								<details>
	    							<summary>답변완료</summary>
	    							<p>${qna.replycontent }</p>
								</details>
							</c:otherwise> 
						</c:choose>
					</td>
					<td>
						<fmt:formatDate value="${qna.qna_date }" 
									type="date" pattern="yy.MM.dd"/>
					</td>
					<td>
						<form action="myQnaUpdateForm2" method="get">
							<input type="hidden" name="qseq" value="${qna.qseq }">
							<input type="submit" class="QnaButtonUD"	value="수정">
						</form>
						<form action="myQnaDelete" method="post">
							<input type="hidden" name="qseq" value="${qna.qseq }">
							<input type="submit" class="QnaButtonUD"	value="삭제">
						</form>	
					</td>
				</tr>
			</c:forEach>
		</table>
		<jsp:include page="../admin/paging/paging.jsp">
		    <jsp:param value="${paging.page}" name="page"/>
		    <jsp:param value="${paging.beginPage}" name="beginPage"/>
		    <jsp:param value="${paging.endPage}" name="endPage"/>
		    <jsp:param value="${paging.prev}" name="prev"/>
		    <jsp:param value="${paging.next}" name="next"/>
		    <jsp:param value="notice" name="command"/>
		</jsp:include>
</article>
<%@ include file="../include/headerfooter/footer.jsp" %>