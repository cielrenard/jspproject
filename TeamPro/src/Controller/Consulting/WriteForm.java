package Controller.Consulting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;

//�۾��� ��û ��Ʈ�ѷ�
public class WriteForm implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, 
			HttpServletResponse resp) {
		System.out.println("WriteForm��Ʈ�ѷ�");
		//����
		// ������ �̿��ؼ� �α����� �Ǿ��ִ��� Ȯ���ϰ�
		HttpSession session= req.getSession();
		//������ �α��� �� ������ �����ϰ�..
		//session.setAttribute("UID", "hongid");
		//session.setAttribute("UNICK", "����ȫ");		
		
		String uid=(String)session.getAttribute("UID");
		String unick=(String)session.getAttribute("UNICK");
		
		//�α��� ���̶�� 
		if(uid==null || uid.length()==0) {
			//�α��ξȵǾ����� �۾��� ����ſ� �α������� �����ش�
			return "../Member/LoginForm.jsp";
		}
		else {
			//��
			//��
			//�α��� �� ������ �۾��� ����������
			return "../VIEW/Consulting/WriteForm.jsp";		
		}
		
		
	}

}











