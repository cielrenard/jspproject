package Controller.AdNotice;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.AdNoticeDAO;
import Util.POOLUtil;
import VO.AdNoticeVO;

//수정을 하기위해 (db에서 해당 글번호의 내용을 가지고 온) 수정 폼을 제공할 컨트롤러
public class ModifyForm implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//System.out.println("ModifyForm컨트롤러");
		//할일
		//파라미터
		String strNo	= req.getParameter("no");
		int 	no 	= Integer.parseInt(strNo);
		String nowPage = req.getParameter("nowPage");	//릴레이용
		
		
		//비즈니스로직 수행..db에서 해당글번호의 내용 select
		AdNoticeDAO dao= new AdNoticeDAO();
		AdNoticeVO vo = dao.selectDetail(no);
		dao.close();
		
		//모델
		req.setAttribute("BOARD",vo);
		req.setAttribute("nowPage", nowPage);
		//뷰
		return "../VIEW/AdNotice/ModifyForm.jsp";
	}

}
