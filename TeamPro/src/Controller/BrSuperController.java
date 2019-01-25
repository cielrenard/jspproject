package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public  interface BrSuperController {
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp);
}
