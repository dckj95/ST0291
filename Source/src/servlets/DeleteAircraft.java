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
 * Servlet implementation class DeleteAircraft
 */
@WebServlet("/DeleteAircraft")
public class DeleteAircraft extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAircraft() {
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
			int aircraftID = Integer.parseInt(request.getParameter("aircraftID"));
			
			if (deleteOption.equals("yes")) {
				
				DBDelete delete = new DBDelete();
				int rec = delete.deleteAircraft(aircraftID);
				request.setAttribute("result", rec);
				
				RequestDispatcher rd = request.getRequestDispatcher("admin-deleteAircraftSubmit.jsp");
				rd.forward(request, response);
				
			} else {
				response.sendRedirect("admin-deleteAircraft.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(Misc.getDate() + "Delete Aircraft servlet - " + e);
		}
		
	}

}
