package Util;

import java.sql.*;

/*
 * 이 클래스는 JDBC를 이용해서 데이터베이스를 처리할 때
 * 자주 사용하는 기능을 모아놓은 후
 * 필요한 기능을 제공하기위한 부품 클래스이다
 */
public class JDBCUtil {

	/* 누군가가 이 클래스를 new시켜도
	 *  JDBC를 로딩할 수 있도록 하기위함.
	 *  나중에 누군가가  JDBCUtil db = new JDBCUtil();
	 */
	public JDBCUtil() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("드라이버 로딩 에러="+e);
		}
	}
	
	//데이터베이스를 이용하기위해서는 접속을 해야하므로
	//접속을 대신해 줄 함수를 만들자
	// 커넥션이 필요하면  Connection con = db.getCon();
	public Connection getCon() {
		Connection con = null;
		try {
			String url    ="jdbc:oracle:thin:@localhost:1521:xe";
			String user ="bros";
			String pw   ="0711";
			con = DriverManager.getConnection(url,user,pw);
		}
		catch(Exception e) {
			System.out.println("커넥션 에러 ="+e);
		}
		return con;
	}
	
	/* 누군가가 Statement가 필요하면 대신 만들어주는 함수를 만들자
	 */
	public Statement getSTMT(Connection con) {
		Statement stmt = null;
		
		try {
			stmt = con.createStatement();
		} catch (Exception e) {
			System.out.println( "스테이트먼트 생성 에러 ="+e);
		}
		
		return stmt;
	}
	
	
	/* 누군가가 PreparedStatement가 필요하면 대신 만들어주는 함수를 만들자
	 */
	public PreparedStatement getSTMT(Connection con, String sql) {
		//매개변수의 역할
		//PreparedStatement를 만들기 위해서는 Connection이 필요하며,
		//PreparedStatement는 미리 질의 명령을 알려줘야하므로 질의명령이 필요
		
		PreparedStatement stmt = null;
		try {
			stmt = con.prepareStatement(sql);
		}
		catch(Exception e) {
			System.out.println("PreparedStatement 생성 에러="+e);
		}	
		return stmt;
	}
	
	// 누군가가 데이터베이스 작업이 끝나면 닫아주어야 한다
	// 이 작업도 간편하게하기위해서 닫는 기능도 제공하겠다
	public void close(Object obj) {
		// 매개변수의 역할
		// 이 함수가 닫아하는 객체를 받아오기 위해서 매개변수를 준비
		// 닫아야할 객체가 여러 개이므로 이들 모두를 한 번에 받을 수 있도록
		// 최상위 클래스를 이용해서 처리한다.
		try {
			if(obj instanceof  Connection) {
				Connection temp = (Connection)obj;
				temp.close();
			}
			else if(obj instanceof  Statement) {
				Statement temp = (Statement)obj;
				temp.close();
			}
			else if(obj instanceof  PreparedStatement) {
				PreparedStatement temp = (PreparedStatement)obj;
				temp.close();
			}
			else if(obj instanceof  ResultSet) {
				ResultSet temp = (ResultSet)obj;
				temp.close();
			}
		}
		catch(Exception e) {
			System.out.println("닫기 에러 = " + e);
		}
	}
	
}














