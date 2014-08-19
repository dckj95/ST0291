package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBSearch;
import model.Misc;

/**
 * Servlet implementation class Booking
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
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
		
			String triptype = request.getParameter("triptype");
			String cabinClass = request.getParameter("class");
			int adult = Integer.parseInt(request.getParameter("adult"));
			int child = Integer.parseInt(request.getParameter("child"));
			
			session.setAttribute("triptype", triptype);
			session.setAttribute("cabinClass", cabinClass);
			session.setAttribute("adult", adult);
			session.setAttribute("child", child);
			
			if (triptype.equals("return")) {
				
				int bookDepart = Integer.parseInt(request.getParameter("bookDepart"));
				int bookReturn = Integer.parseInt(request.getParameter("bookReturn"));
				
				session.setAttribute("bookDepart", DBSearch.singleFSSearch(bookDepart));
				session.setAttribute("bookReturn", DBSearch.singleFSSearch(bookReturn));
								
			} else {
				
				int bookDepart = Integer.parseInt(request.getParameter("bookDepart"));
				
				session.setAttribute("bookDepart", DBSearch.singleFSSearch(bookDepart));
				
			}
			
		} catch (Exception e) {
			System.out.println(Misc.getDate() + "Booking servlet - " + e);
		}
		
		response.sendRedirect("viewCart.jsp");
		
	}

}
