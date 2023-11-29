
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
 
    <link rel="stylesheet" type="text/css" href="styles/adminNav.css">
</head>
<body>

 
<div id="navbar">
        <div class="nav-container">
            <a href="home.jsp" class="nav-logo">E-CARMERCE</a>
            <ul class="nav-menu">
              <li><a href="admin.jsp">Home</a></li>
            <li><a href="reports.jsp">Reports</a></li>
            <li><a href="soldVehicle.jsp">Update Vehicles</a></li>
            <li><a href="logoutservlet">Logout</a></li>
                </ul>
            </div>
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




