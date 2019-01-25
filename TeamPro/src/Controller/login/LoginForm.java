package Controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.BrSuperController;
import Controller.ServiceForward;

public class LoginForm implements BrSuperController{

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
	
		ServiceForward forward = new ServiceForward();


		forward.setPath("/VIEW/login/loginform.jsp");
		 

		return forward;
	}

}
