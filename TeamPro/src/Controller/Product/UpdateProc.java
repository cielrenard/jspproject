package Controller.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import Sql.ProductSql;
import Util.POOLUtil;

public class UpdateProc implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//할일
		//파라미터
		String sen = req.getParameter("sen");
		String pname = req.getParameter("pname");
		String ex = req.getParameter("ex");
		String ample = req.getParameter("ample");
		String price = req.getParameter("price");
		String id = req.getParameter("id");
		String cfile = req.getParameter("cfile");
		
		//부족한 데이터 글쓴이는 세션에서 받아서 생산한다
		HttpSession session = req.getSession();
		String writer = (String)session.getAttribute("UID");
		
		//비즈니스로직 수행 
		//글 등록 수행.. db에서 insert.. 접속,스테이트먼트,실행
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = ProductSql.getSQL(ProductSql.INSERT_ORIPRODUCT);
		System.out.println("sql="+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			//?채우자
			stmt.setString(1, sen);
			stmt.setString(2, pname);
			stmt.setString(3, ex);
			stmt.setString(4, ample);
			stmt.setString(5, price);
			stmt.setString(6, id);
			stmt.setString(7, cfile);
			
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("원글등록 질의문 실행 에러="+e);
		}
		db.close(stmt);
		db.close(con);
		
		//모델 
		
		//뷰
		return "../VIEW/Product/UpdateProc.jsp";
	}

}
