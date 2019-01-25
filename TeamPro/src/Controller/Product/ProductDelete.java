package Controller.Product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.ProductDAO;

public class ProductDelete implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//����
		//�Ķ����
		String strNo = req.getParameter("oriNo");
		int    oriNo = Integer.parseInt(strNo);
		String id	 = req.getParameter("id");
		
		//����Ͻ����� 
		ProductDAO dao = new ProductDAO();
		int change = dao.deleteProduct(oriNo, id);
		dao.close();
		
		//�� 
		req.setAttribute("CHANGE", change);
		
		//��
		return "../VIEW/Product/ProductDelete.jsp";
	}

}
