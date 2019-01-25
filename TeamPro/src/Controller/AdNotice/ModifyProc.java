package Controller.AdNotice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.AdNoticeDAO;

public class ModifyProc implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//����
		//System.out.println("����proc ��Ʈ�ѷ�~");
		//�Ķ����
		String strNo = req.getParameter("no");
		int no = Integer.parseInt(strNo);
		String nowPage = req.getParameter("nowPage");
		
		String title = req.getParameter("title");
		String body= req.getParameter("body");
		
		//DAOȣ��(����Ͻ����� )
		AdNoticeDAO dao = new AdNoticeDAO();
		dao.updateBoard(title,body,no);
		
		//��
		req.setAttribute("NO", no);
		req.setAttribute("nowPage", nowPage);
		
		
		//��
		return "../VIEW/AdNotice/ModifyProc.jsp";
	}

}
