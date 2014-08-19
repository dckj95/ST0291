package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBSearch;
import model.FlightSchedule;
import model.Misc;

/**
 * Servlet implementation class SearchFlights
 */
@WebServlet("/SearchFlights")
public class SearchFlights extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchFlights() {
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
		
		// Get values
		String triptype = request.getParameter("triptype");
		String depart = request.getParameter("depart");
		String arrive = request.getParameter("arrive");
		String departDate = request.getParameter("departDate");
		String cabinClass = request.getParameter("class");
		int adult = Integer.parseInt(request.getParameter("adult"));
		int child = Integer.parseInt(request.getParameter("child"));
		String returnDate = null;
		
		// If return trip, get returnDate
		if (triptype.equals("return")) {
			returnDate = request.getParameter("returnDate");
		}
		
		DBSearch db = new DBSearch();
		ArrayList<FlightSchedule> search = null;
		ArrayList<FlightSchedule> Rsearch = null;
		
		try {
			
			if (triptype.equals("oneway")) {
				search = db.directSearch(depart, arrive, departDate, cabinClass, adult, child);
			} else {
				search = db.directSearch(depart, arrive, departDate, cabinClass, adult, child);
				Rsearch = db.directSearch(arrive, depart, returnDate, cabinClass, adult, child);
			}
			
			request.setAttribute("search", search);
			if (triptype.equals("return")) {
				request.setAttribute("Rsearch", Rsearch);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("searchFlights.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			System.out.println(Misc.getDate() + "Search Flights servlet - " + e);
		}
		
	}

}
