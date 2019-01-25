package Controller.login;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controller.BrSuperController;
import Controller.ServiceForward;
import DAO.MemberDAO;
import VO.MemberVO;

public class MembersearchidProc implements BrSuperController {

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		
		MemberDAO memberDAO = new MemberDAO();
		
		MemberVO dto = memberDAO.serchID(name, email);
		memberDAO.close();
		
		if (dto != null)
		{//�˻� ����, �α���â���� alert
			
			req.setAttribute("serchID", dto.getM_id());
			req.setAttribute("serchsucc", true);
			
			ServiceForward forward = new ServiceForward();


			forward.setPath("/VIEW/login/membersearchIDproc.jsp");
			 

			return forward;
		}else
		{//�˻� ����, �α���â���� alert
			
			req.setAttribute("serchsucc", false);
			ServiceForward forward = new ServiceForward();


			forward.setPath("/VIEW/login/membersearchIDproc.jsp");
			 

			return forward;
		}
		
	}

}
