package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBAdd;
import model.DBSearch;
import model.DBUser;
import model.FlightSchedule;
import model.Misc;
import model.User;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout() {
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
		
		int checkoutStatus = 0;
		HttpSession session = request.getSession();
		
		try {
			
			if (session.getAttribute("bookDepart") == null) {
				@SuppressWarnings("unused")
				int i = 1/0;
			}
			
			// Get session data
			String triptype = (String) session.getAttribute("triptype");
			String cabinClass = (String) session.getAttribute("cabinClass");
			int adult = Integer.parseInt(session.getAttribute("adult").toString());
			int child = Integer.parseInt(session.getAttribute("child").toString());
			
			FlightSchedule bookDepart = (FlightSchedule) session.getAttribute("bookDepart");
			FlightSchedule bookReturn = null;
			if (triptype.equals("return")) {
				bookReturn = (FlightSchedule) session.getAttribute("bookReturn");
			}
			
			// Process payment
			String cardType = request.getParameter("cardType");
			String cardNo = request.getParameter("cardNo");
			String cardExpiryMonth = request.getParameter("cardExpiryMonth");
			String cardExpiryYear = request.getParameter("cardExpiryYear");
			String cardExpiry = cardExpiryMonth + "/" + cardExpiryYear;
			String CSC = request.getParameter("CSC");
			
			DBAdd dbAdd = new DBAdd();
			int paymentID = dbAdd.addPayment(cardType, cardNo, cardExpiry, CSC);
			
			int economy = 0;
			int business = 0;
			int first = 0;
			
			if (cabinClass.equals("Economy")) {
				economy = 1;
			} else if (cabinClass.equals("Business")) {
				business = 1;
			} else if (cabinClass.equals("First")) {
				first = 1;
			}
			
			int passengerID = 0;
			
			for (int i = 1; i <= adult; i++) {
				
				String adultTitle = request.getParameter("adult" + i + "Title");
				String adultFirstName = request.getParameter("adult" + i + "FirstName");
				String adultLastName = request.getParameter("adult" + i + "LastName");
				String adultEmail = request.getParameter("adult" + i + "Email");
				String adultPhone = request.getParameter("adult" + i + "Phone");
				
				if (DBSearch.getPassengerID(adultTitle, adultFirstName, adultLastName, adultEmail, adultPhone) != 0) {
					passengerID = DBSearch.getPassengerID(adultTitle, adultFirstName, adultLastName, adultEmail, adultPhone);
				} else {
					passengerID = dbAdd.addPassenger(adultTitle, adultFirstName, adultLastName, adultEmail, adultPhone);
				}
				
				dbAdd.addBooking(bookDepart.getFsID(), paymentID, passengerID, economy, business, first, 0);
				if (triptype.equals("return")) {
					dbAdd.addBooking(bookReturn.getFsID(), paymentID, passengerID, economy, business, first, 0);
				}
				
			}
			
			if (child > 0) {
				
				for (int i = 1; i <= child; i++) {
					
					String childTitle = request.getParameter("child" + i + "Title");
					String childFirstName = request.getParameter("child" + i + "FirstName");
					String childLastName = request.getParameter("child" + i + "LastName");
					String childEmail = request.getParameter("child" + i + "Email");
					String childPhone = request.getParameter("child" + i + "Phone");
					
					if (DBSearch.getPassengerID(childTitle, childFirstName, childLastName, childEmail, childPhone) != 0) {
						passengerID = DBSearch.getPassengerID(childTitle, childFirstName, childLastName, childEmail, childPhone);
					} else {
						passengerID = dbAdd.addPassenger(childTitle, childFirstName, childLastName, childEmail, childPhone);
					}
					
					dbAdd.addBooking(bookDepart.getFsID(), paymentID, passengerID, economy, business, first, 1);
					if (triptype.equals("return")) {
						dbAdd.addBooking(bookReturn.getFsID(), paymentID, passengerID, economy, business, first, 1);
					}
					
				}
				
			}
			
			// Points
			if (session.getAttribute("user") != null) {
				
				User u = (User)	session.getAttribute("user");
				String username = u.getUsername();
				
				double totalCost = Double.parseDouble(session.getAttribute("totalCost").toString());
				int points = (int) totalCost / 10;
				
				DBUser.addPoints(username, points);
				
			}
			
		} catch (Exception e) {
			
			System.out.println(Misc.getDate() + "Checkout servlet - " + e);
			e.printStackTrace();
			checkoutStatus = 1;
			
		}
		
		// Invalidate items in cart
		session.setAttribute("bookDepart", null);
		session.setAttribute("bookReturn", null);
		
		request.setAttribute("checkoutStatus", checkoutStatus);
		RequestDispatcher rd = request.getRequestDispatcher("checkoutSubmit.jsp");
		rd.forward(request, response);
		
	}

}
