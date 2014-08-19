package model;

import java.sql.*;

public class DBUser {
	
	public static void addPoints(String username, int points) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "select points from login where username=?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setString(1, username);
		ResultSet rs = pstmt.executeQuery();
		
		int curPoints = 0;
		int newPoints;	
		
		while (rs.next()) {
			curPoints = rs.getInt("points");
		}
		
		newPoints = curPoints + points;
		
		sqlStr = "update login set points=? where username=?";
		pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setInt(1, newPoints);
		pstmt.setString(2, username);
		pstmt.executeUpdate();
		
	}
	
	public User authenticateUser(User u) throws Exception {
			
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "select * from login where username=? and password=?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setString(1, u.getUsername());
		pstmt.setString(2, u.getPassword());
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			
			String firstName = rs.getString("firstName");
			String lastName = rs.getString("lastName");
			String email = rs.getString("email");
			
			u.setFirstName(firstName);
			u.setLastName(lastName);
			u.setEmail(email);
			
			return u;
			
		} else {
			return null;
		}
		
	}
	
	public int addUser(String username, String password, String firstName, String lastName, String email) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sqlStr = "insert into login (username,password,firstName,lastName,email) values (?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		pstmt.setString(3, firstName);
		pstmt.setString(4, lastName);
		pstmt.setString(5, email);
		int rec = pstmt.executeUpdate();
		
		return rec;
		
	}

}
