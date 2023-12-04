<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="adminNav.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Page</title>
    <link rel="stylesheet" type="text/css" href="styles/reports.css">
</head>
<body>
    
    <div class="container">
        <div class="card">
        <form action="UserReportServlet" method="post">
            <h3>User Report</h3>
            <p>This is the user report</p>
            <button type="submit">User Report</button>
        </div>
        </form>
        
        <div class="card">
        <form action="ApplicationReportServlet" method="post">
            <h3>Application Report</h3>
            <p>This is the application report</p>
            <button type="submit">Application Report</button>
        </div>
    </div>
</body>
</html>

