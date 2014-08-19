package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DBModify {
	
	public int modifyAircraft (String imageEditCheck, String aircraftID, String model, String flightNum, int economyCap, int businessCap, int firstCap, int totalCap, String economyImage, String businessImage, String firstImage) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		String sqlStr = "";
		
		if (imageEditCheck.equals("yes")) {
    		sqlStr = "update aircraft set model=?,flightNum=?,economyCap=?,businessCap=?,firstCap=?,totalCap=?,economyImage=?,businessImage=?,firstImage=? where aircraftID='" + aircraftID + "'";
    	} else { 
    		sqlStr = "update aircraft set model=?,flightNum=?,economyCap=?,businessCap=?,firstCap=?,totalCap=? where aircraftID='" + aircraftID + "'";
    	}
		
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setString(1, model);
    	pstmt.setString(2, flightNum);
    	pstmt.setInt(3, economyCap);
    	pstmt.setInt(4, businessCap);
    	pstmt.setInt(5, firstCap);
    	pstmt.setInt(6, totalCap);
    	if (imageEditCheck.equals("yes")) {
	    	pstmt.setString(7, economyImage);
	    	pstmt.setString(8, businessImage);
	    	pstmt.setString(9, firstImage);
    	}
    	
    	int rec = pstmt.executeUpdate();
    	
    	conn.close();
    	return rec;
		
	}
	
	public int modifyFlightSchedule (int fsID, int aircraftID, String depart, String departCode, String departCity, String departCountry, String departDate, String departTime, String arrive, String arriveCode, String arriveCity, String arriveCountry, String arriveDate, String arriveTime, Double economyCost, Double businessCost, Double firstCost, String flightTime) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		String sqlStr = "update flightschedule " +
				"set aircraftID=?,depart=?,departCode=?,departCity=?,departCountry=?,departDate=?,departTime=?,arrive=?,arriveCode=?,arriveCity=?,arriveCountry=?,arriveDate=?,arriveTime=?,economyCost=?,businessCost=?,firstCost=?,flightTime=? " + 
				"where fsID=?";
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
    	pstmt.setInt(18, fsID);
    	
    	int rec = pstmt.executeUpdate();
    	
    	conn.close();
    	return rec;
		
	}

}
