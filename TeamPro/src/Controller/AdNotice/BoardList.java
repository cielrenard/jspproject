package Controller.AdNotice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import Sql.AdNoticeSql;
import Util.POOLUtil;
import Util.PageUtil;
import VO.AdNoticeVO;

//DB�� ��������.
public class BoardList implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("BoradList��Ʈ�ѷ���~!");
		//����
		
		//������� �������� �˾Ƴ���.
		String strPage=req.getParameter("nowPage");
		int nowPage = 0;
		if(strPage==null || strPage.length()==0) {
			//�Ķ���Ͱ� ����
			nowPage = 1;
		}else {
			nowPage = Integer.parseInt(strPage);
		}
		
		//����Ͻ����� ����
		//���ϵǾ��� ����� �信�� �𵨷� �����ؾ� �Ѵ�.
		POOLUtil db=new POOLUtil();
		Connection con = db.getCon();
		
		//������ ������ ����� ���ؼ��� �ʼ������� ���� ���� ������,
		// �� ������ ������ �˾ƾ� �Ѵ�.
		//�� ������ ���� ���ϱ�
		String sql1=AdNoticeSql.getSQL(AdNoticeSql.SELECT_TOTALCOUNT);
		System.out.println("sql1="+sql1);
		int totalCount=0;
		
		PreparedStatement stmt1=db.getSTMT(con,sql1);
		try {
			ResultSet rs1=stmt1.executeQuery();
			rs1.next();
			totalCount=rs1.getInt("CNT");
			System.out.println("totalCount="+totalCount);
			db.close(rs1);
		} catch (Exception e) {
			System.out.println("�ѵ����Ͱ��� ����"+e);
		}
		
		//������ ������ ����� ���� ����
		//�� ȭ�鿡�� 3���� �Խù��� ���̵��� �ϰ�
		//�� ȭ�鿡�� 5���� ������ �̵������ ���� ����
		PageUtil pinfo=new PageUtil(nowPage,totalCount,5,3);
		
		//String sql=NoticeSql.getSQL(1);
		String sql=AdNoticeSql.getSQL(AdNoticeSql.SELECT_BOARDLIST);
		System.out.println("sql="+sql);//SELECT 	rb_No~~~
		
		Statement stmt = db.getSTMT(con);
		ArrayList list = new ArrayList();
		
		try {
			//�Խù� ���� �˻� ���� ��ɼ����ϸ� ��� �Խù��� ���ϵǾ�����.
			ResultSet rs=stmt.executeQuery(sql);
			//�츮�� �� �߿��� �ʿ��� ������ ������ �信�� �����ؾ� �Ѵ�.
			//�ش� ������ ������ ������ ������ ������.
			int skip = (pinfo.getNowPage()-1)*pinfo.getListCount();
			
			for(int i=0;i<skip;i++) {
				rs.next();
				//�����ͺ��̽� �۾� �����͸� �ʿ���� �����Ϳ��� ������.
			}
			//4�� ����� ��.. ���� Ÿ���� ������
			//���� ���������� ������ �����͸� ������ ����Ѵ�.
			for(int i=0;i<pinfo.getListCount() && rs.next();i++) {
				//�� ���� �������� �� �پ� �����Ͱ� ��µȴ�.
				//�� ���� �����ʹ� VOŬ������ ����ϰ�
				AdNoticeVO vo = new AdNoticeVO();
				vo.setNo(rs.getInt("NO"));
				vo.setWriter(rs.getString("WRITER"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setHit(rs.getInt("HIT"));
				vo.setWday(rs.getDate("WDAY"));
				//System.out.println(rs.getString("WRITER"));
				System.out.println(rs.getInt("NO"));
				
				//�� VO�� list�� �־��ش�.
				list.add(vo);	
				
			}//for
			
			db.close(rs);
		} catch (Exception e) {
			System.out.println("SELECT_BOARDLIST ���࿡��~~"+e);
		}
		//����� ���� Ŀ�ؼ��� �ݵ�� Ŀ�ؼ� Ǯ�� �ݳ��ؾ� ���� �۾����� ����� �� �ִ�.
		db.close(stmt);
		db.close(con);
		//��... �信�� MODEL�� �����Ѵٶ�� ǥ���Ѵ�.
		req.setAttribute("LIST",list);
		req.setAttribute("PINFO", pinfo);
		
		
		//��(������ �� �����͸� �̿��ؼ� ����� ����Ѵ�.)
		return "../VIEW/AdNotice/BoardList.jsp";
	}

}
