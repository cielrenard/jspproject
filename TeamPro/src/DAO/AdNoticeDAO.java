package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Sql.AdNoticeSql;
import Util.POOLUtil;
import VO.AdNoticeVO;

/*	DAO(Data Access Object)
 * =>Data�� �����ϴ� ��ü
 * =>�����ͺ��̽� �۾��� ������ Ŭ����
 * =>�����ͺ��̽� �۾��� ������ ����ų�, ���õ� ó���� �ٲ��
 * 		������ DAO���ϸ� �����ϸ� ��.
 */
public class AdNoticeDAO {
	
	private POOLUtil db;
	private Connection con;

	public AdNoticeDAO() {
		db = new POOLUtil();
		con = db.getCon();
	}
	
	//����� �ʿ��� ������ (�Լ�) �߰�
	//���� �����ϱ�
	public int deleteBoard(int no) {
		//��������
		String sql = AdNoticeSql.getSQL(AdNoticeSql.DELETE_BOARD);
		PreparedStatement stmt = db.getSTMT(con, sql);
		int change=0;
		
		try {
			stmt.setInt(1, no);
			
			//update���Ǹ���� ������ �� ��ȭ�� �������� ������ �˾Ƴ���
			//1�̸� �Ѱ��� ������ ���̰�
			//0�̸� �������� ���� ���̴�.
			change = stmt.executeUpdate();
			System.out.println("���ۻ��� ���� ������="+change);
		}
		catch(Exception e) {
			System.out.println("���ۻ��� ���� ���࿡��="+e);
		}
		db.close(stmt);
		return change;
	}
	
	//���� �����ϱ�
	public void updateBoard(String title, String body, int no) {
		//��������
		String sql = AdNoticeSql.getSQL(AdNoticeSql.UPDATE_BOARD);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			stmt.setString(1, title);
			stmt.setString(2, body);
			stmt.setInt(3, no);
			
			stmt.execute();
		}
		catch(Exception e) {
			System.out.println("���ۼ��� ���� ���࿡��="+e);
		}
		db.close(stmt);
	}
	
	//����	�󼼺���
	public AdNoticeVO selectDetail(int no) {
		String sql = AdNoticeSql.getSQL(AdNoticeSql.SELECT_DETAIL);
		PreparedStatement stmt = db.getSTMT(con, sql);
		//������� ������� ����
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
			System.out.println("(�������� �Ѹ�) ���ۻ󼼺��� ���� ���࿡��"+e);
		}
		db.close(stmt);
		return vo;
	}
	
	public void close() {
		db.close(con);
	}
}
