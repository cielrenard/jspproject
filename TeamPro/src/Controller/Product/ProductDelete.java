package Controller.Product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.ProductDAO;

public class ProductDelete implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//할일
		//파라미터
		String strNo = req.getParameter("oriNo");
		int    oriNo = Integer.parseInt(strNo);
		String id	 = req.getParameter("id");
		
		//비즈니스로직 
		ProductDAO dao = new ProductDAO();
		int change = dao.deleteProduct(oriNo, id);
		dao.close();
		
		//모델 
		req.setAttribute("CHANGE", change);
		
		//뷰
		return "../VIEW/Product/ProductDelete.jsp";
	}

}
