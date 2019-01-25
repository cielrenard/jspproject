package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FileDAO {
		
	private Connection conn;
	
	public FileDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "bros";
			String dbPassword = "0711";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			System.out.println("FileDAO() 에러="+e);
			e.printStackTrace();
		}//FileDAO()
	}	
		
		public int upload(String fileName, String fileRealName) {
			String SQL = "INSERT INTO FILES VALUES (?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, fileName);
				pstmt.setString(2, fileRealName);
				return pstmt.executeUpdate();
			}catch(Exception e) {
				System.out.println("upload 에러="+e);
				e.printStackTrace();
			}
			return -1;
		}
	}
	
	


