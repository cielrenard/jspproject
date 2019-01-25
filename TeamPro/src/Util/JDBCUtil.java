package Util;

import java.sql.*;

/*
 * �� Ŭ������ JDBC�� �̿��ؼ� �����ͺ��̽��� ó���� ��
 * ���� ����ϴ� ����� ��Ƴ��� ��
 * �ʿ��� ����� �����ϱ����� ��ǰ Ŭ�����̴�
 */
public class JDBCUtil {

	/* �������� �� Ŭ������ new���ѵ�
	 *  JDBC�� �ε��� �� �ֵ��� �ϱ�����.
	 *  ���߿� ��������  JDBCUtil db = new JDBCUtil();
	 */
	public JDBCUtil() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println("����̹� �ε� ����="+e);
		}
	}
	
	//�����ͺ��̽��� �̿��ϱ����ؼ��� ������ �ؾ��ϹǷ�
	//������ ����� �� �Լ��� ������
	// Ŀ�ؼ��� �ʿ��ϸ�  Connection con = db.getCon();
	public Connection getCon() {
		Connection con = null;
		try {
			String url    ="jdbc:oracle:thin:@localhost:1521:xe";
			String user ="bros";
			String pw   ="0711";
			con = DriverManager.getConnection(url,user,pw);
		}
		catch(Exception e) {
			System.out.println("Ŀ�ؼ� ���� ="+e);
		}
		return con;
	}
	
	/* �������� Statement�� �ʿ��ϸ� ��� ������ִ� �Լ��� ������
	 */
	public Statement getSTMT(Connection con) {
		Statement stmt = null;
		
		try {
			stmt = con.createStatement();
		} catch (Exception e) {
			System.out.println( "������Ʈ��Ʈ ���� ���� ="+e);
		}
		
		return stmt;
	}
	
	
	/* �������� PreparedStatement�� �ʿ��ϸ� ��� ������ִ� �Լ��� ������
	 */
	public PreparedStatement getSTMT(Connection con, String sql) {
		//�Ű������� ����
		//PreparedStatement�� ����� ���ؼ��� Connection�� �ʿ��ϸ�,
		//PreparedStatement�� �̸� ���� ����� �˷�����ϹǷ� ���Ǹ���� �ʿ�
		
		PreparedStatement stmt = null;
		try {
			stmt = con.prepareStatement(sql);
		}
		catch(Exception e) {
			System.out.println("PreparedStatement ���� ����="+e);
		}	
		return stmt;
	}
	
	// �������� �����ͺ��̽� �۾��� ������ �ݾ��־�� �Ѵ�
	// �� �۾��� �����ϰ��ϱ����ؼ� �ݴ� ��ɵ� �����ϰڴ�
	public void close(Object obj) {
		// �Ű������� ����
		// �� �Լ��� �ݾ��ϴ� ��ü�� �޾ƿ��� ���ؼ� �Ű������� �غ�
		// �ݾƾ��� ��ü�� ���� ���̹Ƿ� �̵� ��θ� �� ���� ���� �� �ֵ���
		// �ֻ��� Ŭ������ �̿��ؼ� ó���Ѵ�.
		try {
			if(obj instanceof  Connection) {
				Connection temp = (Connection)obj;
				temp.close();
			}
			else if(obj instanceof  Statement) {
				Statement temp = (Statement)obj;
				temp.close();
			}
			else if(obj instanceof  PreparedStatement) {
				PreparedStatement temp = (PreparedStatement)obj;
				temp.close();
			}
			else if(obj instanceof  ResultSet) {
				ResultSet temp = (ResultSet)obj;
				temp.close();
			}
		}
		catch(Exception e) {
			System.out.println("�ݱ� ���� = " + e);
		}
	}
	
}














