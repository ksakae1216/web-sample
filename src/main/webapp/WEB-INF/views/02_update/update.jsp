<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>update</title>
  <link rel="stylesheet" href="resources/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body>  
	<!-- Default form contact -->
<form:form modelAttribute="lessonListForm" class="text-center border border-light p-5" action="#!">

	<p class="h4 mb-4 bg-info text-white rounded">Update user: ${lessonListForm.userId}</p>

    <!-- FirstName -->
    <label>FirstName</label>
    <form:input path="userFirstName" class="form-control mb-4" placeholder="FirstName"/>

    <!-- LastName -->
    <label>LastName</label>
    <form:input path="userLastName" class="form-control mb-4" placeholder="LastName"/>

    <!-- Lesson1st -->
    <label>Lesson1st</label>
    <form:select path="lesson1st" cssClass="browser-default custom-select mb-4">
   		<form:options items="${languageForm}" itemValue="language" itemLabel="language"/>
	</form:select>

    <!-- Lesson2nd -->
    <label>Lesson2nd</label>
    <form:select path="lesson2nd" cssClass="browser-default custom-select mb-4">
   		<form:options items="${languageForm}" itemValue="language" itemLabel="language"/>
	</form:select>

	<form:checkbox path="deleteFlg"/>
	<form:label path="">このIDを削除</form:label>

    <!-- 更新 -->
    <form:button class="btn btn-info btn-block">更新</form:button>

	<form:hidden path="userId"/>
</form:form>
<!-- Default form contact -->
</body>

</html>