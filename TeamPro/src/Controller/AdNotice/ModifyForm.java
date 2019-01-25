package Controller.AdNotice;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DgSuperController;
import DAO.AdNoticeDAO;
import Util.POOLUtil;
import VO.AdNoticeVO;

//������ �ϱ����� (db���� �ش� �۹�ȣ�� ������ ������ ��) ���� ���� ������ ��Ʈ�ѷ�
public class ModifyForm implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		//System.out.println("ModifyForm��Ʈ�ѷ�");
		//����
		//�Ķ����
		String strNo	= req.getParameter("no");
		int 	no 	= Integer.parseInt(strNo);
		String nowPage = req.getParameter("nowPage");	//�����̿�
		
		
		//����Ͻ����� ����..db���� �ش�۹�ȣ�� ���� select
		AdNoticeDAO dao= new AdNoticeDAO();
		AdNoticeVO vo = dao.selectDetail(no);
		dao.close();
		
		//��
		req.setAttribute("BOARD",vo);
		req.setAttribute("nowPage", nowPage);
		//��
		return "../VIEW/AdNotice/ModifyForm.jsp";
	}

}
