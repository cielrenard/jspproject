package Controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.BrSuperController;
import Controller.DgSuperController;
import Controller.ServiceForward;

public class index implements BrSuperController{

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ServiceForward forward = new ServiceForward();


		forward.setPath("/index.jsp");
		 

		return forward;
	}

}
