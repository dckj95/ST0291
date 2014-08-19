package model;

import java.security.MessageDigest;
import java.sql.Timestamp;
import java.util.Date;

public class Misc {
	
	public static String imgLink() {
		
		String link = "images/aircrafts/";
		
		return link;
		
	}
	
	public static String getDate() {
		
		Date date = new Date();
		String ts = new Timestamp(date.getTime()).toString();
		return "[" + ts + "] ";
		
	}
	
	public static String toHash(String password) throws Exception {
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(password.getBytes());
        byte byteData[] = md.digest();
        
      	//convert the byte to hex format method 1
        StringBuffer passwordHash = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
        	passwordHash.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        
        return passwordHash.toString();
		
	}

}
