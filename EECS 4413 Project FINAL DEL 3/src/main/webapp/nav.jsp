<!DOCTYPE html>
<html>
<head>
 
 <link rel="stylesheet" type="text/css" href="styles/nav.css">
</head>
<body>

  <div id="navbar">
        <div class="nav-container">
            <a href="home.jsp" class="nav-logo">E-CARMERCE</a>
            <ul class="nav-menu">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="cars">Cars for Sale</a></li>
               
                <li><a href="saleproductsServlet">Hot Deals</a></li>
                 <li><a href="Pricing.jsp">Loan Calculator</a></li>
                <li><a href="Cart.jsp">Cart</a></li>
                <% 
                boolean isLoggedIn = false;
            		boolean isAdmin = false;
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if ("userLogin".equals(cookie.getName()) && "true".equals(cookie.getValue())) {
                            isLoggedIn = true;
                            break;
                        }
                    }
                }

                if (isLoggedIn) {
            %>
                    <li><a href="logoutservlet">Logout</a></li>
            <% 
                } else {
            %>
                    <li><a href="log-in.jsp">Login</a></li>
            <% 
                }
                %>
                </ul>
            </div>
        </div>
    </body>
    </html>
