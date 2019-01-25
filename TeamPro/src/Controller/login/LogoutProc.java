package Controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.BrSuperController;
import Controller.ServiceForward;

public class LogoutProc implements BrSuperController{

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		
		ServiceForward forward = new ServiceForward();


		forward.setPath("/VIEW/login/logoutproc.jsp");
		 

		return forward;
	}

}
