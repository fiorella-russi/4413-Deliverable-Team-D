package chatBot;



import jakarta.servlet.*;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


public class ChatBotServlet extends HttpServlet {
    private Map<String, String> chatBotAnswers;

    @Override
    public void init() {
 
        chatBotAnswers = new HashMap<>();
        chatBotAnswers.put("hi", 
        		"Hello, Welcome to e-Carmerce! If there is anything I could help you with type \"HELP\"! ");
        
        chatBotAnswers.put("hello", 
        		"Hello, Welcome to e-Carmerce! If there is anything I could help you with type \"HELP\"! ");
        
        chatBotAnswers.put("where can i find cars for sale?", 
        		"Please Naviagte to the Cars for Sale Tab!");
        
        chatBotAnswers.put("what is your name?", 
        		"We are e-Carmmerce");
        
        chatBotAnswers.put("do you have any sales?", 
        		"Please navigate to the Hot Deals tab to see our current sales!");
        
        chatBotAnswers.put("can i calculate my loan payments?", 
        		"Yes, please navigate to the Loan Calculator tab!");
        
        chatBotAnswers.put("what is in my cart?", 
        		"Please navigate to the Car tab to see the items that are currently in your car!");
        
        chatBotAnswers.put("how can i create an account?", 
        		"Please navigate to the Login tab and click on <strong>Sign Up!");
        
        chatBotAnswers.put("help", 
        		"Here is a list of predefined questions, let me know how I can help!"
        			+"<br><br>\"What is your name?\""
        			+"<br><br>\"Where can I find cars for sale?\""
        			+"<br><br>\"Do you have any sales?\""
        			+"<br><br>\"Can I calculate my loan payments?\""
        			+"<br><br>\"What is in my cart?\""
        			+"<br><br>\"How can I create an account?\"");
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userQuestion = request.getParameter("question").trim().toLowerCase();
        System.out.println(userQuestion);

   
        String botAnswer = chatBotAnswers.getOrDefault(userQuestion, "Sorry, I don't understand that question.");

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(botAnswer);
    }
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("home.jsp").forward(request, response);

	}
}