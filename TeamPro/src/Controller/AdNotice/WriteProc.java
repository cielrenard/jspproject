package Controller.AdNotice;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import Sql.AdNoticeSql;
import Util.POOLUtil;

public class WriteProc implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("WriteProc컨트롤러");
		//할일
		//WriteForm.jsp name에서 파라미터 받고
		String title=req.getParameter("title");
		String body=req.getParameter("body");
		
		//부족한 데이터 글쓴이는 세션에서 받아서생산한다.
		HttpSession session = req.getSession();
		String writer = (String)session.getAttribute("UID");
		System.out.println("writer="+writer);
		
		//글등록 수행..db에서 insert.. 접속,스테이트먼트, 실행
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = AdNoticeSql.getSQL(AdNoticeSql.INSERT_ORIBOARD);	//쿼리문 준비
		System.out.println("sql="+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			//?채우자
			/*INSERT INTO 
									notice
			VALUES((SELECT 	NVL(MAX(no_No),0)+1 FROM notice),
									?,?,?,SYSDATE,0,?,'Y');
			 */
			stmt.setString(1, writer);
			stmt.setString(2, title);
			stmt.setString(3, body);
			
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("원글등록 질의 실행 에러"+e);
		}
		db.close(stmt);
		db.close(con);
		//모델
		
		//뷰
		return "../VIEW/AdNotice/WriteProc.jsp";
	}

}
