package LoginLogout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Cookie;

import java.io.IOException;

public class loginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public loginservlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.getRequestDispatcher("log-in.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleLogin(request, response);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        validateLogin vl = new validateLogin();
        boolean isLoggedIn = vl.login(email, password, this);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (isLoggedIn) {
            
            Cookie loginCookie = new Cookie("userLogin", "true");
            loginCookie.setMaxAge(30 * 60); 
            loginCookie.setPath("/");
            response.addCookie(loginCookie);

          
            boolean isAdmin = vl.getAdmin();
            Cookie adminCookie = new Cookie("isAdmin", String.valueOf(isAdmin));
            adminCookie.setMaxAge(30 * 60); 
            adminCookie.setPath("/");
            response.addCookie(adminCookie);

            String adminStatus = isAdmin ? "true" : "false";
            response.getWriter().write("{\"success\": true, \"admin\": " + adminStatus + "}");
        } else {
            response.getWriter().write("{\"success\": false, \"message\": \"Invalid email or password.\"}");
        }
    }
}
