<%@ page contenttype="text/html; charset=UTF-8"%>
<%@ page import="discapp.* "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id ="dashboard" class="discapp.PlayerDashboard"/>
<jsp:setProperty name="dashboard" property="playerString" value="cruoti@gmail.com"/>

<html language="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

  <!--[if 1t IE 9]>
       <script src=files/html5shiv.js"></script>
  <![endif]-->

  <link rel = "stylesheet"
    type = "text/css"
    href = "DiscGolfScoringApp.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

  <!--JavaScript and Style for Graph-->
  <script src="DiscGolfScoringAppUtil.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>

  <title>Disc Golf Scoring App</title>

</head>

<body>
  <nav role="navigation" class="navbar navbar-inverse navbar-static-top">
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
        <li><a href="DiscGolfScoringApp.jsp">User Dashboard</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Links</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>
  </nav>

  <section>
    <div class="btn-group" role="group" aria-label="...">
      <input type="button" value="Add" onClick="javascript:window.location='DiscGolfScoringApp.jsp';">
    </div>
    <br></br>

    <div class="panel panel-primary">
      <!-- Default panel contents -->
      <div class="panel-heading">Recent Scores</div>

      <!-- Table -->
      <div class="table-responsive">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Date</th>
              <th>Course</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th>8</th>
              <th>9</th>
              <th>10</th>
              <th>11</th>
              <th>12</th>
              <th>13</th>
              <th>14</th>
              <th>15</th>
              <th>16</th>
              <th>17</th>
              <th>18</th>
              <th>Total</th>
            </tr>
          </thead>

          <tbody>
            <c:set var="rounds" value="${dashboard.recentPlayerRounds}"/>
            <c:forEach var="round" items="${rounds}">
              <tr>
                <td>${round.date}</td>
                <td>${round.course_name}</td>
                <c:forEach var="score" items="${round.scores}">
                  <td>${score}</td>
                </c:forEach>
                <td>${round.totalScore}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
    <br></br>

    <div class="panel panel-info">
      <!-- Default panel contents -->
      <div class="panel-heading">Course History</div>
      <div class="panel-body">
        <div class="dropdown">
          <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            Select Course
            <span class="caret"></span>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
            <c:forEach var="course_name" items="${dashboard.playedCourseNames}">
              <li><a href="#">${course_name}</a></li>
            </c:forEach>
            <%--<li><a href="#">Test Course 1</a></li>--%>
            <%--<li><a href="#">Test Course 2</a></li>--%>
            <%--<li><a href="#">Test Course 3</a></li>--%>
            <%--<li role="separator" class="divider"></li>--%>
            <%--<li><a href="#">Special Test Course if needed</a></li>--%>
          </ul>
        </div>
      </div>

      <div style="width:100%;">
        <canvas id="canvas"></canvas>
      </div>
      <br>
      <br>
      <!--<button id="randomizeData">Randomize Data</button>
      <button id="addDataset">Add Dataset</button>
      <button id="removeDataset">Remove Dataset</button>
      <button id="addData">Add Data</button>
      <button id="removeData">Remove Data</button>-->
      <c:set var="all_rounds" value="${dashboard.playerRounds}"/>

      <script>
        var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        var config = {
          type: 'line',
          data: {
            labels: [
              <c:forEach var="round" items="${dashboard.playerRounds}" varStatus="roundStatus">
                "<c:out value="${round.dateString}"/>"
                <c:if test="${!roundStatus.last}">
                  ,
                </c:if>
              </c:forEach>
            ],
            datasets: [{
            label: "Course",
            backgroundColor: window.chartColors.green,
            borderColor: window.chartColors.green,
            data: [
              <c:forEach var="round" items="${dashboard.playerRounds}" varStatus="roundStatus">
                <c:out value="${round.totalScore}"/>
                <c:if test="${!roundStatus.last}">
                  ,
                </c:if>
              </c:forEach>
            ],
            fill: false,
            },]
          },
          options: {
            responsive: true,
            title:{
              display:true,
              text:'Course X Chart'
            },
            tooltips: {
              mode: 'index',
              intersect: false,
            },
            hover: {
              mode: 'nearest',
              intersect: true
            },
            scales: {
              xAxes: [{
                display: true,
                scaleLabel: {
                  display: true,
                  labelString: 'Month'
                }
              }],
              yAxes: [{
                display: true,
                scaleLabel: {
                  display: true,
                  labelString: 'Score'
                }
              }]
            }
          }
        };

        window.onload = function() {
          var ctx = document.getElementById("canvas").getContext("2d");
          window.myLine = new Chart(ctx, config);
        };

        document.getElementById('randomizeData').addEventListener('click', function() {
          config.data.datasets.forEach(function(dataset) {
            dataset.data = dataset.data.map(function() {
              return randomScalingFactor();
            });
          });

          window.myLine.update();
        });

        var colorNames = Object.keys(window.chartColors);
        document.getElementById('addDataset').addEventListener('click', function() {
          var colorName = colorNames[config.data.datasets.length % colorNames.length];
          var newColor = window.chartColors[colorName];
          var newDataset = {
            label: 'Dataset ' + config.data.datasets.length,
            backgroundColor: newColor,
            borderColor: newColor,
            data: [],
            fill: false
          };

          for (var index = 0; index < config.data.labels.length; ++index) {
            newDataset.data.push(randomScalingFactor());
          }

          config.data.datasets.push(newDataset);
          window.myLine.update();
        });

        document.getElementById('addData').addEventListener('click', function() {
          if (config.data.datasets.length > 0) {
            var month = MONTHS[config.data.labels.length % MONTHS.length];
            config.data.labels.push(month);

            config.data.datasets.forEach(function(dataset) {
              dataset.data.push(randomScalingFactor());
            });

            window.myLine.update();
          }
        });

        document.getElementById('removeDataset').addEventListener('click', function() {
          config.data.datasets.splice(0, 1);
          window.myLine.update();
        });

        document.getElementById('removeData').addEventListener('click', function() {
          config.data.labels.splice(-1, 1); // remove the label first

          config.data.datasets.forEach(function(dataset, datasetIndex) {
            dataset.data.pop();
          });

          window.myLine.update();
        });
      </script>
    </div>

    <br></br>

    <div class="panel panel-danger">
      <!-- Default panel contents -->
      <div class="panel-heading">All Time Scores</div>

      <!-- Table -->
      <div class="table-responsive">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Date</th>
              <th>Course</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th>8</th>
              <th>9</th>
              <th>10</th>
              <th>11</th>
              <th>12</th>
              <th>13</th>
              <th>14</th>
              <th>15</th>
              <th>16</th>
              <th>17</th>
              <th>18</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            <c:set var="all_rounds" value="${dashboard.playerRounds}"/>
            <c:forEach var="round" items="${all_rounds}">
              <tr>
                <td>${round.date}</td>
                <td>${round.course_name}</td>
                <c:forEach var="score" items="${round.scores}">
                  <td>${score}</td>
                </c:forEach>
                <td>${round.totalScore}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </section>
</body>

</html>