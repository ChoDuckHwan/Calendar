<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset-utf-8"
	pageEncoding="utf-8"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-ｅquiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Home</title>
<p>Press Button</p>
<style type="text/css">
.menu1 {
	left: 10px;
	width: 150px;
	height: 30px;
	background-color: #D4F4FA;
	display: block;
	left: 10px;
}

.menu2 {
	border: 2px;
	width: 150px;
	height: 30px;
	background-color: #b0c4de;
	display: block;
}

.menu3 {
	border: 2px;
	left: 300px;
	width: 150px;
	height: 30px;
	background-color: #b0c4de;
	display: block;
}

.tablebackground {
	position: relative;
	width: 900px;
	height: 350px;
	background-color: #D4F4FA;
}

.table1 {

	display: block;
}

.table2 {
	
	display: none;
}

.table3 {

	display: none;
}
</style>
<script type="text/javascript">
	var table1change;
	var table2change;
	var table3change;
	var background;
	function table1click() {
		table1change = document.getElementById("tab1");
		table2change = document.getElementById("tab2");
		table3change = document.getElementById("tab3");
		background = document.getElementById("background");
		table1change.style.display = "block";
		table2change.style.display = "none";
		table3change.style.display = "none";
		background.style.height= "350px";
	}
	function table2click() {
		table1change = document.getElementById("tab1");
		table2change = document.getElementById("tab2");
		table3change = document.getElementById("tab3");
		background = document.getElementById("background");
		table1change.style.display = "none";
		table2change.style.display = "block";
		table3change.style.display = "none";
		background.style.height= "160px";
	}
	function table3click() {
		table1change = document.getElementById("tab1");
		table2change = document.getElementById("tab2");
		table3change = document.getElementById("tab3");
		table1change.style.display = "none";
		table2change.style.display = "none";
		table3change.style.display = "block";
		background.style.height= "160px";
	}
	function table4click() {
		table1change = document.getElementById("tab1");
		table2change = document.getElementById("tab2");
		table3change = document.getElementById("tab3");
		background = document.getElementById("background");
		table1change.style.display = "block";
		table2change.style.display = "block";
		table3change.style.display = "block";
		background.style.height= "560px";
	}
</script>
</head>
<body>
	<form>
		<input type="button" onclick='table1click()' value="calendars">
		<input type="button" onclick='table2click()' value="events">
		<input type="button" onclick='table3click()' value="events_Attentees">
		<input type="button" onclick='table4click()' value="printAll">
	</form>
	<div align="left" class="tablebackground" id="background">
	
			<table border="1" class="table1" id="tab1">
				<tr bgcolor="#DCDCDC">
					<td align="center" class="listtd"><c:out value="number" /></td>
					<td align="center" class="listtd"><c:out value="id" /></td>
					<td align="center" class="listtd"><c:out value="e-mail" /></td>
					<td align="center" class="listtd"><c:out value="name" /></td>
				</tr>
				<c:forEach var="calendar_users" items="${calendar_users}"
					varStatus="status">
					<tr>
						<td align="center" class="listtd"><c:out
								value="${status.count}" /></td>
						<td align="center" class="listtd"><c:out
								value="${calendar_users.id}" /></td>
						<td align="center" class="listtd"><c:out
								value="${calendar_users.email}" /></td>
						<td align="center" class="listtd"><c:out
								value="${calendar_users.name}" /></td>
					</tr>
				</c:forEach>
			</table>



			<table border="1" class="table2" id="tab2">
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
						<td align="center" class="listtd"><c:out value="${events.id}" /></td>
						<td align="center" class="listtd"><c:out
								value="${events.when.getTime()}" /></td>
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



			<table border="1" class="table3" id="tab3">
				<tr bgcolor="#DCDCDC">
					<td align="center" class="listtd"><c:out value="number" /></td>
					<td align="center" class="listtd"><c:out value="id" /></td>
					<td align="center" class="listtd"><c:out value="event_id" /></td>
					<td align="center" class="listtd"><c:out value="attendee" /></td>
				</tr>
				<c:forEach var="eventAttentees" items="${eventAttentees}"
					varStatus="status">
					<tr>
						<td align="center" class="listtd"><c:out
								value="${status.count}" /></td>
						<td align="center" class="listtd"><c:out
								value="${eventAttentees.id}" /></td>
						<td align="center" class="listtd"><c:out
								value="${eventAttentees.event.id}" /></td>
						<td align="center" class="listtd"><c:out
								value="${eventAttentees.attendee.id}" /></td>
					</tr>
				</c:forEach>
			</table>

	</div>
</body>
</html>
