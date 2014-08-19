package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUser;
import model.Misc;
import model.User;

/**
 * Servlet implementation class Authenticate
 */
@WebServlet("/Authenticate")
public class Authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Authenticate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		try {
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			String passwordHash = Misc.toHash(password);
	        
	        User u = new User(username, passwordHash);
			DBUser db = new DBUser();
			User authUser = db.authenticateUser(u);
			
			if (authUser != null) {
				System.out.println(Misc.getDate() + "Login successful - " + username);
				session.setAttribute("user", authUser);
				response.sendRedirect("Dashboard");
			} else {
				System.out.println(Misc.getDate() + "Login failed - " + username);
				response.sendRedirect("login.html");
			}
		
		} catch (Exception e) {
			System.out.println(Misc.getDate() + "Authenticate servlet - " + e);
		}
		
	}
	
}