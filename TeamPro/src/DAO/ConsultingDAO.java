package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Sql.ConsultingSql;
import Util.POOLUtil;
import VO.ConsultingVO;


public class ConsultingDAO {
	private POOLUtil db;
	private Connection con;
	private int change;
	
	public ConsultingDAO() {
		 db = new POOLUtil();
		 con = db.getCon();	
		 
	}
	public int deleteBoard(int oriNo) {
		String sql = ConsultingSql.getSQL(7);
		PreparedStatement stmt = db.getSTMT(con, sql);
		try {
			stmt.setInt(1, oriNo);
			
			
			change = stmt.executeUpdate();
			System.out.println(change);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		db.close(stmt);
		return change;
	}
	
	
	public void updateBoard(String title,String body, int oriNo) {
		String sql = ConsultingSql.getSQL(ConsultingSql.UPDATE_BOARD);
		PreparedStatement stmt = db.getSTMT(con, sql);
		try {			
		stmt.setString(1, title);
		stmt.setString(2, body);		
		stmt.setInt(3, oriNo);
		
		stmt.executeUpdate();
		}
		catch(Exception e){
			System.out.println( e);
		}
	}
	
	public ConsultingVO showDetail(int oriNo) {
		String sql = ConsultingSql.getSQL(ConsultingSql.SELECT_DETAIL);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		ConsultingVO vo =new ConsultingVO();
		try {
			stmt.setInt(1, oriNo);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			vo.setNo(rs.getInt("NO"));
			vo.setWriter(rs.getString("WRITER"));
			vo.setTitle(rs.getString("TITLE"));
			vo.setBody(rs.getString("BODY"));
			vo.setHit(rs.getInt("HIT"));
			vo.setWday(rs.getDate("WDAY"));
			db.close(rs);
		} catch (Exception e) {
			System.out.println(e);
			
		}
		db.close(stmt);
		return vo;
	}
	public void close() {
		db.close(con);
	}
}

