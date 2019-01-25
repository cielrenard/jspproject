package Controller.AdNotice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.AdNoticeDAO;

public class ModifyProc implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//할일
		//System.out.println("수정proc 컨트롤러~");
		//파라미터
		String strNo = req.getParameter("no");
		int no = Integer.parseInt(strNo);
		String nowPage = req.getParameter("nowPage");
		
		String title = req.getParameter("title");
		String body= req.getParameter("body");
		
		//DAO호출(비즈니스로직 )
		AdNoticeDAO dao = new AdNoticeDAO();
		dao.updateBoard(title,body,no);
		
		//모델
		req.setAttribute("NO", no);
		req.setAttribute("nowPage", nowPage);
		
		
		//뷰
		return "../VIEW/AdNotice/ModifyProc.jsp";
	}

}
