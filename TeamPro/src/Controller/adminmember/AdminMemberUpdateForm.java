package Controller.adminmember;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.BrSuperController;
import Controller.DgSuperController;
import Controller.ServiceForward;
import DAO.MemberDAO;
import VO.MemberVO;

public class AdminMemberUpdateForm implements BrSuperController{

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			
			e1.printStackTrace();
		}
		String id = req.getParameter("id");
		MemberVO dto = new MemberVO();
		
		try
		{
		
			MemberDAO memberDAO = new MemberDAO();
			dto = memberDAO.getMemberAdmin(id);
			memberDAO.close();
		} catch (Exception e)
		{
			
			e.printStackTrace();
		}
		
		req.setAttribute("dto", dto);

		
		ServiceForward forward = new ServiceForward();


		forward.setPath("/VIEW/adminmember/admin_memberupdateform.jsp");
		 

		return forward;
	}

}
