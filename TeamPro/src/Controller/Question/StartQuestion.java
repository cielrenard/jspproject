package Controller.Question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;

public class StartQuestion implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("StartQuestion  controller");
		//return "";
		HttpSession session= req.getSession();
		//session.setAttribute("UID", "bros3");
		String id=(String)session.getAttribute("UID");
		//System.out.println(id);
		
		req.setAttribute("USER", id); 
		return "../VIEW/Question/Question01.jsp";
	}

}
