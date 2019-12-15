<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>list</title>
    <link rel="stylesheet" href="/web/resources/style.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
	<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
	<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>	
	<script type="text/javascript">
 		$(document).ready(function ($) {
 			$.extend( $.fn.dataTable.defaults, {
 				language: {
 				url: "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Japanese.json"
 				}
			});
 			
			$('#dtDynamicVerticalScrollExample').DataTable({
				"scrollY": "260px",
				"scrollCollapse": true,
			});
			$('.dataTables_length').addClass('bs-select');
			
			const type = location.search;
			if(type.length != 0) {
				let message = '更新';
				const typeSplit = type.split('=');
				if(typeSplit[1] == 'delete') {
					message = '削除';
				} else if(typeSplit[1] == 'insert') {
					message = '登録';
				}
				toastr.options = {
						"positionClass": "toast-top-center",
						"timeOut": "2000"
				}
				toastr.success(message + 'が完了しました');
			}
		});
 	</script>
</head>

<body>
	<form:form modelAttribute="lessonList">

	<div class="container-fluid">
		<div class="row" style="padding-bottom: 10px;">
			<div class="col-md-11" style="padding: 0px;">
				<input type="submit" name="addRow" class="btn main-back-ground-color" value="新規登録"/>
			</div>
			<div class="col-md-1" style="padding: 0px;">
				<input type="submit" name="logout" class="btn btn-primary" value="ログアウト"/>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<table id="dtDynamicVerticalScrollExample" class="datatables table table-striped table-bordered table-sm">
				  <thead>
				    <tr>
				      <th class="th-sm" scope="col">ユーザーID</th>
				      <th class="th-sm" scope="col">名前</th>
				      <th class="th-sm" scope="col">苗字</th>
				      <th class="th-sm" scope="col">1stレッスン</th>
				      <th class="th-sm" scope="col">2ndレッスン</th>
				    </tr>
				  </thead>
				  <tbody>
					<c:forEach items="${lessonList}" var="lessonRow" varStatus="status">
				    <tr>
						<td><a href="/web/02_update/update/${lessonRow.userId}" target="_self">${lessonRow.userId}</a></td>
						<td>${lessonRow.userFirstName}</td>
						<td>${lessonRow.userLastName}</td>
						<td>${lessonRow.lesson1st}</td>
						<td>${lessonRow.lesson2nd}</td>
				    </tr>
					</c:forEach>
				  </tbody>
				</table>
			</div>
		</div>
	</div>
</form:form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>