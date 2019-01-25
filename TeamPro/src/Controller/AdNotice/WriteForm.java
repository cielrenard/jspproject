package Controller.AdNotice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;


public class WriteForm implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
	
		
		String uid=(String)session.getAttribute("UID");
		
		
		if(uid==null || uid.length()==0) {
			
			return "../VIEW/Member/LoginForm.jsp";
		}
		else {
			
			return "../VIEW/AdNotice/WriteForm.jsp";
		}
	
	}

}
