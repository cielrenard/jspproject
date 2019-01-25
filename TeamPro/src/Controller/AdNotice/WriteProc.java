package Controller.AdNotice;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import Sql.AdNoticeSql;
import Util.POOLUtil;

public class WriteProc implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("WriteProc��Ʈ�ѷ�");
		//����
		//WriteForm.jsp name���� �Ķ���� �ް�
		String title=req.getParameter("title");
		String body=req.getParameter("body");
		
		//������ ������ �۾��̴� ���ǿ��� �޾Ƽ������Ѵ�.
		HttpSession session = req.getSession();
		String writer = (String)session.getAttribute("UID");
		System.out.println("writer="+writer);
		
		//�۵�� ����..db���� insert.. ����,������Ʈ��Ʈ, ����
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = AdNoticeSql.getSQL(AdNoticeSql.INSERT_ORIBOARD);	//������ �غ�
		System.out.println("sql="+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			//?ä����
			/*INSERT INTO 
									notice
			VALUES((SELECT 	NVL(MAX(no_No),0)+1 FROM notice),
									?,?,?,SYSDATE,0,?,'Y');
			 */
			stmt.setString(1, writer);
			stmt.setString(2, title);
			stmt.setString(3, body);
			
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("���۵�� ���� ���� ����"+e);
		}
		db.close(stmt);
		db.close(con);
		//��
		
		//��
		return "../VIEW/AdNotice/WriteProc.jsp";
	}

}
