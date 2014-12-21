<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request" />
<html>
<head>
<title>myCalendar: <c:out value="${pageTitle}" />
</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link href="${resourceUrl}/css/custom.css" rel="stylesheet" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body class="header">
	<div class="container">
		

		<div class="row">
		<div class='col-md-12'>
		<div class="alert alert-info" id="message">
		<p>유저정보 수정 완료</p>
		<p>수정된 정보로 로그인 해 주세요<p>
		</div>
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
			<form id="logoutForm" action="${logoutUrl}" method="post">
			</form>
		<<c:if test="${pageContext.request.userPrincipal.name != null}">
				<a id="signinLink"	href="javascript:formSubmit()"><span class="glyphicon glyphicon-saved"></span> 로그아웃</a>
			</c:if>
	</div>
	</div>
</div>
<script type="text/javascript">
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>
</body>
</html>