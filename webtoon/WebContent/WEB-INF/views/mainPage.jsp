<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.hyem.wt.VO.*"%>

<%
   request.setCharacterEncoding("UTF-8");
   String v_loginYn =  request.getParameter("logout")==null?"N":request.getParameter("logout");
   //if(session != null && v_loginYn.equals("N")){ //&& v_loginYn.equals("N")fff
	LoginVO lv = (LoginVO)session.getAttribute("SESSION");  
   if(lv != null){
		out.println("::로그인됨::::"+lv.getLogin_id());
   }else{
	   out.println(":::로그아웃  시켜야함::"); 
   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/resources/inc/default_inc.jsp"></jsp:include>
<!-- <script src="//code.jquery.com/jquery.min.js"></script> -->
<style>
.wt-title{
	font-size:  13px;
}
.wt-name{
	font-size:  11px;
	color:#8c8888
}
</style>
<script>
function fnGoPage(index){
	location.href = "/webToonDetail.do";
	//테이블 tb_item_m 이용해서 리스트 뿌리기
	
}
</script>

</head>
<body>
<div class="container">
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

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="/resources/images/item/main1.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/resources/images/item/main2.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/resources/images/item/main3.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div> <!-- 캐러셀 --> 

<div class="m-2"></div>
<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">연재</a>
    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">TOP100</a>
    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">완결</a>
    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">단행본</a>
  </div>
</nav>

<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
 	<div class="table-responsive">
 		<div class="m-1"></div>
 		<table class="table" border="1"> 
 			<tbody>
 				<tr> 
 					<td><a hreft="#none" onclick="fnGoPage(1);" style="cursor:pointer;"><img src="/resources/images/item/a1.jpg" class="img-rounded" alt="Cinque Terre" width="82" height="80"></a></td> 
 					<td><img src="/resources/images/item/a2.jpg" class="img-rounded" alt="Cinque Terre" width="82" height="80"></td> 
 					<td><img src="/resources/images/item/a3.jpg" class="img-rounded" alt="Cinque Terre" width="82" height="80"></td>
 					<td><img src="/resources/images/item/a4.jpg" class="img-rounded" alt="Cinque Terre" width="82" height="80"></td>
 					<td><img src="/resources/images/item/a5.jpg" class="img-rounded" alt="Cinque Terre" width="82" height="80"></td>
 				</tr> 
			</tbody>
		</table>

 	</div>
  		
	<!-- 		<div class="card m-1">
			  <img class="card-img-top" src="/images/box_img.jpg" alt="">
			  <div class="card-body">
			    <h5 class="card-title">신의탑</h5>
			    <p class="card-text">SIU</p>
			  </div>
			</div> -->
  </div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
  
</div> <!-- tab-content123 -->

<div>
	<div>오늘의 추천웹툰</div>
	<div class="table-responsive">
	  <table class="table">
	  	<tr>
			 <c:forEach items="${wtList}" var="list">
	  			<td class="todayWtList">
					<div>
						<img src="/resources/images/item/${list.THUMBNAIL}" class="img-rounded" alt="${list.ITEM_TITLE}" width="82" height="80">
						<input type="hidden" name="item_id" value="${list.ID}">
			
						<div class="wt-title">
							${list.ITEM_TITLE}
						</div>
						<div class="wt-name">
							백합
						</div>
					</div>
				</td>
			 </c:forEach>
		</tr>
	  </table>
	</div>
</div>

</div> <!-- container  -->
<script type="text/javascript">
$( document ).ready(function() {
	$('#myTab a').on('click', function (e) {
		  e.preventDefault()
		  $(this).tab('show')
	});
	$('#btnLogout').on('click', function (e) {
		
	});
	
	//$('.todayWtList').on('click', function (e) {
	$( ".todayWtList" ).click(function(event) {

	    event.stopPropagation();
	    event.stopImmediatePropagation();
	    var v_index = $(this).index();

	    console.log("::::v_index:::"+v_index);
		var v_param = {};
		v_param.retCode = "00";
		v_param.item_id = $("input[name='item_id']").eq(v_index).val();
		//window.clickViewCallBack.callMethodName(JSON.stringify(v_param));
	});
	
});
</script>
</body>
</html> 
