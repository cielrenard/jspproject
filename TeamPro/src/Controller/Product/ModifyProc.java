package Controller.Product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.ProductDAO;

public class ModifyProc implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//����
		//�Ķ����
		String nowPage = req.getParameter("nowPage");
		String strNo = req.getParameter("oriNo");
		int oriNo = Integer.parseInt(strNo);
		
		String sen 	 = req.getParameter("sen");
		String pname = req.getParameter("pname");
		String price = req.getParameter("price");
		String ample = req.getParameter("ample");
		String ex 	 = req.getParameter("ex");
		String id 	 = req.getParameter("id");
		String cfile = req.getParameter("cfile");
		
		//����Ͻ�����
		ProductDAO dao = new ProductDAO();
		dao.updateProduct(sen, pname, ex, ample, price, id, oriNo, cfile);
		
		//��
		req.setAttribute("oriNo", oriNo);
		req.setAttribute("nowPage", nowPage);
		
		//��
		return "../VIEW/Product/ModifyProc.jsp";
	}

}
