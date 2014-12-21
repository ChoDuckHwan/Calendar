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
		<c:if test="${ownerList.size() != 0}">
		<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
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
					<c:forEach var="ownerList" items="${ownerList}" varStatus="status">
						<tr>
							<td align="center" class="listtd"><c:out
									value="${status.count}" /></td>
							<td align="center" class="listtd"><c:out
									value="${ownerList.id}" /></td>
							<td align="center" class="listtd"><c:out
									value="${ownerList.when}" /></td>
							<td align="center" class="listtd"><c:out
									value="${ownerList.summary}" /></td>
							<td align="center" class="listtd"><c:out
									value="${ownerList.description}" /></td>
							<td align="center" class="listtd"><c:out
									value="${ownerList.owner.id}" /></td>
							<td align="center" class="listtd"><c:out
									value="${ownerList.numLikes}" /></td>
							<td align="center" class="listtd"><c:out
									value="${ownerList.eventLevel}" /></td>
						</tr>
					</c:forEach>
				</table>
		</sec:authorize>
		</c:if>
		<c:if test="${ownerList.size() == 0}">
		<div class="alert alert-danger">
        <p>생성한 이벤트가 없습니다.</p>
        </div>
        <p><a class="btn btn-primary btn-lg" href="/calendar-dev/events/createEvents/">이벤트 생성하기</a></p>
		</c:if>
	</div>
</body>
</html>