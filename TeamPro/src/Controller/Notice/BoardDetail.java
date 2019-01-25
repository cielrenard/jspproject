package Controller.Notice;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import Sql.NoticeSql;
import Util.POOLUtil;
import VO.NoticeVO;

public class BoardDetail implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		//����
		//1. �Ķ���͹ް�
			
		String strNo = req.getParameter("no");		//�۹�ȣ ��� ������?
		int no = Integer.parseInt(strNo);
		System.out.println("no="+no);
		
		//�Ķ���� �����̷� �Ѿ�� �����͸� ����
		String nowPage = req.getParameter("nowPage");		//������� ��������ȣ
		
		//���ǿ��� �� ����� ������ �ִ� �Խù��� �۹�ȣ�� �����ؼ� ����� ���´�.
		boolean isHit = false;		//��ȸ�� ������ ���������� �Ǵ��ϴ� ����
		HttpSession session = req.getSession();
		ArrayList list = (ArrayList)session.getAttribute("SHOW");
		
		//�ش� �۹�ȣ�� rb_Hit�÷��� �����͸� ������Ų��.
		//��ȸ�� ������ �ص� �Ǵ� ����� ������Ų��.
		//���� � ����� �ٽ� �Խù��� ������ �ϸ�
		//���� ���ǿ� �̹� �� �Խù� ��ȣ�� Ȯ���Ͽ���
		//�����ϸ� 				��ȸ�� ������ ���� ����
		//�������� ������ 	��ȸ�� ������ ��Ų��.
		if(list==null || list.size()==0	) {
			//�ѹ��� � �۵� ������ ����.
			//�� ����� ��ȸ���� �������Ѿ� �Ѵ�.
			isHit = true;
			list = new ArrayList();
			list.add(no);
			session.setAttribute("SHOW", list);
		}
		else if(list.contains(no)) {
			//�� ����� �� ���� ������ �����Ƿ� ��ȸ���� ����X
			isHit = false;
		}
		else	{
			//�� ����� �ٸ� ���� �þ ���� ���� ������ ����...���ǹ��� ��������.
			isHit = true;
			list.add(no);
			session.setAttribute("SHOW",list);
		}
		
		//2. ��ȸ�� ����.. db����.. ����..������Ʈ��Ʈ.. ����
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = NoticeSql.getSQL(NoticeSql.UPDATE_HIT);	//������ �غ�
		System.out.println("sql="+sql);
		PreparedStatement stmt = db.getSTMT(con, sql);
		
		NoticeVO vo = new NoticeVO();//�󼼺��� ����� ������� ����
		
		try {
			
			stmt.setInt(1, no);
			//�ش� �۹�ȣ�� rb_Hit�÷��� �����͸�
			//��ȸ���� �����ص� �Ǵ� ����� ������Ų��
			if(isHit==true) {
				stmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("Update_hit���� ����"+e);
		}

		
		//3. �󼼺��⸦ �ϱ����� �ش� �������� �˻�
		sql = NoticeSql.getSQL(NoticeSql.SELECT_DETAIL);
		//System.out.println("�󼼺��� sql="+sql);
		stmt = db.getSTMT(con, sql);
		try {
			stmt.setInt(1, no);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			//VOŬ������ �̿��� ��쿡�� VOŬ�����ȿ�
			//�����͸� ����ϱ� ���� ������ �غ� �Ǿ����� Ȯ������.
			vo.setNo(rs.getInt("NO"));
			vo.setWriter(rs.getString("WRITER"));
			vo.setTitle(rs.getString("TITLE"));
			vo.setBody(rs.getString("BODY"));
			vo.setHit(rs.getInt("HIT"));
			vo.setWday(rs.getDate("WDAY"));
			
			db.close(rs);
		} catch (Exception e) {
			System.out.println("�󼼺��� ���࿡��"+e);
		}
		
		db.close(stmt);
		db.close(con);
		//4. ����� �𵨷�..
		req.setAttribute("VIEW", vo);		//�󼼺��� ��� ������
		//�Ķ���� �����̴� ����ؼ� ���� ������ �˷��־�� �Ѵ�.
		req.setAttribute("nowPage", nowPage);
		
		//��
		return "../VIEW/Notice/BoardDetail.jsp";
	}

}
