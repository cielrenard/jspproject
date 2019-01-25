package DAO;

import java.sql.*;
import Sql.QuestionSql;
import Util.POOLUtil;
import VO.QuestionVO;

public class QuestionDAO {
	private POOLUtil db;
	private Connection con;
	private int sum;
	
	
	public QuestionDAO() {
		db = new POOLUtil();
		con = db.getCon();	
	}
	public void insertAnswer(int setio, String id, int bt1, int bt2, int bt3, int bt4, int bt5, int bt6, int bt7, int bt8,
			int bt9, int bt10) {
		String sql = QuestionSql.getSQL(QuestionSql.INSERT_ANSWER);
		PreparedStatement stmt = db.getSTMT(con, sql);
		try {
		stmt.setInt(1,setio);
		stmt.setString(2,id);
		stmt.setInt(3,bt1);
		stmt.setInt(4,bt2);
		stmt.setInt(5,bt3);
		stmt.setInt(6,bt4);
		stmt.setInt(7,bt5);
		stmt.setInt(8,bt6);
		stmt.setInt(9,bt7);
		stmt.setInt(10,bt8);
		stmt.setInt(11,bt9);
		stmt.setInt(12,bt10);
		stmt.executeUpdate();
		System.out.println(sql);
		} catch (Exception e) {
			System.out.println("INSERT_ANSWER쿼리실행에러="+e);			
		}
		db.close(stmt);
	}	
	public int getSum(int bt1, int bt2, int bt3, int bt4, int bt5, int bt6, int bt7, int bt8, int bt9, int bt10) {
		 sum = bt1+bt2+bt3+bt4+bt5+bt6+bt7+bt8+bt9+bt10;
		 System.out.println("sum="+sum);
		return sum;
	}
	
	
	public QuestionVO showAnswer(String id) {
		String sql = QuestionSql.getSQL(QuestionSql.SELECT_QUESTION);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		QuestionVO vo =new QuestionVO();
		try {
			
			ResultSet rs = stmt.executeQuery();
			rs.next();
			vo.setSetio(rs.getInt("setio"));
			vo.setId(rs.getString("id"));
			vo.setAns1(rs.getInt("ans1"));
			vo.setAns2(rs.getInt("ans2"));
			vo.setAns3(rs.getInt("ans3"));
			vo.setAns4(rs.getInt("ans4"));
			vo.setAns5(rs.getInt("ans5"));
			vo.setAns6(rs.getInt("ans6"));
			vo.setAns7(rs.getInt("ans7"));
			vo.setAns8(rs.getInt("ans8"));
			vo.setAns9(rs.getInt("ans9"));
			vo.setAns10(rs.getInt("ans10"));
			db.close(rs);
		} catch (Exception e) {
			System.out.println(e);
			
		}
		db.close(stmt);
		return vo;
	}	
	//public QuestionVO insertSum(String id, int su1, int su2, int su3, int su4, int su5) {
	public void insertSum(String id, int su1, int su2, int su3, int su4, int su5) {
		System.out.println("id="+id);
		System.out.println("su5="+su5);
		String sql = QuestionSql.getSQL(QuestionSql.INSERT_SUM);
		System.out.println("INSERT_SUM sql="+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		try {
			stmt.setString(1,id);
			stmt.setInt(2,su1);
			stmt.setInt(3,su2);
			stmt.setInt(4,su3);
			stmt.setInt(5,su4);
			stmt.setInt(6,su5);
			int result=stmt.executeUpdate();
			System.out.println("result="+result);
		}
		catch(Exception e) {
			System.out.println("합계집어넣다가 "+e);
		}
		db.close(stmt);
		
		//return null;
	}

	public void close() {
		db.close(con);
	}
	public QuestionVO selectResult(String id) {
		String sql = QuestionSql.getSQL(QuestionSql.SELECT_RESULT);
		System.out.println("SELECT_RESULT = "+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		QuestionVO vo =new QuestionVO();
		try {
			stmt.setString(1, id);			
			ResultSet rs = stmt.executeQuery();
			rs.next();
			vo.setRno(rs.getInt("rno"));
			vo.setId(rs.getString("id"));
			vo.setRes1(rs.getInt("res1"));
			vo.setRes2(rs.getInt("res2"));
			vo.setRes3(rs.getInt("res3"));
			vo.setRes4(rs.getInt("res4"));
			vo.setRes5(rs.getInt("res5"));
			vo.setWday(rs.getDate("wday"));
			System.out.println("rno/wday="+rs.getInt("rno")+"/"+rs.getDate("wday"));
			db.close(rs);
		} catch (Exception e) {
			System.out.println(e);
			
		}
		db.close(stmt);
		return vo;
	}
	public void delAns(String id) {
		String sql = QuestionSql.getSQL(QuestionSql.QUESTION_DEL);
		System.out.println("DEL_ANS sql="+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		try {
			stmt.setString(1,id);
			stmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("초기화~! "+e);
		}
		db.close(stmt);
		
		
		
	}
}
