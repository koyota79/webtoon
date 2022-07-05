<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/resources/inc/default_inc.jsp"></jsp:include>
<script type="text/javascript">

$( document ).ready(function() {
	
	 //var $form = $( "#buyItemForm" );
	 //var formData = $form.serialize();
	 $.ajax({ 
			type : "GET",
			url : "/buyItemList.json",
			//contentType: 'application/json; charset=utf-8',
			dataType : "json",
		    cache: false,
			data : {user_id : "test"},
			success : function(result) {
				console.log(result.DATA);
				var data = result.DATA;
			  // console.log(JSON.stringify(result.DATA));
				//window.loginFunc.callMethodName(JSON.stringify(result.DATA));
				if(data.length > 0){
					var v_list ="";
					for(var i=0;i < data.length;i++){
						
						v_list +="<li class='list-group-item'><img src='/resources/images/item/"+data[i].thumbnail+"' width='65' height='65'> "+data[i].item_title+" </li>";
					}
					$("#buyItemList").html(v_list);
				}
		     
		    },
			error :  function(err) {
		       console.log(err);
		       alert("오류");
		    }
		});	
});
</script>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매한 작품</title>
</head>
<body>
<form class="form-signin" name="buyItemForm" id="buyItemForm">
<input type="hidden" name="user_id" value="test">
<ul class="list-group">
<!--   <li class="list-group-item">
  	<img src="/resources/images/item/a.jpg" width="65" height="65"> first item
  </li>
  <li class="list-group-item">
  	<img src="/resources/images/item/b.jpg" width="65" height="65"> Second item
  </li>
  <li class="list-group-item">
    <img src="/resources/images/item/c.jpg" width="65" height="65"> Third item
  </li> -->
	<div id="buyItemList"></div>
</ul>

</form>
</body>
</html>