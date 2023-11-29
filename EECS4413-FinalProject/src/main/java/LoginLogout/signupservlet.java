package LoginLogout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;


public class signupservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static boolean isAdmin=false;
  
    public signupservlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("home.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		String name =request.getParameter("name");
		
	
		
		validateSignUp signup = new validateSignUp();
		
	       response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
		try {
			if(signup.signUp(email, password, this, name)) {
		        HttpSession session = request.getSession();
		        session.setAttribute("isLoggedIn", true);
				System.out.println("signed up");
		    	response.getWriter().write("{\"success\": true, \"admin\": false}");
			}
			else {
				System.out.println("Account already exists");
				 response.getWriter().write("{\"success\": false, \"message\": \"Account already exists.\"}");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
		
		
	
	
	




}
