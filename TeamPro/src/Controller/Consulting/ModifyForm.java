package Controller.Consulting;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.ConsultingDAO;
import VO.ConsultingVO;

public class ModifyForm implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String strNo = req.getParameter("oriNo");
		int oriNo = Integer.parseInt(strNo);
		String nowPage = req.getParameter("nowPage");
		
		
		ConsultingDAO dao = new ConsultingDAO();
		ConsultingVO vo = dao.showDetail(oriNo);
		dao.close();
		
		
		
		req.setAttribute("BOARD", vo);
		req.setAttribute("nowPage", nowPage);
		
		
		return "../VIEW/Consulting/ModifyForm.jsp";
	}

}
