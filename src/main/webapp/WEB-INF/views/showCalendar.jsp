<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request"/>
<html>
<head>
	<title>myCalendar: <c:out value="${pageTitle}"/> </title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>
    <link href="${resourceUrl}/css/custom.css" rel="stylesheet"/>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
</head>
<body class="header">
<div class="container">
<jsp:include page="./includes/header.jsp"/> 
</div>
<div class="container">
    <div id="calendar"></div>
    <%int sum=0; 
    String when[] = new String [sum];
 	int i=-1;
    %>
    <c:forEach var="events" items="${events}" varStatus="status">
    <%i++; %>
 
   	
     </c:forEach>

	
</div>
</body>
<script>
$.getScript('http://arshaw.com/js/fullcalendar-1.6.4/fullcalendar/fullcalendar.min.js',function(){
	  
	  var date = new Date();
	  var d = date.getDate();
	  var m = date.getMonth();
	  var y = date.getFullYear();
	  
	  $('#calendar').fullCalendar({
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'month,agendaWeek,agendaDay'
	    },
	    editable: true,
	    events: [
	      {
	        title: 'All Day Event',
	        start: new Date(y, m, 1)
	      },
	      {
	        title: 'Long Event',
	        start: new Date(y, m, d-5),
	        end: new Date(y, m, d-2)
	      },
	          
	    ]
	  });
	})
	</script>
</html>