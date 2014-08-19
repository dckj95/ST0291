package servlets;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBModify;
import model.Misc;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class ModifyAircraft
 */
@WebServlet("/ModifyAircraft")
public class ModifyAircraft extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyAircraft() {
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
			
			// Section 1 - Getting values + processing uploads
			FileItemFactory factory = new DiskFileItemFactory();
	
			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			// Parse the request
			List<FileItem> formEntries = upload.parseRequest(request);

			// Where to store the files
			String dir = System.getProperty("user.home") + "\\workspace\\SPAirlinesMVC\\WebContent\\images\\aircrafts\\";
			//String dir = System.getenv("OPENSHIFT_DATA_DIR") + "spairlinesmvc/images/aircrafts/";
			
			// Init
			String aircraftID = "";
			String model = "";
			String flightNum = "";
			int economyCap = 0;
			int businessCap = 0;
			int firstCap = 0;
			int totalCap = 0;
			String economyImage = "";
			String businessImage = "";
			String firstImage = "";
			String imageEditCheck = "";
		
			for(FileItem formEntry : formEntries) {
				if(formEntry.isFormField()) {
					if (formEntry.getFieldName().equals("imageEditCheck")) {
						imageEditCheck = formEntry.getString();
					} else if (formEntry.getFieldName().equals("aircraftID")) {
						aircraftID = formEntry.getString();
					} else if (formEntry.getFieldName().equals("model")) {
						model = formEntry.getString();
					} else if (formEntry.getFieldName().equals("flightNum")) {
						flightNum = formEntry.getString();
					} else if (formEntry.getFieldName().equals("economyCap")) {
						economyCap = Integer.parseInt(formEntry.getString());
					} else if (formEntry.getFieldName().equals("businessCap")) {
						businessCap = Integer.parseInt(formEntry.getString());
					} else if (formEntry.getFieldName().equals("firstCap")) {
						if (!formEntry.getString().equals("")) {
							firstCap = Integer.parseInt(formEntry.getString());
						}
					} 
				} else if (imageEditCheck.equals("yes")) {
					if (formEntry.getContentType().equals("image/jpeg") || formEntry.getContentType().equals("application/octet-stream")) {
						if (formEntry.getFieldName().equals("economyImage")) {
							economyImage = formEntry.getName();
							File writeFile = new File(dir + economyImage);
							formEntry.write(writeFile);
						} else if (formEntry.getFieldName().equals("businessImage")) {
							businessImage = formEntry.getName();
							File writeFile = new File(dir + businessImage);
							formEntry.write(writeFile);
						} else if (formEntry.getFieldName().equals("firstImage")) {
							if (formEntry.getSize() != 0) {
								firstImage = formEntry.getName();
								File writeFile = new File(dir + firstImage);
								formEntry.write(writeFile);
							}
						}
					} else {
						@SuppressWarnings("unused")
						int i = 1/0;
					}
				}
				totalCap = economyCap + businessCap + firstCap;
			}
			
			DBModify modify = new DBModify();
			int rec = modify.modifyAircraft(imageEditCheck, aircraftID, model, flightNum, economyCap, businessCap, firstCap, totalCap, economyImage, businessImage, firstImage);
						
			request.setAttribute("result", rec);
			
		} catch (Exception e) {
			System.out.println(Misc.getDate() + "Modify Aircraft servlet - " + e);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("admin-modifyAircraftSubmit.jsp");
		rd.forward(request, response);
		
	}

}
