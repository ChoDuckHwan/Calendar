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
		<jsp:include page="./includes/header.jsp" />

		<div class="row">
		<div class='col-md-12'>
		<sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
				<table border="1" width="1000">
					<tr bgcolor="#DCDCDC">
						<td align="center" class="listtd"><c:out value="number" /></td>
						<td align="center" class="listtd"><c:out value="id" /></td>
						<td align="center" class="listtd"><c:out value="when" /></td>
						<td align="center" class="listtd"><c:out value="summary" /></td>
						<td align="center" class="listtd"><c:out value="description" /></td>
						<td align="center" class="listtd"><c:out value="owner" /></td>
						<td align="center" class="listtd"><c:out value="numLikes" /></td>
						<td align="center" class="listtd"><c:out value="eventLevel" /></td>
					</tr>
					<c:forEach var="events" items="${events}" varStatus="status">
						<tr>
							<td align="center" class="listtd"><c:out
									value="${status.count}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.id}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.when}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.summary}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.description}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.owner.id}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.numLikes}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.eventLevel}" /></td>
						</tr>
					</c:forEach>
				</table>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')">

		<table border="1" >
					<tr bgcolor="#DCDCDC">
						<td align="center" class="listtd"><c:out value="number" /></td>
						<td align="center" class="listtd"><c:out value="id" /></td>
						<td align="center" class="listtd"><c:out value="when" /></td>
						<td align="center" class="listtd"><c:out value="summary" /></td>
						<td align="center" class="listtd"><c:out value="description" /></td>
						<td align="center" class="listtd"><c:out value="owner" /></td>
						<td align="center" class="listtd"><c:out value="numLikes" /></td>
						<td align="center" class="listtd"><c:out value="eventLevel" /></td>
						<td align="center" class="listtd"><c:out value="JoinEvent" /></td>
						<td align="center" class="listtd"><c:out value="Good" /></td>
					</tr>
					<c:forEach var="events" items="${events}" varStatus="status">
						<tr>
							<td align="center" class="listtd"><c:out
									value="${status.count}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.id}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.when}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.summary}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.description}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.owner.id}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.numLikes}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.eventLevel}" /></td>
							<td align="center" class="listtd"><a class="btn btn-default" href="/calendar-dev/events/eventJoinSuccess?event_id=${events.id}">참여</a></td>
                     <td align="center" class="listtd"><a class="btn btn-default" href="/calendar-dev/events/eventLikeSuccess?event_id=${events.id}">추천</a></td>
						</tr>
					</c:forEach>
				</table>
		
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">

		<table border="1" >
					<tr bgcolor="#DCDCDC">
						<td align="center" class="listtd"><c:out value="number" /></td>
						<td align="center" class="listtd"><c:out value="id" /></td>
						<td align="center" class="listtd"><c:out value="when" /></td>
						<td align="center" class="listtd"><c:out value="summary" /></td>
						<td align="center" class="listtd"><c:out value="description" /></td>
						<td align="center" class="listtd"><c:out value="owner" /></td>
						<td align="center" class="listtd"><c:out value="numLikes" /></td>
						<td align="center" class="listtd"><c:out value="eventLevel" /></td>
						<td align="center" class="listtd"><c:out value="JoinEvent" /></td>
						<td align="center" class="listtd"><c:out value="Good" /></td>
						<td align="center" class="listtd"><c:out value="Delete" /></td>
					</tr>
					<c:forEach var="events" items="${events}" varStatus="status">
						<tr>
							<td align="center" class="listtd"><c:out
									value="${status.count}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.id}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.when}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.summary}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.description}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.owner.id}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.numLikes}" /></td>
							<td align="center" class="listtd"><c:out
									value="${events.eventLevel}" /></td>
									<td align="center" class="listtd"><a class="btn btn-default" href="/calendar-dev/events/eventJoinSuccess?event_id=${events.id}">참여하기</a></td>
                     <td align="center" class="listtd"><a class="btn btn-default" href="/calendar-dev/events/eventLikeSuccess?event_id=${events.id}">추천하기</a></td>
                     <td align="center" class="listtd"><a class="btn btn-default" href="/calendar-dev/events/eventDeleteSuccess?event_id=${events.id}">삭제하기</a></td>
						</tr>
					</c:forEach>
				</table>
		
		</sec:authorize>
	</div>
	</div>
		</div>
</body>
</html>