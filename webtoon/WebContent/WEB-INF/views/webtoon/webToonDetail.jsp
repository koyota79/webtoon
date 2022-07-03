<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/top.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/resources/inc/default_inc.jsp"></jsp:include>
<script type="text/javascript">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹툰보기</title>
</head>
<body>
<ul class="list-group"> 
	<li class="list-group-item webtoonView">
		<img src="/resources/images/item/${DATA.THUMBNAIL}" width="65" height="65"> 제목 : ${DATA.ITEM_TITLE}
		<div>
			${DATA.CONTENT}
		</div>
		<%-- ${DATA} --%>
	</li>
</ul>
</body>
</html>