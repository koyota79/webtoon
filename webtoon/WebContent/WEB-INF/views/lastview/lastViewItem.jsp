<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/resources/inc/default_inc.jsp"></jsp:include>
<script type="text/javascript">

$( document ).ready(function() {
	
	
	//window.clickViewCallBack.callMethodName(JSON.stringify(result.DATA));
	
	$(".viewList").on('click', function(event){
	    event.stopPropagation();
	    event.stopImmediatePropagation();
	    var v_index = $(this).index();

	    console.log("::::v_index:::"+v_index);
		var v_param = {};
		v_param.retCode = "00";
		v_param.item_code = $("input[name='item_idx']").eq(v_index).val();
		window.clickViewCallBack.callMethodName(JSON.stringify(v_param));
    
	});
	

	
	
	 //var $form = $( "#buyItemForm" );
	 //var formData = $form.serialize();
	 /* 
	 $.ajax({ 
			type : "GET",
			url : "/lastViewItemList.json",
			//contentType: 'application/json; charset=utf-8',
			dataType : "json",
		    cache: false,
			data : {user_id : "test"},
			success : function(result) {
				console.log(result.DATA);
				var data = result.DATA;
				if(data.length > 0){
					var v_list ="";
					for(var i=0;i < data.length;i++){
						
						v_list +="<li class='list-group-item'><img src='/resources/images/item/"+data[i].thumbnail+"' width='65' height='65'> "+data[i].item_title+" </li>";
					}
					$("#lastViewItemList").html(v_list);
				}
		     
		    },
			error :  function(err) {
		       console.log(err);
		       alert("오류");
		    }
		});	 */
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>최근본 작품</title>
</head>
<body>
<form class="form-signin" name="listViewItemForm" id="listViewItemForm">
	<input type="hidden" name="user_id" value="test">
		<ul class="list-group">
			<c:forEach items="${viewList}" var="list">
				<li class="list-group-item viewList">
					<img src="/resources/images/item/${list.THUMBNAIL}" width="65" height="65"> ${list.ITEM_TITLE}
					<input type="hidden" name="item_idx" value="${list.ITEM_TITLE}">	
				</li>
			</c:forEach>
		</ul>
</form>
</body>
</html>