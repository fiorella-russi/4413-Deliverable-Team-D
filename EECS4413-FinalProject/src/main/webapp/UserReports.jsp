<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ include file="adminNav.jsp" %>

<%
 List<Map<String, Object>> myList = (List<Map<String, Object>>) request.getAttribute("UserReports"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Reports</title>
<link rel="stylesheet" type="text/css" href="styles/UserReports.css">
</head>
<body>
        
        <div class="container">
        <h1>User Reports</h1>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Number of Logins</th>
                </tr>
            </thead>
            <tbody>
                <% for (Map<String, Object> user : myList) { %>
                <tr>
                    <td><%= user.get("name") %></td>
                    <td><%= user.get("email") %></td>
                    <td><%= user.get("numVisits") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</body>
</html>
