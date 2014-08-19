package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBModify;
import model.Misc;

/**
 * Servlet implementation class ModifyFlightSchedule
 */
@WebServlet("/ModifyFlightSchedule")
public class ModifyFlightSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyFlightSchedule() {
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
		
			int fsID = Integer.parseInt(request.getParameter("fsID"));
			int aircraftID = Integer.parseInt(request.getParameter("aircraftID"));
			String depart = request.getParameter("depart");
			String departCode = request.getParameter("departCode");
			String departCity = request.getParameter("departCity");
			String departCountry = request.getParameter("departCountry");
			String departDate = request.getParameter("departDate");
			String departTime = request.getParameter("departTime");
			String arrive = request.getParameter("arrive");
			String arriveCode = request.getParameter("arriveCode");
			String arriveCity = request.getParameter("arriveCity");
			String arriveCountry = request.getParameter("arriveCountry");
			String arriveDate = request.getParameter("arriveDate");
			String arriveTime = request.getParameter("arriveTime");
			Double economyCost = Double.parseDouble(request.getParameter("economyCost"));
			Double businessCost = Double.parseDouble(request.getParameter("businessCost"));
			Double firstCost = 0.00;
			if (!request.getParameter("firstCost").equals("")) {
				firstCost = Double.parseDouble(request.getParameter("firstCost"));
			}
			String flightTime = request.getParameter("flightTime");
			
			DBModify modify = new DBModify();
			int rec = modify.modifyFlightSchedule(fsID, aircraftID, depart, departCode, departCity, departCountry, departDate, departTime, arrive, arriveCode, arriveCity, arriveCountry, arriveDate, arriveTime, economyCost, businessCost, firstCost, flightTime);
			
			request.setAttribute("result", rec);
			
		} catch (Exception e) {
			System.out.println(Misc.getDate() + "Modify Flight Schedule servlet - " + e);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-modifyFlightScheduleSubmit.jsp");
		rd.forward(request, response);
		
	}

}
