package Controller.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import Sql.ProductSql;
import Util.POOLUtil;
import VO.ProductVO;

public class ProductDetail implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//����
		//�Ķ����
		String strNo = req.getParameter("oriNo");		//�۹�ȣ
		int    oriNo = Integer.parseInt(strNo);			//int��������
		
		//�Ķ���� �����̷� �Ѿ�� �����͸� ����
		String nowPage = req.getParameter("nowPage");	//������� ��������ȣ
		
		//��ȸ�� ���� ����
		//�󼼺��⸦ �ϱ����� �ش� �������� �˻�
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();
		String sql = ProductSql.getSQL(ProductSql.SELECT_DETAIL);
		System.out.println("�󼼺���sql="+sql);		
		PreparedStatement stmt = db.getSTMT(con, sql);
		ProductVO vo = new ProductVO();					//�󼼺��� ����� ������� ����
		
		try {
			stmt.setInt(1, oriNo);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			//VOŬ������ �̿��� ��쿡�� VOŬ���� �ȿ�
			//�����͸� ����ϱ� ���� ������ �غ� �Ǿ����� Ȯ������
			vo.setNo(rs.getInt("NO"));
			System.out.println("test1");
			vo.setSen(rs.getString("SEN"));
			System.out.println("test2");
			vo.setPname(rs.getString("PNAME"));
			vo.setEx(rs.getString("EX"));
			vo.setAmple(rs.getString("AMPLE"));
			vo.setPrice(rs.getString("PRICE"));
			vo.setId(rs.getString("ID"));
			vo.setCfile(rs.getString("cfile"));
			
			db.close(rs);
			
		} catch (Exception e) {
			System.out.println("�󼼺��� ���� ����="+e);
		}
		
		db.close(stmt);
		db.close(con);
		
		//��
		req.setAttribute("VIEW", vo);					//�󼼺��� ��� ������
		
		//�Ķ���� �����̴� ����ؼ� ���� ������ �˷��־�� �Ѵ�
		req.setAttribute("nowPage", nowPage);
		
		//��
		return "../VIEW/Product/ProductDetail.jsp";
	}

}
