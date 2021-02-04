<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="include/headerfooter/header.jsp" %>

<div class="viewBox">
    <div class="recommendBox">
        <c:forEach var="bundle" items="${bundleList}" varStatus="status">
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
    </div>
</div>

<%@ include file="include/headerfooter/footer.jsp" %>