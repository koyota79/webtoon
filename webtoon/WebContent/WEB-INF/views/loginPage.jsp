<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 80px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		background:linear-gradient(to bottom right, #0098FF, #6BA8D1);
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
  
  </style>
<jsp:include page="/resources/inc/default_inc.jsp"></jsp:include>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- <script src="//code.jquery.com/jquery.min.js"></script> -->
<script type="text/javascript">
      $(document).ready(function(){
    
    		//$('#btnLogin').submit(function(event) {
    		$('#btnLogin').click(function(){
    			//alert("1111");
    			//window.fnTest.callMethodName("로그인 성공");
    			//return false;
    			  //event.preventDefault();
    			 
    			  // Get some values from elements on the page:
 
    			  // Send the data using post
    		/* 	  var posting = $.post( url, $( "#loginForm" ).serialize()  );
    			 
    			  // Put the results in a div
    			  posting.done(function( data ) {
    			     console.log(data);
    			  }).fail(function(err) {
    				 alert( "error" );
    			  }); */
    			  var $form = $( "#loginForm" );
    			  var formData = $form.serialize();
    				console.log(formData);
    			  $.ajax({ 
	 					type : "POST",
	 					url : "/loginProc.json",
	 					//contentType: 'application/json; charset=utf-8',
	 					dataType : "json",
	 					data : formData,
	 					success : function(result) {
	 						console.log(result);
	 					    if(result.DATA.retCode == "00"){
	 					    	alert(result.DATA.retMsg);
	 					    	 location.href = "/main.do";
	 					    }
	 						//window.loginFunc.callMethodName(JSON.stringify(result.DATA));
	 				     
	 				    },
	 					error :  function(err) {
	 				       console.log(err);
	 				       alert("오류");
	 				    }
					});
    		});
      });
</script>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
 
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:20px;">
			<h4 class="card-title text-center" style="color:#113366;">로그인 폼</h4>
		</div>
	  <div class="card-body">
      <form class="form-signin" name="loginForm" id="loginForm">
        <h6 class="form-signin-heading">로그인 정보를 입력하세요</h6>
        <label for="inputEmail" class="sr-only">Your ID</label>
        <input type="text" id="login_id" name="login_id" class="form-control" placeholder="Your ID" required autofocus><BR>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required><br>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 기억하기
          </label>
        </div>
        <div id="btnLogin" class="btn btn-lg btn-primary btn-block"return false;>로 그 인</div>
      </form>
      
		</div>
	</div>

	<div class="modal">
	</div>
    <!-- Optional JavaScript -->
    
  </body>
</html>