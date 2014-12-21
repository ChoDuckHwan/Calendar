<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap-datetimepicker.css" rel="stylesheet"/>    
    <link href="${resourceUrl}/css/custom.css" rel="stylesheet"/>
</head>
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
       	    <c:url var="welcomeUrl" value="/" />	
            <li><a id="navWelcomeLink" href="${welcomeUrl}"><span class="glyphicon glyphicon-home"></span> 홈</a></li>

           <!--   <c:url var="eventsUrl" value="/events/showAllevents" />
            <li><a id="navEventsLink" href="${eventsUrl}"><span class="glyphicon glyphicon-th-list"></span> 모든 이벤트 보기</a></li>
           -->
            <li class="dropdown" id="menu1">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-th-list"></span>모든 이벤트 보기 <b class="caret"></b></a>
        <ul class="dropdown-menu">
        <c:url var="eventsUrl" value="/events/showAllevents" />
          <li><a href="${eventsUrl}"><span class="glyphicon glyphicon-info-sign"></span>이벤트 정보 목록 보기</a></li>
          <c:url var="eventsUrl2" value="/events/showAttendeeUser" />
          <li><a href="${eventsUrl2}"><span class="glyphicon glyphicon-user"></span>현재 참여중인 유저의 정보 보기</a></li>
        </ul>
      </li>

           <!--  <c:url var="myEventsUrl" value="/events/myattendeeEvent" />
            <li><a id="navMyEventsLink" href="${myEventsUrl}"><span class="glyphicon glyphicon-ok-sign"></span> 나의 이벤트</a></li>
             -->
             <sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
        <li class="dropdown" id="menu2">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-ok-sign"></span>나의 이벤트 보기 <b class="caret"></b></a>
        <ul class="dropdown-menu">
        <c:url var="myEventsUrl" value="/users/signin" />
          <li><a id="navMyEventsLink" href="${myEventsUrl}"><span class="glyphicon glyphicon-cloud"></span>참여중인 이벤트 정보 보기</a></li>
          <c:url var="myEventsUrl2" value="/users/signin" />
          <li><a id="navMyEventsLink" href="${myEventsUrl2}"><span class="glyphicon glyphicon-edit"></span>생성한 이벤트 정보 보기</a></li>
        </ul>
      </li>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
	<li class="dropdown" id="menu2">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-ok-sign"></span>나의 이벤트 보기 <b class="caret"></b></a>
        <ul class="dropdown-menu">
        <c:url var="myEventsUrl" value="/events/myAttendeeEvent" />
          <li><a id="navMyEventsLink" href="${myEventsUrl}"><span class="glyphicon glyphicon-cloud"></span>참여중인 이벤트 정보 보기</a></li>
          <c:url var="myEventsUrl2" value="/events/myOwnerEvent" />
          <li><a id="navMyEventsLink" href="${myEventsUrl2}"><span class="glyphicon glyphicon-edit"></span>생성한 이벤트 정보 보기</a></li>
        </ul>
      </li>
	</sec:authorize>
            <c:url var="createEventUrl" value="/events/createEvents" />
            <li><a id="navCreateEventLink" href="${createEventUrl}"><span class="glyphicon glyphicon-new-window"></span> 이벤트 생성</a></li>
            
            <c:url var="signupUrl" value="/users/signup" />
            <li><a id="signupLink" href="${signupUrl}"><span class="glyphicon glyphicon-globe"></span> 회원 가입</a></li>
            
            <c:url var="signinUrl" value="/users/signin" />
            <li>
            <sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
            <a id="signinLink" href="${signinUrl}"><span class="glyphicon glyphicon-saved"></span> 로그인</a>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
			<c:url value="/j_spring_security_logout" var="logoutUrl" />
			<form id="logoutForm" action="${logoutUrl}" method="post">
			</form>

			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<a id="signinLink"	href="javascript:formSubmit()"><span class="glyphicon glyphicon-saved"></span> 로그아웃</a>
			</c:if>
			<li>
			<c:url var="updateUrl" value="/users/updateUser" />
			<a id="updateLink"	href="${updateUrl}"><span class="glyphicon glyphicon-pencil"></span>회원 정보 수정</a>
			</li>
			</sec:authorize>
            </li>
            
           </ul>

    </div>
  </div>
<script type="text/javascript" src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${resourceUrl}/javascript/moment.js"></script>
<script type="text/javascript" src="${resourceUrl}/javascript/bootstrap-datetimepicker.js"></script>
<script type="text/javascript">
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
		$(function () {
			$('.dropdown-toggle').dropdown();
		});
	</script>
</nav>