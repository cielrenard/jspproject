package Controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.BrSuperController;
import Controller.ServiceForward;

public class MembersearchidForm implements BrSuperController{

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ServiceForward forward = new ServiceForward();


		forward.setPath("/VIEW/login/membersearchIDform.jsp");
		 

		return forward;
	}

}
