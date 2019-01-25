package Controller.Product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.ProductDAO;

public class ModifyProc implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//할일
		//파라미터
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
		
		//비즈니스로직
		ProductDAO dao = new ProductDAO();
		dao.updateProduct(sen, pname, ex, ample, price, id, oriNo, cfile);
		
		//모델
		req.setAttribute("oriNo", oriNo);
		req.setAttribute("nowPage", nowPage);
		
		//뷰
		return "../VIEW/Product/ModifyProc.jsp";
	}

}
