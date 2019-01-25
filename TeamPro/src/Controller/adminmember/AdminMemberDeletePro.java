package Controller.adminmember;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.BrSuperController;
import Controller.DgSuperController;
import Controller.ServiceForward;
import DAO.MemberDAO;

public class AdminMemberDeletePro implements BrSuperController{

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
				//할일
				//파라미터 받고
				String id = req.getParameter("id");
			
				
				//로직수행
				MemberDAO dao = new MemberDAO();
				int change = dao.deletemember(id);
				dao.close();
				
				//모델
				req.setAttribute("CHANGE", change);
				
				ServiceForward forward = new ServiceForward();


				forward.setPath("/VIEW/adminmember/admin_memberdeletepro.jsp");
				 

				return forward;
	}

}
