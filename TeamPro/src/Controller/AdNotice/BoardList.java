package Controller.AdNotice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import Sql.AdNoticeSql;
import Util.POOLUtil;
import Util.PageUtil;
import VO.AdNoticeVO;

//DB랑 연동하자.
public class BoardList implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("BoradList컨트롤러임~!");
		//할일
		
		//보고싶은 페이지를 알아낸다.
		String strPage=req.getParameter("nowPage");
		int nowPage = 0;
		if(strPage==null || strPage.length()==0) {
			//파라미터가 없다
			nowPage = 1;
		}else {
			nowPage = Integer.parseInt(strPage);
		}
		
		//비즈니스로직 수행
		//리턴되어진 결과를 뷰에게 모델로 전달해야 한다.
		POOLUtil db=new POOLUtil();
		Connection con = db.getCon();
		
		//페이지 정보를 만들기 위해서는 필수적으로 보고 싶은 페이지,
		// 총 데이터 개수를 알아야 한다.
		//총 데이터 개수 구하기
		String sql1=AdNoticeSql.getSQL(AdNoticeSql.SELECT_TOTALCOUNT);
		System.out.println("sql1="+sql1);
		int totalCount=0;
		
		PreparedStatement stmt1=db.getSTMT(con,sql1);
		try {
			ResultSet rs1=stmt1.executeQuery();
			rs1.next();
			totalCount=rs1.getInt("CNT");
			System.out.println("totalCount="+totalCount);
			db.close(rs1);
		} catch (Exception e) {
			System.out.println("총데이터개수 에러"+e);
		}
		
		//페이지 정보를 만들어 놓을 예정
		//한 화면에는 3개의 게시물이 보이도록 하고
		//한 화면에는 5개씩 페이지 이동기능을 만들 예정
		PageUtil pinfo=new PageUtil(nowPage,totalCount,5,3);
		
		//String sql=NoticeSql.getSQL(1);
		String sql=AdNoticeSql.getSQL(AdNoticeSql.SELECT_BOARDLIST);
		System.out.println("sql="+sql);//SELECT 	rb_No~~~
		
		Statement stmt = db.getSTMT(con);
		ArrayList list = new ArrayList();
		
		try {
			//게시물 원글 검색 질의 명령수행하면 모든 게시물이 리턴되어진다.
			ResultSet rs=stmt.executeQuery(sql);
			//우리는 이 중에서 필요한 개수만 꺼내서 뷰에게 전달해야 한다.
			//해당 페이지 이전에 보여줄 데이터 버린다.
			int skip = (pinfo.getNowPage()-1)*pinfo.getListCount();
			
			for(int i=0;i<skip;i++) {
				rs.next();
				//데이터베이스 작업 포인터를 필요없는 데이터에서 내린다.
			}
			//4번 방식의 모델.. 여러 타입의 여러개
			//현재 페이지에서 보여줄 데이터만 꺼내서 사용한다.
			for(int i=0;i<pinfo.getListCount() && rs.next();i++) {
				//한 바퀴 돌때마다 한 줄씩 데이터가 출력된다.
				//한 줄의 데이터는 VO클래스로 기억하고
				AdNoticeVO vo = new AdNoticeVO();
				vo.setNo(rs.getInt("NO"));
				vo.setWriter(rs.getString("WRITER"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setHit(rs.getInt("HIT"));
				vo.setWday(rs.getDate("WDAY"));
				//System.out.println(rs.getString("WRITER"));
				System.out.println(rs.getInt("NO"));
				
				//그 VO를 list에 넣어준다.
				list.add(vo);	
				
			}//for
			
			db.close(rs);
		} catch (Exception e) {
			System.out.println("SELECT_BOARDLIST 실행에러~~"+e);
		}
		//사용이 끝난 커넥션은 반드시 커넥션 풀에 반납해야 다음 작업에서 사용할 수 있다.
		db.close(stmt);
		db.close(con);
		//모델... 뷰에게 MODEL을 전달한다라고 표현한다.
		req.setAttribute("LIST",list);
		req.setAttribute("PINFO", pinfo);
		
		
		//뷰(에서는 이 데이터를 이용해서 목록을 출력한다.)
		return "../VIEW/AdNotice/BoardList.jsp";
	}

}
