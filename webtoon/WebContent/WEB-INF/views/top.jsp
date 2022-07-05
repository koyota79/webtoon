<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.hyem.wt.VO.*"%>
<%
   request.setCharacterEncoding("UTF-8");
   //String v_loginYn =  request.getParameter("logout")==null?"N":request.getParameter("logout");   
   LoginVO lv = (LoginVO)session.getAttribute("SESSION");  
   if(lv != null){
		out.println("::로그인됨::::"+lv.getLogin_id());
   }else{
	   out.println(":::로그아웃  시켜야함::"); 
	   %>
	   <script>
	   		location.href = "/login.do";		  
	   </script>
	   <%	   
   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/resources/inc/default_inc.jsp"></jsp:include>
</head>
<body>
<p>
<div><a href="/main.do">메인</a></div>
<div class="top_menu">
	<ul class="nav justify-content-center">
	  <li class="nav-item">
	    <a class="nav-link active" href="#">웹툰</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">단행본</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">몽땅무</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">자유이용관</a>
	  </li> 
	</ul>
</div>
</body>
</html>