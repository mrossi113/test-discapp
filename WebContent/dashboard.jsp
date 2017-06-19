<%@ page contenttype="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Player Dashboard</title>
</head>
<body>
    <jsp:useBean id ="dashboard" class="discapp.PlayerDashboard"/>
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
