<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Simple Form with Icons</title>
  <link rel="stylesheet" href="resources/style.css">
  <link href="resources/css/style.css" media="all" rel="stylesheet" type="text/css" />
    
	<script type="text/javascript"> 
		function loginFocus() { 
			var element = document.getElementById("login"); 
			element.focus();
		}
	</script> 
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script type="text/javascript">
	 		$(document).ready(function ($) {
	 			let msg = $('input:hidden[name="errorMessage"]').val();
	 			if(msg.length != 0) {
		 			$('input:hidden[name="errorMessage"]').after('<span class="errorMsg">' + msg + '</span>');
	 			}
			});
 	</script>
 	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>

<body onload='loginFocus()'>
    <nav id="gnav" class="fixed">
      <ul class="main-back-ground-color">
        <li><a href="#works"><span class="text-color">WORKS</span></a></li>
        <li><a href="#feature"><span class="text-color">FEATURE</span></a></li>
        <li><a href="#about"><span class="text-color">ABOUT</span></a></li>
        <li><a href="#skill"><span class="text-color">SKILL</span></a></li>
        <li><a href="#contact"><span class="text-color">CONTACT</span></a></li>
      </ul>
    </nav>
	<fieldset style="margin-top:100px;">
	  <h1>Login</h1>
	  <form:form modelAttribute="loginForm" cssClass="padding-add login-form">
	  	<div>
			<div class="iconUser"></div>
			<form:input path="loginId" id="login" placeholder="Username"/>
			<form:errors cssClass="errorMsg" path="loginId"/>
	  	</div>
	  	<div>
			<div class="iconPassword"></div>
			<form:input path="password" type="password" placeholder="Password"/>
			<form:errors cssClass="errorMsg" path="password"/>
	  	</div>
	<input type="submit" class="login-style" value="Enter">
	
	<form:hidden path="errorMessage"/>
	  </form:form>
	</fieldset>  
	
</body>

</html>