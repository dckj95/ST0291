package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBDelete;
import model.Misc;

/**
 * Servlet implementation class DeleteFlightSchedule
 */
@WebServlet("/DeleteFlightSchedule")
public class DeleteFlightSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFlightSchedule() {
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
			
			String deleteOption = request.getParameter("deleteOption");
			int fsID = Integer.parseInt(request.getParameter("fsID"));
			
			if (deleteOption.equals("yes")) {
				
				DBDelete delete = new DBDelete();
				int rec = delete.deleteFlightSchedule(fsID);
				request.setAttribute("result", rec);
				
				RequestDispatcher rd = request.getRequestDispatcher("admin-deleteFlightScheduleSubmit.jsp");
				rd.forward(request, response);
				
			} else {
				response.sendRedirect("admin-deleteFlightScheduleFilter.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(Misc.getDate() + "Delete Flight Schedule servlet - " + e);
		}
		
	}

}
