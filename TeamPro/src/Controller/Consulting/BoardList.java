package Controller.Consulting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import Sql.ConsultingSql;
import Util.POOLUtil;
import Util.PageUtil;
import VO.ConsultingVO;

public class BoardList implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {


		String strPage = req.getParameter("nowPage");
		int nowPage = 0;
		if(strPage == null || strPage.length()==0) {

			nowPage = 1;
		}
		else {
			nowPage = Integer.parseInt(strPage);
		}



		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();



		String sql1 = ConsultingSql.getSQL(ConsultingSql.SELECT_TOTALCOUNT);
		System.out.println("sql1="+sql1);
		int totalCount = 0;

		PreparedStatement stmt1 = db.getSTMT(con,sql1);
		try {
			ResultSet rs1 = stmt1.executeQuery();
			rs1.next();
			totalCount = rs1.getInt("CNT");
			System.out.println("totalCount ="+totalCount);
			db.close(rs1);
		} catch (Exception e) {
			System.out.println("1234="+e);
		}
		PageUtil pinfo = 
				new PageUtil(nowPage,totalCount,3,3);

		//String sql = ReBoardSql.getSQL(1);
		String sql = ConsultingSql.getSQL(ConsultingSql.SELECT_BOARDLIST );
		System.out.println(sql);
		Statement  stmt = db.getSTMT(con);
		ArrayList<ConsultingVO>  list = new ArrayList<ConsultingVO>();
		try {
			ResultSet rs = stmt.executeQuery(sql);
			int skip = (pinfo.getNowPage()-1)*pinfo.getListCount();
			for(int i=0;i<skip ;i++) {
				rs.next();
			}


			for(int i=0;i<pinfo.getListCount() && rs.next();i++) {



				ConsultingVO vo = new ConsultingVO();
				vo.setNo(rs.getInt("NO"));
				vo.setWriter(rs.getString("WRITER"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setHit(rs.getInt("HIT"));
				vo.setWday(rs.getDate("WDAY"));
			
				//System.out.println(rs.getString("WRITER"));
				//System.out.println(rs.getInt("CNT"));


				list.add(vo);

			}

			db.close(rs);
		} catch (Exception e) {
			System.out.println("SELECT_BOARDLIST  ="+e);
		}

		db.close(stmt);
		db.close(con);
		req.setAttribute("LIST", list);
		req.setAttribute("PINFO", pinfo);


		return "../VIEW/Consulting/BoardList.jsp";
	}

}







