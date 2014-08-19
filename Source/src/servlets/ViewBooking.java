package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Booking;
import model.DBSearch;
import model.Misc;

/**
 * Servlet implementation class ViewBooking
 */
@WebServlet("/ViewBooking")
public class ViewBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewBooking() {
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
		
		try {
		
			String type = request.getParameter("fsFilter");
			String param = "";
			
			if (type.equals("fsFilter-flightNum")) {
				param = request.getParameter("flightNum");
			} else if (type.equals("fsFilter-departCode")) {
				param = request.getParameter("departCode");
			} else if (type.equals("fsFilter-arriveCode")) {
				param = request.getParameter("arriveCode");
			} 
			
			DBSearch search = new DBSearch();
			ArrayList<Booking> alBooking = search.bookingSearch(type, param);
			
			request.setAttribute("viewBooking", alBooking);
			
		} catch (Exception e) {
			System.out.println(Misc.getDate() + "View Booking servlet - " + e);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-viewBooking.jsp");
		rd.forward(request, response);
		
	}

}
