package DAO;

import java.sql.*;

import Sql.ProductSql;
import Util.POOLUtil;
import VO.ProductVO;

public class ProductDAO{
		
		private POOLUtil db;
		private Connection con;
		
		public ProductDAO() {
			db = new POOLUtil();
			con = db.getCon();
		}
		
			public int deleteProduct(int oriNo, String id) {
			String sql = ProductSql.getSQL(6);
			PreparedStatement stmt = db.getSTMT(con, sql);
			int change = 0;
			
			try {
				stmt.setInt(1, oriNo);
				stmt.setString(2, id);
				
				
				change = stmt.executeUpdate();
				;
				
			} catch (Exception e) {
				System.out.println("="+e);
			}
			db.close(stmt);
			return change;
		}
		
		
		
		public void updateProduct(String sen, String pname, String ex, String ample, String price, String id, int oriNo, String cfile) {
		
			String sql = ProductSql.getSQL(5);
			PreparedStatement stmt = db.getSTMT(con, sql);
			
			try {
				stmt.setString(1, sen);
				stmt.setString(2, pname);
				stmt.setString(3, ex);
				stmt.setString(4, ample);
				stmt.setString(5, price);
				stmt.setString(6, id);
				stmt.setString(7, cfile);
				stmt.setInt(8, oriNo);
				
				stmt.execute();
				
			} catch (Exception e) {
				System.out.println("���� ���� ���ǹ� ���� ����="+e);
			}
			db.close(stmt);
		}
		
		//���� �󼼺���
		public ProductVO selectDetail(int oriNo) {
			String sql = ProductSql.getSQL(ProductSql.SELECT_DETAIL);
			System.out.println("���� �󼼺���selectDetail sql="+sql);
			PreparedStatement stmt = db.getSTMT(con, sql);
			//������� ������� ����
			ProductVO vo = new ProductVO();
			
			try {
				stmt.setInt(1, oriNo);
				ResultSet rs = stmt.executeQuery();
				
				rs.next();
				
				//set�Լ� �ҷ�����
				vo.setNo(rs.getInt("NO"));				//��ǰ��ȣ
				vo.setSen(rs.getString("SEN"));			//����
				vo.setPname(rs.getString("PNAME"));		//��ǰ��
				vo.setEx(rs.getString("EX"));			//��ǰ����
				vo.setAmple(rs.getString("AMPLE"));		//�뷮 
				vo.setPrice(rs.getString("PRICE"));		//����
				vo.setCfile(rs.getString("cfile"));		//����
				
				System.out.println("rs.getInt(no)="+rs.getInt("NO"));
				System.out.println(rs.getString("PNAME"));
				db.close(rs);
			} catch (Exception e) {
				System.out.println("(����Form�� �Ѹ�)���� �󼼺��� ���ǹ� ���� ����="+e);
			}
			db.close(stmt);
			return vo;			
		}

		public void close() {
			db.close(con);
		}
	}

