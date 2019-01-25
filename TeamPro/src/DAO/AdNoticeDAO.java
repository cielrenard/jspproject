package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Sql.AdNoticeSql;
import Util.POOLUtil;
import VO.AdNoticeVO;

/*	DAO(Data Access Object)
 * =>Data에 접속하는 객체
 * =>데이터베이스 작업을 전담할 클래스
 * =>데이터베이스 작업에 문제가 생기거나, 관련된 처리가 바뀌면
 * 		앞으로 DAO파일만 수정하면 됨.
 */
public class AdNoticeDAO {
	
	private POOLUtil db;
	private Connection con;

	public AdNoticeDAO() {
		db = new POOLUtil();
		con = db.getCon();
	}
	
	//기능을 필요할 때마다 (함수) 추가
	//원글 삭제하기
	public int deleteBoard(int no) {
		//삭제질의
		String sql = AdNoticeSql.getSQL(AdNoticeSql.DELETE_BOARD);
		PreparedStatement stmt = db.getSTMT(con, sql);
		int change=0;
		
		try {
			stmt.setInt(1, no);
			
			//update질의명령을 실행한 후 변화된 데이터의 개수를 알아내서
			//1이면 한개가 수정된 것이고
			//0이면 수정되지 않은 것이다.
			change = stmt.executeUpdate();
			System.out.println("원글삭제 질의 실행결과="+change);
		}
		catch(Exception e) {
			System.out.println("원글삭제 질의 실행에러="+e);
		}
		db.close(stmt);
		return change;
	}
	
	//원글 수정하기
	public void updateBoard(String title, String body, int no) {
		//수정질의
		String sql = AdNoticeSql.getSQL(AdNoticeSql.UPDATE_BOARD);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			stmt.setString(1, title);
			stmt.setString(2, body);
			stmt.setInt(3, no);
			
			stmt.execute();
		}
		catch(Exception e) {
			System.out.println("원글수정 질의 실행에러="+e);
		}
		db.close(stmt);
	}
	
	//원글	상세보기
	public AdNoticeVO selectDetail(int no) {
		String sql = AdNoticeSql.getSQL(AdNoticeSql.SELECT_DETAIL);
		PreparedStatement stmt = db.getSTMT(con, sql);
		//결과물을 담기위한 변수
		AdNoticeVO vo  = new AdNoticeVO();
		
		try {
			stmt.setInt(1, no);
			ResultSet rs = stmt.executeQuery();
			
			rs.next();
			
			vo.setNo(rs.getInt("NO"));
			vo.setWriter(rs.getString("WRITER"));
			vo.setTitle(rs.getString("TITLE"));
			vo.setBody(rs.getString("BODY"));
			vo.setHit(rs.getInt("HIT"));
			vo.setWday(rs.getDate("WDAY"));
		
		} catch (Exception e) {
			System.out.println("(수정폼에 뿌릴) 원글상세보기 질의 실행에러"+e);
		}
		db.close(stmt);
		return vo;
	}
	
	public void close() {
		db.close(con);
	}
}
