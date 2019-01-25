package Controller.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.BrSuperController;
import Controller.ServiceForward;

public class MemberCheckForm implements BrSuperController{

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ServiceForward forward = new ServiceForward();


		forward.setPath("/VIEW/member/memberCheckform.jsp");
		 

		return forward;
	}

}
