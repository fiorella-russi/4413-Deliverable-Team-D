package LoginLogout;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class logoutservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public logoutservlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        Cookie loginCookie = null;
        Cookie adminCookie = null;

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userLogin".equals(cookie.getName())) {
                    loginCookie = cookie;
                } else if ("isAdmin".equals(cookie.getName())) {
                    adminCookie = cookie;
                }
            }
        }

       
        if (loginCookie != null) {
            loginCookie.setValue("");
            loginCookie.setMaxAge(0); 
            loginCookie.setPath("/");
            response.addCookie(loginCookie); 
        }

        if (adminCookie != null) {
            adminCookie.setValue("");
            adminCookie.setMaxAge(0); 
            adminCookie.setPath("/");
            response.addCookie(adminCookie); 
        }


        if (request.getHeader("X-Postman-Test") != null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": true }");
            return;
        }
            response.sendRedirect("home.jsp");
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
