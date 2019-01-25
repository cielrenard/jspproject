package Controller.login;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.BrSuperController;
import Controller.ServiceForward;
import DAO.MemberDAO;


public class LoginProc implements BrSuperController {

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
	
		
		MemberDAO memberDAO = new MemberDAO();
	
		int temp = memberDAO.getMember(id, pw);
		memberDAO.close();
		if(temp == 2) {
			HttpSession session = req.getSession();
			session.setAttribute("UID", id);
			session.setAttribute("isLoginadmin", true);
			
			req.setAttribute("isLoginComp", true);
			
			ServiceForward forward = new ServiceForward();


			forward.setPath("/VIEW/login/loginproc.jsp");
			 

			return forward;
		}
		else if (temp == 1) {//ȸ�� �α��� ����
				HttpSession session = req.getSession();
				session.setAttribute("UID", id);
				session.setAttribute("isLoginadmin", false);
				
				req.setAttribute("isLoginComp", true);
				ServiceForward forward = new ServiceForward();


				forward.setPath("/VIEW/login/loginproc.jsp");
				 

				return forward;
		} 	
		else {
			
			req.setAttribute("isLoginComp", false);
			ServiceForward forward = new ServiceForward();


			forward.setPath("/VIEW/login/loginproc.jsp");
			 

			return forward;
		}
		

	}

}
