package Controller.Payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;

public class Payment implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		
		return "../VIEW/Payment/Payment.jsp";
	}

}
