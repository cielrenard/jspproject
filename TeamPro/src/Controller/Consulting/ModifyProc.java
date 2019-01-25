package Controller.Consulting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.ConsultingDAO;
import VO.ConsultingVO;

public class ModifyProc implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String strNo = req.getParameter("oriNo");
			int oriNo = Integer.parseInt(strNo);
		String nowPage = req.getParameter("nowPage");
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		
		
		ConsultingDAO dao = new ConsultingDAO();
		dao.updateBoard(title,body,oriNo);
		dao.close();
		
		
		req.setAttribute("nowPage",  nowPage);
		req.setAttribute("oriNo", oriNo);
		
		
		
		return "../VIEW/Consulting/ModifyProc.jsp";
	}

}
