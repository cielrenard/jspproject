package Controller.Member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controller.BrSuperController;
import Controller.ServiceForward;
import DAO.MemberDAO;
import VO.MemberVO;

public class MemberIdCheck implements BrSuperController {

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String name = req.getParameter("name");
		String ssn = req.getParameter("ssn");
		String hp = req.getParameter("hp");
		String id = req.getParameter("id");
		
		
		MemberDAO memberDAO = new MemberDAO();
		MemberVO dto = memberDAO.idCheck(id);
		memberDAO.close();
		
		
		if (dto == null)
		{// ��ϰ���
			
			
			
			
			req.setAttribute("id", id);
			req.setAttribute("name",name);
			req.setAttribute("ssn",ssn);
			req.setAttribute("hp",hp);
			
			req.setAttribute("memberIdCheckResult", true);
			req.setAttribute("checkOk", "ok");
			req.setAttribute("temp", true);
		} else
		{// ��Ͻ���
			req.setAttribute("id", id);
			req.setAttribute("name",name);
			req.setAttribute("ssn",ssn);
			req.setAttribute("hp",hp);
			
			req.setAttribute("memberIdCheckResult", false);
			req.setAttribute("temp", false);
		}
		
		
	


		ServiceForward forward = new ServiceForward();


		forward.setPath("/VIEW/member/memberIdCheck.jsp");
		 

		return forward;
	}

}
