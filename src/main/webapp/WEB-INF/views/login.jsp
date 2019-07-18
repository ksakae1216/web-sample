<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Simple Form with Icons</title>
  <link rel="stylesheet" href="resources/style.css">
  
	<script type="text/javascript"> 
		function loginFocus() { 
			var element = document.getElementById("login"); 
			element.focus();
		}
	</script> 
</head>

<body onload='loginFocus()'>
  
  <fieldset>
    <h1>Login</h1>
    <form:form modelAttribute="loginForm">
		<div class="iconUser"></div>
		<form:input path="loginId" id="login" placeholder="Username"/>
		<div class="iconPassword"></div>
		<form:input path="password" type="password" placeholder="Password"/>
		<input type="submit" value="Enter">
    </form:form>
  </fieldset>
</body>

</html>