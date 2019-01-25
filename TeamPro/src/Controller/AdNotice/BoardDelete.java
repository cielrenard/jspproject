package Controller.AdNotice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.AdNoticeDAO;

public class BoardDelete implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//할일
		System.out.println("삭제 컨트롤러");
		//파라미터
		String strNo = req.getParameter("no");
		int no = Integer.parseInt(strNo);
			
		//DAO호출(비즈니스로직 )
		AdNoticeDAO dao = new AdNoticeDAO();
		int change = dao.deleteBoard(no);
		dao.close();
		
		//모델
		req.setAttribute("CHANGE", change);
		
		//뷰
		return "../VIEW/AdNotice/BoardDelete.jsp";
	}

}
