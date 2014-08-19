package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBAdd {
	
	public int addBooking (int fsID, int paymentID, int passengerID, int economy, int business, int first, int child) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "insert into booking (fsID,paymentID,passengerID,economy,business,first,child) values (?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setInt(1, fsID);
		pstmt.setInt(2, paymentID);
		pstmt.setInt(3, passengerID);
		pstmt.setInt(4, economy);
		pstmt.setInt(5, business);
		pstmt.setInt(6, first);
		pstmt.setInt(7, child);
		
		int rec = pstmt.executeUpdate();

		conn.close();
		return rec;
		
	}
	
	public int addPayment (String cardType, String cardNo, String cardExpiry, String CSC) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "insert into payment (cardType,cardNo,cardExpiry,CSC) values (?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
		
		pstmt.setString(1, cardType);
		pstmt.setString(2, cardNo);
		pstmt.setString(3, cardExpiry);
		pstmt.setString(4, CSC);
		
		pstmt.executeUpdate();
		ResultSet rs = pstmt.getGeneratedKeys();
		
		int key = 0;
		if (rs.next()) {
			key = rs.getInt(1);
		}
		
		conn.close();
		return key;
		
	}
	
	public int addPassenger (String title, String firstName, String lastName, String email, String phone) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "insert into passenger (title,firstName,lastName,email,phone) values (?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
		
		pstmt.setString(1, title);
		pstmt.setString(2, firstName);
		pstmt.setString(3, lastName);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		
		pstmt.executeUpdate();
		ResultSet rs = pstmt.getGeneratedKeys();
		
		int key = 0;
		if (rs.next()) {
			key = rs.getInt(1);
		}
		
		conn.close();
		return key;
		
	}
	
	public int addAircraft (String model, String flightNum, int economyCap, int businessCap, int firstCap, int totalCap, String economyImage, String businessImage, String firstImage) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "insert into aircraft (model,flightNum,economyCap,businessCap,firstCap,totalCap,economyImage,businessImage,firstImage) values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setString(1, model);
    	pstmt.setString(2, flightNum);
    	pstmt.setInt(3, economyCap);
    	pstmt.setInt(4, businessCap);
    	pstmt.setInt(5, firstCap);
    	pstmt.setInt(6, totalCap);
    	pstmt.setString(7, economyImage);
    	pstmt.setString(8, businessImage);
    	pstmt.setString(9, firstImage);
    	
    	int rec = pstmt.executeUpdate();
    	
    	conn.close();
    	return rec;
		
	}
	
	public int addFlightSchedule (int aircraftID, String depart, String departCode, String departCity, String departCountry, String departDate, String departTime, String arrive, String arriveCode, String arriveCity, String arriveCountry, String arriveDate, String arriveTime, Double economyCost, Double businessCost, Double firstCost, String flightTime) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "Insert into flightschedule " +
				"(aircraftID,depart,departCode,departCity,departCountry,departDate,departTime,arrive,arriveCode,arriveCity,arriveCountry,arriveDate,arriveTime,economyCost,businessCost,firstCost,flightTime) " + 
				" Values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setInt(1, aircraftID);
    	pstmt.setString(2, depart);
    	pstmt.setString(3, departCode);
    	pstmt.setString(4, departCity);
    	pstmt.setString(5, departCountry);
    	pstmt.setString(6, departDate);
    	pstmt.setString(7, departTime);
    	pstmt.setString(8, arrive);
    	pstmt.setString(9, arriveCode);
    	pstmt.setString(10, arriveCity);
    	pstmt.setString(11, arriveCountry);
    	pstmt.setString(12, arriveDate);
    	pstmt.setString(13, arriveTime);
    	pstmt.setDouble(14, economyCost);
    	pstmt.setDouble(15, businessCost);
    	pstmt.setDouble(16, firstCost);
    	pstmt.setString(17, flightTime);
    	
    	int rec = pstmt.executeUpdate();
    	
    	conn.close();
    	return rec;
		
	}

}
