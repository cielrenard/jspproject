package Controller.AdNotice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.AdNoticeDAO;

public class BoardDelete implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//����
		System.out.println("���� ��Ʈ�ѷ�");
		//�Ķ����
		String strNo = req.getParameter("no");
		int no = Integer.parseInt(strNo);
			
		//DAOȣ��(����Ͻ����� )
		AdNoticeDAO dao = new AdNoticeDAO();
		int change = dao.deleteBoard(no);
		dao.close();
		
		//��
		req.setAttribute("CHANGE", change);
		
		//��
		return "../VIEW/AdNotice/BoardDelete.jsp";
	}

}
