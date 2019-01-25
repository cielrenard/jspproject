package Controller.Consulting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.ConsultingDAO;

public class BoardDelete implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String strNo = req.getParameter("oriNo");
		int oriNo = Integer.parseInt(strNo);
		
		
		ConsultingDAO dao = new ConsultingDAO();
		int change = dao.deleteBoard(oriNo);
		dao.close();
		
		req.setAttribute("CHA", change);
		
		
		return "../VIEW/Consulting/BoardDelete.jsp";
	}

}
