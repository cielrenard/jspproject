package Controller.Result;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import DAO.QuestionDAO;
import VO.QuestionVO;

public class EndResult implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session= req.getSession();
		String id=(String)session.getAttribute("UID");
		//session.setAttribute("UID", "bros3");
		System.out.println("String id="+id);
		
	
		QuestionDAO dao = new QuestionDAO();
		QuestionVO vo=dao.selectResult(id);
		System.out.println("class QuesResult selectResult()후");
		dao.close();
		
		req.setAttribute("USER", id);
		req.setAttribute("RESULT", vo);
		System.out.println("USER 모델"+id);
		System.out.println("RESULT 모델"+vo);
		return "../VIEW/Result/EndResult.jsp";
	}

}
