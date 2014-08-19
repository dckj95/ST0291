package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
		
	public static Connection getConnection() throws Exception {
		
		// Step1: Load JDBC Driver
        Class.forName("com.mysql.jdbc.Driver");
        // Step 2: Define Connection URL
        String connURL = "jdbc:mysql://localhost/spairlines?user=root&password=password"; 
        // Step 3: Establish connection to URL
        Connection conn =  DriverManager.getConnection(connURL); 
        
        return conn;
        
	}

}