package Controller.Consulting;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import Sql.ConsultingSql;
import Util.POOLUtil;

public class WriteProc implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		
		
		
		HttpSession session = req.getSession();
		String writer=(String)session.getAttribute("UID");
		
		
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = 
			ConsultingSql.getSQL(ConsultingSql.INSERT_ORIBOARD); 	
		System.out.println("sql="+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			
			stmt.setString(1, writer);
			stmt.setString(2, title);
			stmt.setString(3, body);
			
			
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("12="+e);
		}
		db.close(stmt);
		db.close(con);
		
		
		return "../VIEW/Consulting/WriteProc.jsp";
	}

}






