package Controller.AdNotice;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import Sql.AdNoticeSql;
import Util.POOLUtil;
import VO.AdNoticeVO;

public class BoardDetail implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		//할일
		//1. 파라미터받고
			
		String strNo = req.getParameter("no");		//글번호 몇번 눌렀니?
		int no = Integer.parseInt(strNo);
		System.out.println("no="+no);
		
		//파라미터 릴레이로 넘어온 데이터를 받자
		String nowPage = req.getParameter("nowPage");		//보고싶은 페이지번호
		
		//세션에다 그 사람이 본적이 있는 게시물의 글번호를 누적해서 기록해 놓는다.
		boolean isHit = false;		//조회수 증가를 할지말지를 판단하는 변수
		HttpSession session = req.getSession();
		ArrayList list = (ArrayList)session.getAttribute("SHOW");
		
		//해당 글번호의 rb_Hit컬럼의 데이터를 증가시킨다.
		//조회수 증가를 해도 되는 사람만 증가시킨다.
		//만약 어떤 사람이 다시 게시물을 보려고 하면
		//먼저 세션에 이미 본 게시물 번호를 확인하여서
		//존재하면 				조회수 증가를 하지 말고
		//존재하지 않으면 	조회수 증가를 시킨다.
		if(list==null || list.size()==0	) {
			//한번도 어떤 글도 본적이 없다.
			//이 사람은 조회수를 증가시켜야 한다.
			isHit = true;
			list = new ArrayList();
			list.add(no);
			session.setAttribute("SHOW", list);
		}
		else if(list.contains(no)) {
			//이 사람은 그 글을 본적이 있으므로 조회수를 증가X
			isHit = false;
		}
		else	{
			//이 사람은 다른 글은 봤어도 지금 글은 본적이 없다...조건문을 증가하자.
			isHit = true;
			list.add(no);
			session.setAttribute("SHOW",list);
		}
		
		//2. 조회수 증가.. db연결.. 쿼리..스테이트먼트.. 실행
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = AdNoticeSql.getSQL(AdNoticeSql.UPDATE_HIT);	//쿼리문 준비
		System.out.println("sql="+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		AdNoticeVO vo = new AdNoticeVO();//상세보기 결과를 담기위한 변수
		
		try {
			
			stmt.setInt(1, no);
			//해당 글번호의 rb_Hit컬럼의 데이터를
			//조회수를 증가해도 되는 사람만 증가시킨다
			if(isHit==true) {
				stmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("Update_hit실행 에러"+e);
		}

		
		//3. 상세보기를 하기위해 해당 글정보를 검색
		sql = AdNoticeSql.getSQL(AdNoticeSql.SELECT_DETAIL);
		//System.out.println("상세보기 sql="+sql);
		stmt = db.getSTMT(con, sql);
		try {
			stmt.setInt(1, no);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			//VO클래스를 이용할 경우에는 VO클래스안에
			//데이터를 기억하기 위한 변수가 준비가 되었는지 확인하자.
			vo.setNo(rs.getInt("NO"));
			vo.setWriter(rs.getString("WRITER"));
			vo.setTitle(rs.getString("TITLE"));
			vo.setBody(rs.getString("BODY"));
			vo.setHit(rs.getInt("HIT"));
			vo.setWday(rs.getDate("WDAY"));
			
			db.close(rs);
		} catch (Exception e) {
			System.out.println("상세보기 실행에러"+e);
		}
		
		db.close(stmt);
		db.close(con);
		//4. 결과를 모델로..
		req.setAttribute("VIEW", vo);		//상세보기 결과 데이터
		//파라미터 릴레이는 계속해서 다음 문서에 알려주어야 한다.
		req.setAttribute("nowPage", nowPage);
		
		//뷰
		return "../VIEW/AdNotice/BoardDetail.jsp";
	}

}
