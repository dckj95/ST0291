package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DBDelete {
	
	public int deleteAircraft (int aircraftID) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		String sqlStr = "delete from aircraft where aircraftID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setInt(1, aircraftID);
    	
    	int rec = pstmt.executeUpdate();
    	
    	conn.close();
    	return rec;
		
	}
	
	public int deleteFlightSchedule (int fsID) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		String sqlStr = "delete from flightschedule where fsID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setInt(1, fsID);
    	
    	int rec = pstmt.executeUpdate();
    	
    	conn.close();
    	return rec;
		
	}

}
