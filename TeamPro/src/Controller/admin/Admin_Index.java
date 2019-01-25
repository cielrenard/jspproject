package Controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.BrSuperController;
import Controller.ServiceForward;

public class Admin_Index implements BrSuperController{

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		ServiceForward forward = new ServiceForward();

		
		forward.setPath("/VIEW/admin/admin_index.jsp");
		 
		
		return forward;
	}

}
