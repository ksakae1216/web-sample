<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>update</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	$(function() {
/* 			$("input[name='userFirstName']").focus(function (){
				$("input[name='userFirstName']").addClass('bg-primary text-white');
			});
 */
 		$(document).ready(function ($) {
 			console.log('insertflg -> ' + $('input:hidden[name="insertFlg"]').val());
 			if($('input:hidden[name="insertFlg"]').val() == 'true') {
 				$('[name=submitButton]:input').text('新規登録');
 			}
 			
 		 	$(function() {
 	 		    $("select").change(function() {
 	 		    	getAsyncInformation(this);
 	 		    });
 	 		});

 	 		function getAsyncInformation(selectObj) {
 		    	let obj = $(selectObj).next("input");
 			    console.log($(selectObj).val());
 			    console.log(obj.val());

  		        $.ajax({
 		            type        : "GET",
 		            url         : "/web/02_update/update/getInformation",
 		            data        : {language: $(selectObj).val()},
 		            dataType    : "json",
 		            success     : function(data) {
 		                            success(data, obj);
 		                        },
 		            error       : function(XMLHttpRequest, textStatus, errorThrown) {
 		                            error(XMLHttpRequest, textStatus, errorThrown);
 		                        }
 		        });

  		 		// Ajax通信成功時処理
   		 		function success(data, obj) {
  		 		    //console.table(data);
  		 		    console.log(data.information);
  		 		    obj.val(data.information);
  		 		}
  		 		 
  		 		// Ajax通信失敗時処理
   		 		function error(XMLHttpRequest, textStatus, errorThrown) {
  		 			console.log("error:" + XMLHttpRequest);
  		 			console.log("status:" + textStatus);
  		 			console.log("errorThrown:" + errorThrown);
  		 		}

 	 		}

 		});

	});
	
	</script>
  
</head>

<body>  
	<!-- Default form contact -->
<form:form modelAttribute="lessonListForm" class="text-center border border-light p-5" action="#!">

	<p class="h4 mb-4 bg-info text-white rounded">userId: ${lessonListForm.userId}</p>

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
	<form:input path="information1st" class="form-control mb-4"/>

    <!-- Lesson2nd -->
    <label>Lesson2nd</label>
    <form:select path="lesson2nd" cssClass="browser-default custom-select mb-4">
   		<form:options items="${languageForm}" itemValue="language" itemLabel="language"/>
	</form:select>
	<form:input path="information2nd" class="form-control mb-4"/>

	<form:checkbox path="deleteFlg"/>
	<form:label path="">このIDを削除</form:label>

    <!-- 更新 -->
    <form:button name="submitButton" class="btn btn-info btn-block">更新</form:button>

	<form:hidden path="userId"/>
	<form:hidden path="insertFlg"/>
</form:form>
<!-- Default form contact -->
</body>

</html>