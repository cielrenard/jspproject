package Controller.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import Sql.ProductSql;
import Util.POOLUtil;
import VO.ProductVO;

public class ProductDetail implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//할일
		//파라미터
		String strNo = req.getParameter("oriNo");		//글번호
		int    oriNo = Integer.parseInt(strNo);			//int형식으로
		
		//파라미터 릴레이로 넘어온 데이터를 받자
		String nowPage = req.getParameter("nowPage");	//보고싶은 페이지번호
		
		//조회수 증가 생략
		//상세보기를 하기위해 해당 글정보를 검색
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = ProductSql.getSQL(ProductSql.SELECT_DETAIL);
		System.out.println("상세보기sql="+sql);		
		PreparedStatement stmt = db.getSTMT(con, sql);
		ProductVO vo = new ProductVO();					//상세보기 결과를 담기위한 변수
		
		try {
			stmt.setInt(1, oriNo);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			//VO클래스를 이용할 경우에는 VO클래스 안에
			//데이터를 기억하기 위한 변수가 준비 되었는지 확인하자
			vo.setNo(rs.getInt("NO"));
			System.out.println("test1");
			vo.setSen(rs.getString("SEN"));
			System.out.println("test2");
			vo.setPname(rs.getString("PNAME"));
			vo.setEx(rs.getString("EX"));
			vo.setAmple(rs.getString("AMPLE"));
			vo.setPrice(rs.getString("PRICE"));
			vo.setId(rs.getString("ID"));
			vo.setCfile(rs.getString("cfile"));
			
			db.close(rs);
			
		} catch (Exception e) {
			System.out.println("상세보기 실행 에러="+e);
		}
		
		db.close(stmt);
		db.close(con);
		
		//모델
		req.setAttribute("VIEW", vo);					//상세보기 결과 데이터
		
		//파라미터 릴레이는 계속해서 다음 문서에 알려주어야 한다
		req.setAttribute("nowPage", nowPage);
		
		//뷰
		return "../VIEW/Product/ProductDetail.jsp";
	}

}
