<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@page session="true"%>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request" />
<html lang="en">
<head>
<title>myCalendar: <c:out value="${pageTitle}" />
</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap-datetimepicker.css"
	rel="stylesheet" />
<link href="${resourceUrl}/css/custom.css" rel="stylesheet" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body class="header">
	<div class="container">
		<jsp:include page=".././includes/header.jsp" />
		
			<div class="alert alert-success" id="message">
				<p>이벤트를 생성하세요.</p>
			</div>
	
		<form:form action="createEventSuccess" method="post" commandName="eventForm">
		<div class="container row">
			<div class="row">
				<div class='col-md-6'>
				
					<div class="form-group">
						<div class='input-group date' id='datetimepicker1'>
						
							<form:input path="when" class="form-control"
								data-date-format="YYYY-MM-DD HH:mm:ss" placeholder="when" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
							
						</div>
					</div>
					<div class="row">
						<div class='col-md-12'>
							<form:input path="summary" class="form-control"	placeholder="summary" />
						</div>
					</div>
					<div class="row">
						<div class='col-md-12'>
							<form:input path="description" class="form-control" placeholder="description" />
						</div>
					</div>
					<div class="row">
						<div class='col-md-12'>
							<input type="submit" value="생성하기" />
						</div>
					</div>
					
				</div>
			</div>
		</div>
		</form:form>
		
		<jsp:include page=".././includes/footer.jsp" />
	</div>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/moment.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
$(function () {
    $('#datetimepicker1').datetimepicker({
  
        language: 'ko'
    });
});
</script>
</body>
</html>