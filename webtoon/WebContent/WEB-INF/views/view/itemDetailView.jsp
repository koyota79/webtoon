<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/resources/inc/default_inc.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
</head>
<body>
<div class="container">
<form class="form-signin" name="itemDetailViewForm" id="itemDetailViewForm">
	<div>
		<span>
			<img src="/resources/images/item/a.jpg" width="65" height="65">
		</span>
		<span>
			<ul>
				<li>그림 박길동</li>
				<li>글 홍길동</li>
				<li>장르 |전체관람가</li>
			</ul>
		</span>
	</div>
	<div>
		<ul class="list-group">
			<c:forEach items="${itemDetailViewList}" var="list">
				<li class="list-group-item">
					<img src="/resources/images/item/${list.ITEM_IMG}" width="65" height="65"> ${list.ITEM_NM}
					<input type="hidden" name="item_idx" value="${list.ITEM_SEQ}">
					<input type="hidden" name="item_id"  value="${list.ID}">	
				</li>
			</c:forEach>
		</ul>
	</div>
</form>
</div>
</body>
</html>