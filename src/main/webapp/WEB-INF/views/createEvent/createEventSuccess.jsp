<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>
    <link href="${resourceUrl}/css/custom.css" rel="stylesheet"/>
<title>Registration Success</title>
</head>
<body>
    <div align="center">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>Create Event Succeeded!</h2></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <h3>Thank you for registering! Here's the review of your details:</h3>
                </td>
            </tr>
             <tr>
                <td>when:</td>
                <td>${eventForm.when}</td>
            </tr>
            <tr>
                <td>summary:</td>
                <td>${eventForm.summary}</td>
            </tr>
            <tr>
                <td>decription:</td>
                <td>${eventForm.description}</td>
            </tr>
            <tr>
                <td>owner:</td>
                <td>${eventForm.owner}</td>
            </tr>
            <tr>
                <td>numLikes:</td>
                <td>${eventForm.numLikes}</td>
            </tr>
            <tr>
                <td>eventLevel:</td>
                <td>${eventForm.eventLevel}</td>
            </tr>
        </table>
        <p><a class="btn btn-primary btn-lg" href="/calendar-dev/">메인 화면</a></p>
    </div>
    
</body>
</html>