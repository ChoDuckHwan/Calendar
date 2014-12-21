<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
		<jsp:include page="./includes/header.jsp" />


		<sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
				
			
				<table border="1" width="500">
				<tr bgcolor="#DCDCDC">
					<td align="center" class="listtd"><c:out value="number" /></td>
					<td align="center" class="listtd"><c:out value="id" /></td>
					<td align="center" class="listtd"><c:out value="e-mail" /></td>
					<td align="center" class="listtd"><c:out value="name" /></td>
				</tr>
				<c:forEach var="eventAttendees" items="${eventAttendees}"
					varStatus="status">
					<tr>
						<td align="center" class="listtd"><c:out
								value="${status.count}" /></td>
						<td align="center" class="listtd"><c:out
								value="${eventAttendees.attendee.id}" /></td>
						<td align="center" class="listtd"><c:out
								value="${eventAttendees.attendee.email}" /></td>
						<td align="center" class="listtd"><c:out
								value="${eventAttendees.attendee.name}" /></td>
					</tr>
				</c:forEach>
			</table>
			
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
		
		<table border="1" width="500">
				<tr bgcolor="#DCDCDC">
					<td align="center" class="listtd"><c:out value="number" /></td>
					<td align="center" class="listtd"><c:out value="id" /></td>
					<td align="center" class="listtd"><c:out value="e-mail" /></td>
					<td align="center" class="listtd"><c:out value="name" /></td>
				</tr>
				<c:forEach var="eventAttendees" items="${eventAttendees}"
					varStatus="status">
					<tr>
						<td align="center" class="listtd"><c:out
								value="${status.count}" /></td>
						<td align="center" class="listtd"><c:out
								value="${eventAttendees.attendee.id}" /></td>
						<td align="center" class="listtd"><c:out
								value="${eventAttendees.attendee.email}" /></td>
						<td align="center" class="listtd"><c:out
								value="${eventAttendees.attendee.name}" /></td>
					</tr>
				</c:forEach>
			</table>
		</sec:authorize>
	</div>
</body>
</html>