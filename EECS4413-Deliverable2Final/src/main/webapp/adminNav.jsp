
<%
    boolean isAdmin = false;
    boolean isLoggedIn = false;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("isAdmin".equals(cookie.getName()) && "true".equals(cookie.getValue())) {
                isAdmin = true;
            }
            if ("userLogin".equals(cookie.getName()) && "true".equals(cookie.getValue())) {
                isLoggedIn = true;
            }
        }
    }

    if (isAdmin) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Navbar</title>
    <link rel="stylesheet" type="text/css" href="styles/adminNav.css">
</head>
<body>

  <div id="navbar">
        <ul>
            <li><a href="admin.jsp">Home</a></li>
            <li><a href="reports.jsp">Reports</a></li>
            <li><a href="soldVehicle.jsp">Update Vehicles</a></li>
            <li><a href="logoutservlet">Logout</a></li>
        </ul>
    </div>
   

</body>
</html>
<%
    } else if (isLoggedIn) {
       
        response.sendRedirect("home.jsp");
    } else {
       
        request.getRequestDispatcher("log-in.jsp").forward(request, response);
    }
%>

