package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DBSearch {
	
	public static int getPassengerID(String title, String firstName, String lastName, String email, String phone) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "select passengerID from passenger where title=? and firstName=? and lastName=? and email=? and phone=?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setString(1, title);
		pstmt.setString(2, firstName);
		pstmt.setString(3, lastName);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		ResultSet rs = pstmt.executeQuery();
		
		int passengerID = 0;
		
		if (rs.next()) {
			passengerID = rs.getInt("passengerID");
		}
		
		conn.close();
		return passengerID;
		
	}
	
	public ArrayList<Route> getFlightRoute(String year) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "select fs.departCity, fs.departCountry, fs.arriveCity, fs.arriveCountry, count(b.bookingID) as count from flightschedule fs, booking b where year(departDate)=? and fs.fsID = b.fsID group by departCity, departCountry, arriveCity, arriveCountry order by count desc";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setString(1, year);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.isBeforeFirst()) {
			
			ArrayList<Route> alRoute = new ArrayList<Route>();
			
			while (rs.next()) {
				
				String departCity = rs.getString("departCity");
				String departCountry = rs.getString("departCountry");
				String arriveCity = rs.getString("arriveCity");
				String arriveCountry = rs.getString("arriveCountry");
				int count = rs.getInt("count");
				
				alRoute.add(new Route(departCity, departCountry, arriveCity, arriveCountry, count));
				
			}
			
			conn.close();
			return alRoute;
			
		} else {
			
			conn.close();
			return null;
			
		}
		
	}
	
	public static int generateAdminStats(String input) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		String sqlStr = "";
		ResultSet rs = null;
		int result = 0;
		
		if (input.equals("aircraft")) {
			
			sqlStr = "select aircraftID from aircraft";
			rs = stmt.executeQuery(sqlStr);
			
			while (rs.next()) {
				result++;
			}
			
		} else if (input.equals("flightschedule")) {
			
			sqlStr = "select fsID from flightschedule";
			rs = stmt.executeQuery(sqlStr);
			
			while (rs.next()) {
				result++;
			}
			
		} else if (input.equals("user")) {
			
			sqlStr = "select username from login";
			rs = stmt.executeQuery(sqlStr);
			
			while (rs.next()) {
				result++;
			}
			
		}
		
		conn.close();
		return result;
		
	}
	
	public static int generateUserStats(String username) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "select points from login where username=?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setString(1, username);
		ResultSet rs = pstmt.executeQuery();
		
		int points = 0;
		
		while (rs.next()) {
			points = rs.getInt("points");
		}
		
		conn.close();
		return points;
		
	}
	
	public static String generateFSChooser(String input) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		String sqlStr = "";
		ResultSet rs = null;
		String result = "";
		
		if (input.equals("model")) {
			
			sqlStr = "select distinct model from aircraft";
			rs = stmt.executeQuery(sqlStr);
			
			while (rs.next()) {
				String model = rs.getString("model");
				result += "<option value='" + model + "'>" + model + "</option>";
			}
			
		} else if (input.equals("departDate")) {
			
			sqlStr = "select distinct departDate from flightschedule order by departDate";
			rs = stmt.executeQuery(sqlStr);
			
			while (rs.next()) {
				String departDate = rs.getString("departDate");
				result += "<option value='" + departDate + "'>" + departDate + "</option>";
			}
			
		} else if (input.equals("departCode")) {
			
			sqlStr = "select distinct departCode,depart from flightschedule order by depart";
			rs = stmt.executeQuery(sqlStr);
			
			while (rs.next()) {
				String depart = rs.getString("depart");
				String departCode = rs.getString("departCode");
				result += "<option value='" + departCode + "'>" + depart + " (" + departCode + ")</option>";
			}
			
		} else if (input.equals("arriveCode")) {
			
			sqlStr = "select distinct arriveCode,arrive from flightschedule order by arrive";
			rs = stmt.executeQuery(sqlStr);
			
			while (rs.next()) {
				String arrive = rs.getString("arrive");
				String arriveCode = rs.getString("arriveCode");
				result += "<option value='" + arriveCode + "'>" + arrive + " (" + arriveCode + ")</option>";
			}
			
		} else if (input.equals("flightNum")) {
			
			sqlStr = "select distinct flightNum from aircraft";
			rs = stmt.executeQuery(sqlStr);
			
			while (rs.next()) {
				String flightNum = rs.getString("flightNum");
				result += "<option value='" + flightNum + "'>" + flightNum + "</option>";
			}
			
		}  else if (input.equals("year")) {
			
			sqlStr = "select distinct year(departDate) as year from flightschedule";
			rs = stmt.executeQuery(sqlStr);
			
			while (rs.next()) {
				String year = rs.getString("year");
				result += "<option value='" + year + "'>" + year + "</option>";
			}
			
		}
		
		conn.close();
		return result;
		
		
	}
	
	public static ArrayList<Aircraft> aircraftSearch() throws Exception {
		
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		String sqlStr = "select * from aircraft";
		ResultSet rs = stmt.executeQuery(sqlStr);
		
		if (rs.isBeforeFirst()) {
			
			ArrayList<Aircraft> search = new ArrayList<Aircraft>();
			
			while (rs.next()) {
				
				int aircraftID = rs.getInt("aircraftID");
				String model = rs.getString("model");
				String flightNum = rs.getString("flightNum");
				int economyCap = rs.getInt("economyCap");
				int businessCap = rs.getInt("businessCap");
				int firstCap = rs.getInt("firstCap");
				int totalCap = rs.getInt("totalCap");
				String economyImage = rs.getString("economyImage");
				String businessImage = rs.getString("businessImage");
				String firstImage = rs.getString("firstImage");
				
				search.add(new Aircraft(aircraftID, model, flightNum, economyCap, businessCap, firstCap, totalCap, economyImage, businessImage, firstImage));
				
			}
			
			conn.close();
			return search;
			
		} else {
			
			conn.close();
			return null;
			
		}
		
	}
	
	public static Aircraft singleAircraftSearch(int aircraftID) throws Exception {
		
		Connection conn = DBConnection.getConnection();

		String sqlStr = "select * from aircraft where aircraftID=?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setInt(1, aircraftID);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.isBeforeFirst()) {
			
			Aircraft a = null;
			
			while (rs.next()) {
				
				aircraftID = rs.getInt("aircraftID");
				String model = rs.getString("model");
				String flightNum = rs.getString("flightNum");
				int economyCap = rs.getInt("economyCap");
				int businessCap = rs.getInt("businessCap");
				int firstCap = rs.getInt("firstCap");
				int totalCap = rs.getInt("totalCap");
				String economyImage = rs.getString("economyImage");
				String businessImage = rs.getString("businessImage");
				String firstImage = rs.getString("firstImage");
				
				a = new Aircraft(aircraftID, model, flightNum, economyCap, businessCap, firstCap, totalCap, economyImage, businessImage, firstImage);
				
			}
			
			conn.close();
			return a;
			
		} else {
			
			conn.close();
			return null;
			
		}
		
	}
	
	public ArrayList<Booking> bookingSearch(String type, String param) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "";
		
		if (type.equals("fsFilter-flightNum")) {
			sqlStr = "select * from booking b, aircraft a, flightschedule fs, payment p, passenger pa where b.fsID = fs.fsID and fs.aircraftID = a.aircraftID and b.paymentID = p.paymentID and b.passengerID = pa.passengerID and a.flightNum=?";
		} else if (type.equals("fsFilter-departCode")) {
			sqlStr = "select * from booking b, flightschedule fs, payment p, passenger pa where b.fsID = fs.fsID and b.paymentID = p.paymentID and b.passengerID = pa.passengerID and fs.departCode=?";
		} else if (type.equals("fsFilter-arriveCode")) {
			sqlStr = "select * from booking b, flightschedule fs, payment p, passenger pa where b.fsID = fs.fsID and b.paymentID = p.paymentID and b.passengerID = pa.passengerID and fs.arriveCode=?";
		} else {
			sqlStr = "select * from booking b, flightschedule fs, payment p, passenger pa where b.fsID = fs.fsID and b.paymentID = p.paymentID and b.passengerID = pa.passengerID";
		}
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		if (type.equals("fsFilter-flightNum") || type.equals("fsFilter-departCode") || type.equals("fsFilter-arriveCode")) {
			pstmt.setString(1, param);
		}
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.isBeforeFirst()) {
			
			ArrayList<Booking> alBooking = new ArrayList<Booking>();
			
			while (rs.next()) {
				
				int bookingID = rs.getInt("bookingID");
				int fsID = rs.getInt("fsID");
				int paymentID = rs.getInt("paymentID");
				String custTitle = rs.getString("title");
				String custFirstName = rs.getString("firstName");
				String custLastName = rs.getString("lastName");
				String custEmail = rs.getString("email");
				String custPhone = rs.getString("phone");
				int economy = rs.getInt("economy");
				int business = rs.getInt("business");
				int first = rs.getInt("first");
				int child = rs.getInt("child");
				
				String depart = rs.getString("depart");
				String departCode = rs.getString("departCode");
				String departCity = rs.getString("departCity");
				String departCountry = rs.getString("departCountry");
				String arrive = rs.getString("arrive");
				String arriveCode = rs.getString("arriveCode");
				String arriveCity = rs.getString("arriveCity");
				String arriveCountry = rs.getString("arriveCountry");
				double economyCost = rs.getDouble("economyCost");
				double businessCost = rs.getDouble("businessCost");
				double firstCost = rs.getDouble("firstCost");
				
				String cardType = rs.getString("cardType");
				String cardNo = rs.getString("cardNo");
				String cardExpiry = rs.getString("cardExpiry");
				
				alBooking.add(new Booking(bookingID, fsID, paymentID, custTitle, custFirstName, custLastName, custEmail, custPhone, economy, business, first, child, depart, departCode, departCity, departCountry, arrive, arriveCode, arriveCity, arriveCountry, economyCost, businessCost, firstCost, cardType, cardNo, cardExpiry));
				
			}
			
			conn.close();
			return alBooking;
			
		} else {
			
			conn.close();
			return null;
			
		}
		
	}

	public static String airportSearch(String d) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		String sqlStr = "";
		String result = "";
		
		if (d.equals("depart")) {
			sqlStr = "select distinct departCode,depart,departCity,departCountry from flightschedule order by depart";
		} else if (d.equals("arrive")) {
			sqlStr = "select distinct arriveCode,arrive,arriveCity,arriveCountry from flightschedule order by arrive";
		}
		
		ResultSet rs = stmt.executeQuery(sqlStr);
		
		if (d.equals("depart")) {
			while (rs.next()) {
				String depart = rs.getString("depart");
				String departCode = rs.getString("departCode");
				String departCity = rs.getString("departCity");
				String departCountry = rs.getString("departCountry");
				result += "<option value='" + departCode + "'>" + depart + " (" + departCode + ") - " + departCity + ", " + departCountry + "</option>";
			}
		} else if (d.equals("arrive")) {
			while (rs.next()) {
				String arrive = rs.getString("arrive");
				String arriveCode = rs.getString("arriveCode");
				String arriveCity = rs.getString("arriveCity");
				String arriveCountry = rs.getString("arriveCountry");
				result += "<option value='" + arriveCode + "'>" + arrive + " (" + arriveCode + ") - " + arriveCity + ", " + arriveCountry + "</option>";
			}
		}
		
		return result;
		
	}
	
	@SuppressWarnings("resource")
	public int getEmptySeats(String cabinClass, int fsID, int cap) {
		
		int free = 0;
		
		try {
		
			Connection conn = DBConnection.getConnection();
			
			String sqlStr = "select * from booking b where b.fsID=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			
			pstmt.setInt(1, fsID);
			ResultSet rs = pstmt.executeQuery();
			
			// If there are bookings for the fsID
			if (rs.isBeforeFirst()) {
				
				if (cabinClass.equals("Economy")) {
					
					sqlStr = "select sum(economy) as sum from booking b where b.fsID=?";
					pstmt = conn.prepareStatement(sqlStr);
					
					pstmt.setInt(1, fsID);
					rs = pstmt.executeQuery();
					
					while (rs.next()) {
						int taken = rs.getInt("sum");
						free = cap - taken;
					}
										
				} else if (cabinClass.equals("Business")) {
					
					sqlStr = "select sum(business) as sum from booking b where b.fsID=?";
					pstmt = conn.prepareStatement(sqlStr);
					
					pstmt.setInt(1, fsID);
					rs = pstmt.executeQuery();
					
					while (rs.next()) {
						int taken = rs.getInt("sum");
						free = cap - taken;
					}
					
					
										
				} else if (cabinClass.equals("First")) {
					
					sqlStr = "select sum(first) as sum from booking b where b.fsID=?";
					pstmt = conn.prepareStatement(sqlStr);
					
					pstmt.setInt(1, fsID);
					rs = pstmt.executeQuery();
					
					while (rs.next()) {
						int taken = rs.getInt("sum");
						free = cap - taken;
					}
										
				} 
				
				conn.close();
				
			} else {
				free = cap;
			}
			
		} catch (Exception e) {
			System.out.println("getEmptySeats() - " + e);
		}
				
		return free;
		
	}

	public static ArrayList<FlightSchedule> FSFilterSearch(String type, String param) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "";
		
		if (type.equals("fsFilter-aircraftModel")) {
			sqlStr = "select * from flightschedule fs, aircraft a where fs.aircraftID = a.aircraftID and a.model=? order by fs.fsID";
		} else if (type.equals("fsFilter-departDate")) {
			sqlStr = "select * from flightschedule fs, aircraft a where fs.aircraftID = a.aircraftID and fs.departDate=? order by fs.fsID";
		} else if (type.equals("fsFilter-departCode")) {
			sqlStr = "select * from flightschedule fs, aircraft a where fs.aircraftID = a.aircraftID and fs.departCode=? order by fs.fsID";
		} else if (type.equals("fsFilter-arriveCode")) {
			sqlStr = "select * from flightschedule fs, aircraft a where fs.aircraftID = a.aircraftID and fs.arriveCode=? order by fs.fsID";
		} else {
			sqlStr = "select * from flightschedule fs, aircraft a where fs.aircraftID = a.aircraftID order by fs.fsID";
		} 
		
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		if (type.equals("fsFilter-aircraftModel") || type.equals("fsFilter-departDate") || type.equals("fsFilter-departCode") || type.equals("fsFilter-arriveCode")) {
			pstmt.setString(1, param);
		} 
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.isBeforeFirst()) {
			
			// Create ArrayList to return
			ArrayList<FlightSchedule> alFS = new ArrayList<FlightSchedule>();
			
			while (rs.next()) {
				
				// Getting each schedule's information
				int rs_fsID = rs.getInt("fs.fsID");
				int rs_aircraftID = rs.getInt("a.aircraftID");
				
				String rs_depart = rs.getString("fs.depart");
				String rs_departCode = rs.getString("fs.departCode");
				String rs_departCity = rs.getString("fs.departCity");
				String rs_departCountry = rs.getString("fs.departCountry");
				String rs_departDate = rs.getString("fs.departDate");
				String rs_departTime = rs.getString("fs.departTime");
				String rs_arrive = rs.getString("fs.arrive");
				String rs_arriveCode = rs.getString("fs.arriveCode");
				String rs_arriveCity = rs.getString("fs.arriveCity");
				String rs_arriveCountry = rs.getString("fs.arriveCountry");
				String rs_arriveDate = rs.getString("fs.arriveDate");
				String rs_arriveTime = rs.getString("fs.arriveTime");
				double rs_economyCost = rs.getDouble("fs.economyCost");
				double rs_businessCost = rs.getDouble("fs.businessCost");
				double rs_firstCost = rs.getDouble("fs.firstCost");
				String rs_flightTime = rs.getString("fs.flightTime");
				
				String rs_model = rs.getString("a.model");
				String rs_flightNum = rs.getString("a.flightNum");
				int rs_economyCap = rs.getInt("a.economyCap");
				int rs_businessCap = rs.getInt("a.businessCap");
				int rs_firstCap = rs.getInt("a.firstCap");
				int rs_totalCap = rs.getInt("a.totalCap");
				String rs_economyImage = rs.getString("a.economyImage");
				String rs_businessImage = rs.getString("a.businessImage");
				String rs_firstImage = rs.getString("a.firstImage");
				
				alFS.add(new FlightSchedule(rs_fsID, rs_aircraftID, rs_depart, rs_departCode, rs_departCity, rs_departCountry, rs_departDate, rs_departTime, rs_arrive, rs_arriveCode, rs_arriveCity, rs_arriveCountry, rs_arriveDate, rs_arriveTime, rs_economyCost, rs_businessCost, rs_firstCost, rs_flightTime, rs_model, rs_flightNum, rs_economyCap, rs_businessCap, rs_firstCap, rs_totalCap, rs_economyImage, rs_businessImage, rs_firstImage));
				
			}
			
			conn.close();
			return alFS;
			
		} else {
			
			conn.close();
			return null;
			
		}
		
	}
	
	public static FlightSchedule singleFSSearch(int fsID) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "select * from flightschedule fs, aircraft a where fs.aircraftID = a.aircraftID and fs.fsID=?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setInt(1, fsID);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.isBeforeFirst()) {
			
			FlightSchedule fs = null;
			
			while (rs.next()) {
			
				// Getting each schedule's information
				int rs_fsID = rs.getInt("fs.fsID");
				int rs_aircraftID = rs.getInt("a.aircraftID");
				
				String rs_depart = rs.getString("fs.depart");
				String rs_departCode = rs.getString("fs.departCode");
				String rs_departCity = rs.getString("fs.departCity");
				String rs_departCountry = rs.getString("fs.departCountry");
				String rs_departDate = rs.getString("fs.departDate");
				String rs_departTime = rs.getString("fs.departTime");
				String rs_arrive = rs.getString("fs.arrive");
				String rs_arriveCode = rs.getString("fs.arriveCode");
				String rs_arriveCity = rs.getString("fs.arriveCity");
				String rs_arriveCountry = rs.getString("fs.arriveCountry");
				String rs_arriveDate = rs.getString("fs.arriveDate");
				String rs_arriveTime = rs.getString("fs.arriveTime");
				double rs_economyCost = rs.getDouble("fs.economyCost");
				double rs_businessCost = rs.getDouble("fs.businessCost");
				double rs_firstCost = rs.getDouble("fs.firstCost");
				String rs_flightTime = rs.getString("fs.flightTime");
				
				String rs_model = rs.getString("a.model");
				String rs_flightNum = rs.getString("a.flightNum");
				int rs_economyCap = rs.getInt("a.economyCap");
				int rs_businessCap = rs.getInt("a.businessCap");
				int rs_firstCap = rs.getInt("a.firstCap");
				int rs_totalCap = rs.getInt("a.totalCap");
				String rs_economyImage = rs.getString("a.economyImage");
				String rs_businessImage = rs.getString("a.businessImage");
				String rs_firstImage = rs.getString("a.firstImage");
				
				fs = new FlightSchedule(rs_fsID, rs_aircraftID, rs_depart, rs_departCode, rs_departCity, rs_departCountry, rs_departDate, rs_departTime, rs_arrive, rs_arriveCode, rs_arriveCity, rs_arriveCountry, rs_arriveDate, rs_arriveTime, rs_economyCost, rs_businessCost, rs_firstCost, rs_flightTime, rs_model, rs_flightNum, rs_economyCap, rs_businessCap, rs_firstCap, rs_totalCap, rs_economyImage, rs_businessImage, rs_firstImage);
				
			}
			
			conn.close();
			return fs;
		
		} else {
			
			conn.close();
			return null;
			
		}
		
	}
	
	public ArrayList<FlightSchedule> directSearch(String depart, String arrive, String departDate, String cabinClass, int adult, int child) throws Exception {
		
		Connection conn = DBConnection.getConnection();

		String sqlStr = "select * " + 
				"from flightschedule fs, aircraft a " + 
				"where fs.aircraftID = a.aircraftID " + 
				"and fs.departDate=? " + 
				"and fs.departCode=? " +
				"and fs.arriveCode=? ";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setString(1, departDate);
		pstmt.setString(2, depart);
		pstmt.setString(3, arrive);
		ResultSet rs = pstmt.executeQuery();
		
		// If a flight is found
		if (rs.isBeforeFirst()) {
			
			// Create ArrayList to return
			ArrayList<FlightSchedule> search = new ArrayList<FlightSchedule>();
			
			if (cabinClass.equals("Economy")) {
				
				while (rs.next()) {
				
					int fsID = rs.getInt("fs.fsID");
					int economyCap = rs.getInt("a.economyCap");
					
					if (getEmptySeats("Economy", fsID, economyCap) > 0) {
						
						// Getting each schedule's information
						int rs_fsID = rs.getInt("fs.fsID");
						int rs_aircraftID = rs.getInt("a.aircraftID");
						
						String rs_depart = rs.getString("fs.depart");
						String rs_departCode = rs.getString("fs.departCode");
						String rs_departCity = rs.getString("fs.departCity");
						String rs_departCountry = rs.getString("fs.departCountry");
						String rs_departDate = rs.getString("fs.departDate");
						String rs_departTime = rs.getString("fs.departTime");
						String rs_arrive = rs.getString("fs.arrive");
						String rs_arriveCode = rs.getString("fs.arriveCode");
						String rs_arriveCity = rs.getString("fs.arriveCity");
						String rs_arriveCountry = rs.getString("fs.arriveCountry");
						String rs_arriveDate = rs.getString("fs.arriveDate");
						String rs_arriveTime = rs.getString("fs.arriveTime");
						double rs_economyCost = rs.getDouble("fs.economyCost");
						double rs_businessCost = rs.getDouble("fs.businessCost");
						double rs_firstCost = rs.getDouble("fs.firstCost");
						String rs_flightTime = rs.getString("fs.flightTime");
						
						String rs_model = rs.getString("a.model");
						String rs_flightNum = rs.getString("a.flightNum");
						int rs_economyCap = rs.getInt("a.economyCap");
						int rs_businessCap = rs.getInt("a.businessCap");
						int rs_firstCap = rs.getInt("a.firstCap");
						int rs_totalCap = rs.getInt("a.totalCap");
						String rs_economyImage = rs.getString("a.economyImage");
						String rs_businessImage = rs.getString("a.businessImage");
						String rs_firstImage = rs.getString("a.firstImage");
						
						search.add(new FlightSchedule(rs_fsID, rs_aircraftID, rs_depart, rs_departCode, rs_departCity, rs_departCountry, rs_departDate, rs_departTime, rs_arrive, rs_arriveCode, rs_arriveCity, rs_arriveCountry, rs_arriveDate, rs_arriveTime, rs_economyCost, rs_businessCost, rs_firstCost, rs_flightTime, rs_model, rs_flightNum, rs_economyCap, rs_businessCap, rs_firstCap, rs_totalCap, rs_economyImage, rs_businessImage, rs_firstImage));
						
					}
				
				}
				
			} else if (cabinClass.equals("Business")) {
				
				while (rs.next()) {
					
					int fsID = rs.getInt("fs.fsID");
					int businessCap = rs.getInt("a.businessCap");
					
					if (getEmptySeats("Business", fsID, businessCap) > 0) {
						
						// Getting each schedule's information
						int rs_fsID = rs.getInt("fs.fsID");
						int rs_aircraftID = rs.getInt("a.aircraftID");
						
						String rs_depart = rs.getString("fs.depart");
						String rs_departCode = rs.getString("fs.departCode");
						String rs_departCity = rs.getString("fs.departCity");
						String rs_departCountry = rs.getString("fs.departCountry");
						String rs_departDate = rs.getString("fs.departDate");
						String rs_departTime = rs.getString("fs.departTime");
						String rs_arrive = rs.getString("fs.arrive");
						String rs_arriveCode = rs.getString("fs.arriveCode");
						String rs_arriveCity = rs.getString("fs.arriveCity");
						String rs_arriveCountry = rs.getString("fs.arriveCountry");
						String rs_arriveDate = rs.getString("fs.arriveDate");
						String rs_arriveTime = rs.getString("fs.arriveTime");
						double rs_economyCost = rs.getDouble("fs.economyCost");
						double rs_businessCost = rs.getDouble("fs.businessCost");
						double rs_firstCost = rs.getDouble("fs.firstCost");
						String rs_flightTime = rs.getString("fs.flightTime");
						
						String rs_model = rs.getString("a.model");
						String rs_flightNum = rs.getString("a.flightNum");
						int rs_economyCap = rs.getInt("a.economyCap");
						int rs_businessCap = rs.getInt("a.businessCap");
						int rs_firstCap = rs.getInt("a.firstCap");
						int rs_totalCap = rs.getInt("a.totalCap");
						String rs_economyImage = rs.getString("a.economyImage");
						String rs_businessImage = rs.getString("a.businessImage");
						String rs_firstImage = rs.getString("a.firstImage");
						
						search.add(new FlightSchedule(rs_fsID, rs_aircraftID, rs_depart, rs_departCode, rs_departCity, rs_departCountry, rs_departDate, rs_departTime, rs_arrive, rs_arriveCode, rs_arriveCity, rs_arriveCountry, rs_arriveDate, rs_arriveTime, rs_economyCost, rs_businessCost, rs_firstCost, rs_flightTime, rs_model, rs_flightNum, rs_economyCap, rs_businessCap, rs_firstCap, rs_totalCap, rs_economyImage, rs_businessImage, rs_firstImage));
						
					}
				
				}
				
			} else if (cabinClass.equals("First")) {
				
				while (rs.next()) {
					
					int fsID = rs.getInt("fs.fsID");
					int firstCap = rs.getInt("a.firstCap");
					
					if (getEmptySeats("First", fsID, firstCap) > 0) {
						
						// Getting each schedule's information
						int rs_fsID = rs.getInt("fs.fsID");
						int rs_aircraftID = rs.getInt("a.aircraftID");
						
						String rs_depart = rs.getString("fs.depart");
						String rs_departCode = rs.getString("fs.departCode");
						String rs_departCity = rs.getString("fs.departCity");
						String rs_departCountry = rs.getString("fs.departCountry");
						String rs_departDate = rs.getString("fs.departDate");
						String rs_departTime = rs.getString("fs.departTime");
						String rs_arrive = rs.getString("fs.arrive");
						String rs_arriveCode = rs.getString("fs.arriveCode");
						String rs_arriveCity = rs.getString("fs.arriveCity");
						String rs_arriveCountry = rs.getString("fs.arriveCountry");
						String rs_arriveDate = rs.getString("fs.arriveDate");
						String rs_arriveTime = rs.getString("fs.arriveTime");
						double rs_economyCost = rs.getDouble("fs.economyCost");
						double rs_businessCost = rs.getDouble("fs.businessCost");
						double rs_firstCost = rs.getDouble("fs.firstCost");
						String rs_flightTime = rs.getString("fs.flightTime");
						
						String rs_model = rs.getString("a.model");
						String rs_flightNum = rs.getString("a.flightNum");
						int rs_economyCap = rs.getInt("a.economyCap");
						int rs_businessCap = rs.getInt("a.businessCap");
						int rs_firstCap = rs.getInt("a.firstCap");
						int rs_totalCap = rs.getInt("a.totalCap");
						String rs_economyImage = rs.getString("a.economyImage");
						String rs_businessImage = rs.getString("a.businessImage");
						String rs_firstImage = rs.getString("a.firstImage");
						
						search.add(new FlightSchedule(rs_fsID, rs_aircraftID, rs_depart, rs_departCode, rs_departCity, rs_departCountry, rs_departDate, rs_departTime, rs_arrive, rs_arriveCode, rs_arriveCity, rs_arriveCountry, rs_arriveDate, rs_arriveTime, rs_economyCost, rs_businessCost, rs_firstCost, rs_flightTime, rs_model, rs_flightNum, rs_economyCap, rs_businessCap, rs_firstCap, rs_totalCap, rs_economyImage, rs_businessImage, rs_firstImage));
						
					}
				
				}
				
			}
			
			conn.close();
			return search;
			
		} else { // Connecting flight
			
			sqlStr = "select * " + 
					"from flightschedule fs1, flightschedule fs2, aircraft a1, aircraft a2 " + 
					"where fs1.departCode=? " + 
					"and fs2.arriveCode=? " + 
					"and fs1.arriveCode = fs2.departCode " + 
					"and fs1.departDate=? " + 
					"and fs1.aircraftID = a1.aircraftID " + 
					"and fs2.aircraftID = a2.aircraftID ";
			pstmt = conn.prepareStatement(sqlStr);
			
			pstmt.setString(1, depart);
			pstmt.setString(2, arrive);
			pstmt.setString(3, departDate);
			rs = pstmt.executeQuery();
			
			if (rs.isBeforeFirst()) {
				
				// Create ArrayList to return
				ArrayList<FlightSchedule> search = new ArrayList<FlightSchedule>();
				
				if (cabinClass.equals("Economy")) {
					
					while (rs.next()) {
					
						int fsID = rs.getInt("fs1.fsID");
						int economyCap = rs.getInt("a1.economyCap");
						int CfsID = rs.getInt("fs2.fsID");
						int CeconomyCap = rs.getInt("a2.economyCap");
						
						if (getEmptySeats("Economy", fsID, economyCap) > 0 && getEmptySeats("Economy", CfsID, CeconomyCap) > 0) {
							
							// Getting each schedule's information
							// FS1 + A1 Retrieve
							int rs_fsID = rs.getInt("fs1.fsID");
							int rs_aircraftID = rs.getInt("a1.aircraftID");
							
							String rs_depart = rs.getString("fs1.depart");
							String rs_departCode = rs.getString("fs1.departCode");
							String rs_departCity = rs.getString("fs1.departCity");
							String rs_departCountry = rs.getString("fs1.departCountry");
							String rs_departDate = rs.getString("fs1.departDate");
							String rs_departTime = rs.getString("fs1.departTime");
							String rs_arrive = rs.getString("fs1.arrive");
							String rs_arriveCode = rs.getString("fs1.arriveCode");
							String rs_arriveCity = rs.getString("fs1.arriveCity");
							String rs_arriveCountry = rs.getString("fs1.arriveCountry");
							String rs_arriveDate = rs.getString("fs1.arriveDate");
							String rs_arriveTime = rs.getString("fs1.arriveTime");
							double rs_economyCost = rs.getDouble("fs1.economyCost");
							double rs_businessCost = rs.getDouble("fs1.businessCost");
							double rs_firstCost = rs.getDouble("fs1.firstCost");
							String rs_flightTime = rs.getString("fs1.flightTime");
							
							String rs_model = rs.getString("a1.model");
							String rs_flightNum = rs.getString("a1.flightNum");
							int rs_economyCap = rs.getInt("a1.economyCap");
							int rs_businessCap = rs.getInt("a1.businessCap");
							int rs_firstCap = rs.getInt("a1.firstCap");
							int rs_totalCap = rs.getInt("a1.totalCap");
							String rs_economyImage = rs.getString("a1.economyImage");
							String rs_businessImage = rs.getString("a1.businessImage");
							String rs_firstImage = rs.getString("a1.firstImage");
							
							// FS2 + A2 Retrieve
							int rs_CfsID = rs.getInt("fs2.fsID");
							int rs_CaircraftID = rs.getInt("a2.aircraftID");
							
							String rs_Cdepart = rs.getString("fs2.depart");
							String rs_CdepartCode = rs.getString("fs2.departCode");
							String rs_CdepartCity = rs.getString("fs2.departCity");
							String rs_CdepartCountry = rs.getString("fs2.departCountry");
							String rs_CdepartDate = rs.getString("fs2.departDate");
							String rs_CdepartTime = rs.getString("fs2.departTime");
							String rs_Carrive = rs.getString("fs2.arrive");
							String rs_CarriveCode = rs.getString("fs2.arriveCode");
							String rs_CarriveCity = rs.getString("fs2.arriveCity");
							String rs_CarriveCountry = rs.getString("fs2.arriveCountry");
							String rs_CarriveDate = rs.getString("fs2.arriveDate");
							String rs_CarriveTime = rs.getString("fs2.arriveTime");
							double rs_CeconomyCost = rs.getDouble("fs2.economyCost");
							double rs_CbusinessCost = rs.getDouble("fs2.businessCost");
							double rs_CfirstCost = rs.getDouble("fs2.firstCost");
							String rs_CflightTime = rs.getString("fs2.flightTime");
							
							String rs_Cmodel = rs.getString("a2.model");
							String rs_CflightNum = rs.getString("a2.flightNum");
							int rs_CeconomyCap = rs.getInt("a2.economyCap");
							int rs_CbusinessCap = rs.getInt("a2.businessCap");
							int rs_CfirstCap = rs.getInt("a2.firstCap");
							int rs_CtotalCap = rs.getInt("a2.totalCap");
							String rs_CeconomyImage = rs.getString("a2.economyImage");
							String rs_CbusinessImage = rs.getString("a2.businessImage");
							String rs_CfirstImage = rs.getString("a2.firstImage");
							
							search.add(new FlightSchedule(rs_fsID, rs_aircraftID, rs_depart, rs_departCode, rs_departCity, rs_departCountry, rs_departDate, rs_departTime, rs_arrive, rs_arriveCode, rs_arriveCity, rs_arriveCountry, rs_arriveDate, rs_arriveTime, rs_economyCost, rs_businessCost, rs_firstCost, rs_flightTime, rs_model, rs_flightNum, rs_economyCap, rs_businessCap, rs_firstCap, rs_totalCap, rs_economyImage, rs_businessImage, rs_firstImage));
							search.add(new FlightSchedule(rs_CfsID, rs_CaircraftID, rs_Cdepart, rs_CdepartCode, rs_CdepartCity, rs_CdepartCountry, rs_CdepartDate, rs_CdepartTime, rs_Carrive, rs_CarriveCode, rs_CarriveCity, rs_CarriveCountry, rs_CarriveDate, rs_CarriveTime, rs_CeconomyCost, rs_CbusinessCost, rs_CfirstCost, rs_CflightTime, rs_Cmodel, rs_CflightNum, rs_CeconomyCap, rs_CbusinessCap, rs_CfirstCap, rs_CtotalCap, rs_CeconomyImage, rs_CbusinessImage, rs_CfirstImage));
							
						}
					
					}
					
				} else if (cabinClass.equals("Business")) {
					
					while (rs.next()) {
					
						int fsID = rs.getInt("fs1.fsID");
						int businessCap = rs.getInt("a1.businessCap");
						int CfsID = rs.getInt("fs2.fsID");
						int CbusinessCap = rs.getInt("a2.businessCap");
						
						if (getEmptySeats("Business", fsID, businessCap) > 0 && getEmptySeats("Business", CfsID, CbusinessCap) > 0) {
							
							// Getting each schedule's information
							// FS1 + A1 Retrieve
							int rs_fsID = rs.getInt("fs1.fsID");
							int rs_aircraftID = rs.getInt("a1.aircraftID");
							
							String rs_depart = rs.getString("fs1.depart");
							String rs_departCode = rs.getString("fs1.departCode");
							String rs_departCity = rs.getString("fs1.departCity");
							String rs_departCountry = rs.getString("fs1.departCountry");
							String rs_departDate = rs.getString("fs1.departDate");
							String rs_departTime = rs.getString("fs1.departTime");
							String rs_arrive = rs.getString("fs1.arrive");
							String rs_arriveCode = rs.getString("fs1.arriveCode");
							String rs_arriveCity = rs.getString("fs1.arriveCity");
							String rs_arriveCountry = rs.getString("fs1.arriveCountry");
							String rs_arriveDate = rs.getString("fs1.arriveDate");
							String rs_arriveTime = rs.getString("fs1.arriveTime");
							double rs_economyCost = rs.getDouble("fs1.economyCost");
							double rs_businessCost = rs.getDouble("fs1.businessCost");
							double rs_firstCost = rs.getDouble("fs1.firstCost");
							String rs_flightTime = rs.getString("fs1.flightTime");
							
							String rs_model = rs.getString("a1.model");
							String rs_flightNum = rs.getString("a1.flightNum");
							int rs_economyCap = rs.getInt("a1.economyCap");
							int rs_businessCap = rs.getInt("a1.businessCap");
							int rs_firstCap = rs.getInt("a1.firstCap");
							int rs_totalCap = rs.getInt("a1.totalCap");
							String rs_economyImage = rs.getString("a1.economyImage");
							String rs_businessImage = rs.getString("a1.businessImage");
							String rs_firstImage = rs.getString("a1.firstImage");
							
							// FS2 + A2 Retrieve
							int rs_CfsID = rs.getInt("fs2.fsID");
							int rs_CaircraftID = rs.getInt("a2.aircraftID");
							
							String rs_Cdepart = rs.getString("fs2.depart");
							String rs_CdepartCode = rs.getString("fs2.departCode");
							String rs_CdepartCity = rs.getString("fs2.departCity");
							String rs_CdepartCountry = rs.getString("fs2.departCountry");
							String rs_CdepartDate = rs.getString("fs2.departDate");
							String rs_CdepartTime = rs.getString("fs2.departTime");
							String rs_Carrive = rs.getString("fs2.arrive");
							String rs_CarriveCode = rs.getString("fs2.arriveCode");
							String rs_CarriveCity = rs.getString("fs2.arriveCity");
							String rs_CarriveCountry = rs.getString("fs2.arriveCountry");
							String rs_CarriveDate = rs.getString("fs2.arriveDate");
							String rs_CarriveTime = rs.getString("fs2.arriveTime");
							double rs_CeconomyCost = rs.getDouble("fs2.economyCost");
							double rs_CbusinessCost = rs.getDouble("fs2.businessCost");
							double rs_CfirstCost = rs.getDouble("fs2.firstCost");
							String rs_CflightTime = rs.getString("fs2.flightTime");
							
							String rs_Cmodel = rs.getString("a2.model");
							String rs_CflightNum = rs.getString("a2.flightNum");
							int rs_CeconomyCap = rs.getInt("a2.economyCap");
							int rs_CbusinessCap = rs.getInt("a2.businessCap");
							int rs_CfirstCap = rs.getInt("a2.firstCap");
							int rs_CtotalCap = rs.getInt("a2.totalCap");
							String rs_CeconomyImage = rs.getString("a2.economyImage");
							String rs_CbusinessImage = rs.getString("a2.businessImage");
							String rs_CfirstImage = rs.getString("a2.firstImage");
							
							search.add(new FlightSchedule(rs_fsID, rs_aircraftID, rs_depart, rs_departCode, rs_departCity, rs_departCountry, rs_departDate, rs_departTime, rs_arrive, rs_arriveCode, rs_arriveCity, rs_arriveCountry, rs_arriveDate, rs_arriveTime, rs_economyCost, rs_businessCost, rs_firstCost, rs_flightTime, rs_model, rs_flightNum, rs_economyCap, rs_businessCap, rs_firstCap, rs_totalCap, rs_economyImage, rs_businessImage, rs_firstImage));
							search.add(new FlightSchedule(rs_CfsID, rs_CaircraftID, rs_Cdepart, rs_CdepartCode, rs_CdepartCity, rs_CdepartCountry, rs_CdepartDate, rs_CdepartTime, rs_Carrive, rs_CarriveCode, rs_CarriveCity, rs_CarriveCountry, rs_CarriveDate, rs_CarriveTime, rs_CeconomyCost, rs_CbusinessCost, rs_CfirstCost, rs_CflightTime, rs_Cmodel, rs_CflightNum, rs_CeconomyCap, rs_CbusinessCap, rs_CfirstCap, rs_CtotalCap, rs_CeconomyImage, rs_CbusinessImage, rs_CfirstImage));
							
						}
					
					}
					
				} else if (cabinClass.equals("First")) {
					
					while (rs.next()) {
					
						int fsID = rs.getInt("fs1.fsID");
						int firstCap = rs.getInt("a1.firstCap");
						int CfsID = rs.getInt("fs2.fsID");
						int CfirstCap = rs.getInt("a2.firstCap");
						
						if (getEmptySeats("First", fsID, firstCap) > 0 && getEmptySeats("First", CfsID, CfirstCap) > 0) {
							
							// Getting each schedule's information
							// FS1 + A1 Retrieve
							int rs_fsID = rs.getInt("fs1.fsID");
							int rs_aircraftID = rs.getInt("a1.aircraftID");
							
							String rs_depart = rs.getString("fs1.depart");
							String rs_departCode = rs.getString("fs1.departCode");
							String rs_departCity = rs.getString("fs1.departCity");
							String rs_departCountry = rs.getString("fs1.departCountry");
							String rs_departDate = rs.getString("fs1.departDate");
							String rs_departTime = rs.getString("fs1.departTime");
							String rs_arrive = rs.getString("fs1.arrive");
							String rs_arriveCode = rs.getString("fs1.arriveCode");
							String rs_arriveCity = rs.getString("fs1.arriveCity");
							String rs_arriveCountry = rs.getString("fs1.arriveCountry");
							String rs_arriveDate = rs.getString("fs1.arriveDate");
							String rs_arriveTime = rs.getString("fs1.arriveTime");
							double rs_economyCost = rs.getDouble("fs1.economyCost");
							double rs_businessCost = rs.getDouble("fs1.businessCost");
							double rs_firstCost = rs.getDouble("fs1.firstCost");
							String rs_flightTime = rs.getString("fs1.flightTime");
							
							String rs_model = rs.getString("a1.model");
							String rs_flightNum = rs.getString("a1.flightNum");
							int rs_economyCap = rs.getInt("a1.economyCap");
							int rs_businessCap = rs.getInt("a1.businessCap");
							int rs_firstCap = rs.getInt("a1.firstCap");
							int rs_totalCap = rs.getInt("a1.totalCap");
							String rs_economyImage = rs.getString("a1.economyImage");
							String rs_businessImage = rs.getString("a1.businessImage");
							String rs_firstImage = rs.getString("a1.firstImage");
							
							// FS2 + A2 Retrieve
							int rs_CfsID = rs.getInt("fs2.fsID");
							int rs_CaircraftID = rs.getInt("a2.aircraftID");
							
							String rs_Cdepart = rs.getString("fs2.depart");
							String rs_CdepartCode = rs.getString("fs2.departCode");
							String rs_CdepartCity = rs.getString("fs2.departCity");
							String rs_CdepartCountry = rs.getString("fs2.departCountry");
							String rs_CdepartDate = rs.getString("fs2.departDate");
							String rs_CdepartTime = rs.getString("fs2.departTime");
							String rs_Carrive = rs.getString("fs2.arrive");
							String rs_CarriveCode = rs.getString("fs2.arriveCode");
							String rs_CarriveCity = rs.getString("fs2.arriveCity");
							String rs_CarriveCountry = rs.getString("fs2.arriveCountry");
							String rs_CarriveDate = rs.getString("fs2.arriveDate");
							String rs_CarriveTime = rs.getString("fs2.arriveTime");
							double rs_CeconomyCost = rs.getDouble("fs2.economyCost");
							double rs_CbusinessCost = rs.getDouble("fs2.businessCost");
							double rs_CfirstCost = rs.getDouble("fs2.firstCost");
							String rs_CflightTime = rs.getString("fs2.flightTime");
							
							String rs_Cmodel = rs.getString("a2.model");
							String rs_CflightNum = rs.getString("a2.flightNum");
							int rs_CeconomyCap = rs.getInt("a2.economyCap");
							int rs_CbusinessCap = rs.getInt("a2.businessCap");
							int rs_CfirstCap = rs.getInt("a2.firstCap");
							int rs_CtotalCap = rs.getInt("a2.totalCap");
							String rs_CeconomyImage = rs.getString("a2.economyImage");
							String rs_CbusinessImage = rs.getString("a2.businessImage");
							String rs_CfirstImage = rs.getString("a2.firstImage");
							
							search.add(new FlightSchedule(rs_fsID, rs_aircraftID, rs_depart, rs_departCode, rs_departCity, rs_departCountry, rs_departDate, rs_departTime, rs_arrive, rs_arriveCode, rs_arriveCity, rs_arriveCountry, rs_arriveDate, rs_arriveTime, rs_economyCost, rs_businessCost, rs_firstCost, rs_flightTime, rs_model, rs_flightNum, rs_economyCap, rs_businessCap, rs_firstCap, rs_totalCap, rs_economyImage, rs_businessImage, rs_firstImage));
							search.add(new FlightSchedule(rs_CfsID, rs_CaircraftID, rs_Cdepart, rs_CdepartCode, rs_CdepartCity, rs_CdepartCountry, rs_CdepartDate, rs_CdepartTime, rs_Carrive, rs_CarriveCode, rs_CarriveCity, rs_CarriveCountry, rs_CarriveDate, rs_CarriveTime, rs_CeconomyCost, rs_CbusinessCost, rs_CfirstCost, rs_CflightTime, rs_Cmodel, rs_CflightNum, rs_CeconomyCap, rs_CbusinessCap, rs_CfirstCap, rs_CtotalCap, rs_CeconomyImage, rs_CbusinessImage, rs_CfirstImage));
							
						}
					
					}
					
				}
				
				conn.close();
				return search;
				
			} else { // No flights
				
				conn.close();
				return null;
				
			}
		
		}
		
	}

}