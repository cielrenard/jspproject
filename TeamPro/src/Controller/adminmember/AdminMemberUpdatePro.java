package Controller.adminmember;

import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.BrSuperController;
import Controller.DgSuperController;
import Controller.ServiceForward;
import DAO.MemberDAO;


public class AdminMemberUpdatePro implements BrSuperController{

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
	
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String jumin = req.getParameter("jumin");
		String phone = req.getParameter("phone");
		String add1 = req.getParameter("add1");
		String add2 = req.getParameter("add2");
		String add = add1+add2;
		String email = req.getParameter("email");
	
		MemberDAO dao = new MemberDAO();
		dao.updatemember(id,name,jumin,phone,add,email);
		dao.close();
		
		ServiceForward forward = new ServiceForward();


		forward.setPath("/VIEW/adminmember/admin_memberupdatepro.jsp");
		 

		return forward;
	}

}
