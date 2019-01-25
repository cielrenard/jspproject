package Controller.Member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controller.BrSuperController;
import Controller.ServiceForward;
import DAO.MemberDAO;
import VO.MemberVO;

public class MemberCheckProc implements BrSuperController{

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		String name=req.getParameter("name");
		String ssn= req.getParameter("ssn");
		String hp= req.getParameter("hp");
		
		
		MemberDAO dao = new MemberDAO();		
		MemberVO dto = dao.checkMember(name, ssn ,hp);
		dao.close();
	
		
		if(dto != null)
		{// ���ԺҰ� main����(script"�̹̰��Ե� ȸ���Դϴ�. �α��� �� �ּ���.")
			
			req.setAttribute("memberCheck",false);
			ServiceForward forward = new ServiceForward();


			forward.setPath("/VIEW/member/memberCheckproc.jsp");
			 

			return forward;
		
		}
		else 
		{// ���԰��� ����form����
			
			req.setAttribute("name",name);
			req.setAttribute("ssn",ssn);
			req.setAttribute("hp",hp);
			
			req.setAttribute("memberCheck",true);
		
			ServiceForward forward = new ServiceForward();


			forward.setPath("/VIEW/member/memberCheckproc.jsp");
			 

			return forward;
		} 
		
		
	}

}
