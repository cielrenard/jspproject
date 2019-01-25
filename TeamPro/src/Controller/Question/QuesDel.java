package Controller.Question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import DAO.QuestionDAO;

public class QuesDel implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session= req.getSession();
		String id=(String)session.getAttribute("UID");
		System.out.println("왔니?");
		QuestionDAO dao = new QuestionDAO();
		dao.delAns(id);
		dao.close();
		
		
		return "../VIEW/Question/QuesReset.jsp";
	}

}
