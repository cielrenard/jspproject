package Controller.Member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controller.BrSuperController;
import Controller.ServiceForward;
import DAO.MemberDAO;
import VO.MemberVO;

public class MemberInsert implements BrSuperController {

	@Override
	public ServiceForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

		MemberVO dto = new MemberVO();
		MemberDAO memberDAO = new MemberDAO();
		
		String add1 = req.getParameter("add1");
		String add2 = req.getParameter("add2");
		String add = add1+add2;
		dto.setM_name(req.getParameter("name"));
		dto.setM_id(req.getParameter("idr"));
		dto.setM_pw(req.getParameter("pw"));
		dto.setM_jumin(req.getParameter("ssn"));
		dto.setM_add(add);
		dto.setM_email(req.getParameter("email"));
		dto.setM_phone(req.getParameter("hp"));
		
		if(req.getParameter("idr")=="admin") {
			dto.setM_grade(0); //관리자
		}
		else if(req.getParameter("idr")!="admin") {
			dto.setM_grade(1);//회원
		}
					
		int	temp=memberDAO.insertMember(dto);
		memberDAO.close();
		
		
		
		
		if(temp==1) { //성공
			
			req.setAttribute("insertResult", true);
			
		}
		else if(temp!=1){ //실패
			
			req.setAttribute("insertResult", false);
			
		}
		ServiceForward forward = new ServiceForward();


		forward.setPath("/VIEW/member/memberInsert.jsp");
		 

		return forward;
	}

}
