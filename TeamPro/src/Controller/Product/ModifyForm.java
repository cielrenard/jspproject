package Controller.Product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.ProductDAO;
import VO.ProductVO;


public class ModifyForm implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("ModifyForm ��Ʈ�ѷ�");
		
		String strNo = req.getParameter("oriNo");
		int oriNo = Integer.parseInt(strNo);
		String nowPage = req.getParameter("nowPage");
		
		
		ProductDAO dao = new ProductDAO();
		ProductVO vo = dao.selectDetail(oriNo);
		
		dao.close();
		
		
		req.setAttribute("PRODUCT", vo);
		req.setAttribute("nowPage", nowPage);
		
		
		return "../VIEW/Product/ModifyForm.jsp";
	}

}
