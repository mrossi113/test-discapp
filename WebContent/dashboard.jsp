<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, discapp.* "%>

<html>
<head>
    <title>Player Dashboard</title>
</head>
<body>
    <jsp:useBean id = "dashboard" class="discapp.PlayerDashboard"/>
    <jsp:setProperty name="dashboard" property="playerString" value="cruoti@gmail.com"/>
    <p><jsp:getProperty name="dashboard" property="message"/></p>

    <h1>Courses</h1>
    <c:set var="rounds" value="${dashboard.playerRounds}"/>
    <c:forEach var="round" items="${rounds}">
        ${round.date}
        ${round.course_name}
        ${round.scores}
        <br>
    </c:forEach>

</body>
</html>
