package Controller.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import Sql.ProductSql;
import Util.POOLUtil;
import Util.PageUtil;
import VO.ProductVO;

public class ProductList implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("ProductList ��Ʈ�ѷ�");
		//����
		//�Ķ����
		String strPage = req.getParameter("nowPage");
		int nowPage = 0;
		if(strPage == null || strPage.length()==0) {
			//�Ķ���Ͱ� ����
			nowPage=1;
		}else {
			nowPage=Integer.parseInt(strPage);
		}
		
		//����Ͻ�����
		//���ϵǾ��� ����� �信�� �𵨷� ����
		POOLUtil db = new POOLUtil();
		Connection con = db.getCon();				
		
		//������ ������ ��������ؼ��� �ʼ������� ������� ������, �ѵ����Ͱ����� �˾ƾ� �Ѵ�
		//�ѵ����Ͱ��� ���ϱ�
		String sql1 = ProductSql.getSQL(ProductSql.SELECT_TOTALCOUNT);
		System.out.println("sql1="+sql1);
		int totalCount = 0; 
		
		PreparedStatement stmt1 = db.getSTMT(con, sql1);
		try {
			ResultSet rs1 = stmt1.executeQuery();	//select���̹Ƿ� executeQuery
			rs1.next();
			totalCount = rs1.getInt("NO");
			System.out.println("totalCount="+totalCount);
			db.close(rs1);
		} catch (Exception e) {
			System.out.println("�ѵ����� ���� ����="+e);
		}
		
		//���������� �����
		//��ȭ�鿡�� 5���� �Խù��� ���̵��� �ϰ�
		//��ȭ�鿡�� 1���� ������ �̵������ ���鿹��
		PageUtil pinfo = new PageUtil(nowPage,totalCount,5,1);
		
		//String sql = ProductSql.getSQL(1);
		String sql = ProductSql.getSQL(ProductSql.SELECT_PRODUCTLIST);
		System.out.println("SELECT_PRODUCTLIS sql="+sql);
		Statement stmt = db.getSTMT(con);
		ArrayList list = new ArrayList();
		
		try {
			//�Խù� ���� �˻� ���� ����� �����ϸ� ��� �Խù��� ���ϵǾ�����
			ResultSet rs = stmt.executeQuery(sql);
			//�츮�� �� �߿��� �ʿ��� ������ ������ �信�� �����ؾ� �Ѵ�
			//�ش� ������ ������ ������ ������ ������
			int skip = (pinfo.getNowPage()-1)*pinfo.getListCount();
			
			for(int i=0;i<skip;i++) {
				rs.next();
				//�����ͺ��̽� �۾� �����͸� �ʿ���� �����Ϳ��� ������
			}
			
			//4������� ��.. ����Ÿ���� ������
			//���� ���������� ������ �����͸� ������ ����Ѵ�
			for(int i=0;i<pinfo.getListCount()&&rs.next();i++) {
			//while(rs.next()){
				//�� ������������ �� �پ� �����Ͱ� ��µȴ�
				//�� ���� �����ʹ� VOŬ������ ����ϰ�
				ProductVO vo = new ProductVO();
				vo.setNo(rs.getInt("NO"));
				vo.setSen(rs.getString("SEN"));
				vo.setPname(rs.getString("PNAME"));
				vo.setPrice(rs.getString("PRICE"));
				vo.setCfile(rs.getString("cfile"));
				//System.out.println(rs.getString("ID"));
				//System.out.println(rs.getInt("NO"));
				
				//���õ� VO�� list�� �־��ش�
				list.add(vo);
			}
			
			//close(�� �������� ���� �ͺ��� �ݾ��ش�)
			db.close(rs);
			
		} catch (Exception e) {
			System.out.println("SELECT_PRODUCTLIST ���࿡��= "+e);
		}
		//����� ����  Ŀ�ؼ��� �ݵ�� Ŀ�ؼ� Ǯ�� �ݳ��ؾ� ���� �۾����� Ŀ�ؼ��� ����� �� �ִ�
		db.close(stmt);
		db.close(con);
			
		//��..�信�� ����
		req.setAttribute("LIST", list);
		req.setAttribute("PINFO", pinfo);
		
		//��
		return "../VIEW/Product/ProductList.jsp";
	}

}
