package Controller.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import Sql.MemberSql;
import Util.POOLUtil;

public class MemberProc implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("MemberProc");
		//�� ��
		//ȸ�����Խ� ���� �޾ƿ���
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String writer = req.getParameter("name");
		String jumin = req.getParameter("jumin");
		String phone = req.getParameter("phone");
		String add = req.getParameter("add");
		String email = req.getParameter("email");
		
		//����Ͻ� ����
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = MemberSql.getSQL(MemberSql.MEMBER_JOININSERT);
		System.out.println("sql = "+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		try {
			stmt.setString(1, id);
			stmt.setString(2, pw);
			stmt.setString(3, writer);
			stmt.setString(4, jumin);
			stmt.setString(5, phone);
			stmt.setString(6, add);
			stmt.setString(7, email);
		}
		catch(Exception e) {
			System.out.println("ȸ������ ���ǽ��� ����"+e);
		}
		
		//��
		
		//��
		return "../VIEW/Member/MemberProc.jsp";
	}

}
