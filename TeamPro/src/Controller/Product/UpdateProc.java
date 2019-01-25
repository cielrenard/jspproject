package Controller.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import Sql.ProductSql;
import Util.POOLUtil;

public class UpdateProc implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//����
		//�Ķ����
		String sen = req.getParameter("sen");
		String pname = req.getParameter("pname");
		String ex = req.getParameter("ex");
		String ample = req.getParameter("ample");
		String price = req.getParameter("price");
		String id = req.getParameter("id");
		String cfile = req.getParameter("cfile");
		
		//������ ������ �۾��̴� ���ǿ��� �޾Ƽ� �����Ѵ�
		HttpSession session = req.getSession();
		String writer = (String)session.getAttribute("UID");
		
		//����Ͻ����� ���� 
		//�� ��� ����.. db���� insert.. ����,������Ʈ��Ʈ,����
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = ProductSql.getSQL(ProductSql.INSERT_ORIPRODUCT);
		System.out.println("sql="+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			//?ä����
			stmt.setString(1, sen);
			stmt.setString(2, pname);
			stmt.setString(3, ex);
			stmt.setString(4, ample);
			stmt.setString(5, price);
			stmt.setString(6, id);
			stmt.setString(7, cfile);
			
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("���۵�� ���ǹ� ���� ����="+e);
		}
		db.close(stmt);
		db.close(con);
		
		//�� 
		
		//��
		return "../VIEW/Product/UpdateProc.jsp";
	}

}
