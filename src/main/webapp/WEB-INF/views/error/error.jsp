<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>

<article style="width: 100%;margin: 0 auto;border: 2px solid silver;min-height: 500px;">
	<h2 style="text-align: center;margin-bottom:0;">관리자에게 문의하세요</h2>
	<p style="text-align: right;margin: 0;padding: 0;font-size: 10px;text-decoration: underline;">010-1234-1234</p>
	<hr>
	<p style="text-align: center;">
		<small>에러 내용</small>
	</p>

	<hr>
	<pre>${error}</pre>
	
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>