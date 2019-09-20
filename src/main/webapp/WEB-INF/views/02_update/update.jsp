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
    <form:input path="lesson1st" class="form-control mb-4" placeholder="Lesson1st"/>

    <!-- Lesson2nd -->
    <label>Lesson2nd</label>
    <form:input path="lesson2nd" class="form-control mb-4" placeholder="Lesson2nd"/>

    <!-- Subject -->
    <label>Subject</label>
    <select class="browser-default custom-select mb-4">
        <option value="" disabled>Choose option</option>
        <option value="1" selected>Feedback</option>
        <option value="2">Report a bug</option>
        <option value="3">Feature request</option>
        <option value="4">Feature request</option>
    </select>

    <!-- Message -->
    <div class="form-group">
        <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="3" placeholder="Message"></textarea>
    </div>

    <!-- Copy -->
    <div class="custom-control custom-checkbox mb-4">
        <input type="checkbox" class="custom-control-input" id="defaultContactFormCopy">
        <label class="custom-control-label" for="defaultContactFormCopy">Send me a copy of this message</label>
    </div>

    <!-- 更新 -->
    <form:button class="btn btn-info btn-block">更新</form:button>

	<form:hidden path="userId"/>
</form:form>
<!-- Default form contact -->
</body>

</html>