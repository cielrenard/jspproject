package Controller.Product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;

//�۾��� ��û ��Ʈ�ѷ�
public class UpdateForm implements DgSuperController {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("UpdateForm ��Ʈ�ѷ�");
		//����
		//������ �̿��ؼ� �α��� �Ǿ��ִ��� Ȯ���ϰ�
		HttpSession session=req.getSession();
		//session.setAttribute("UID", "bros");
		//session.setAttribute("UNICK", "������");
		
		String uid=(String)session.getAttribute("UID");
		//String unick=(String)session.getAttribute("UNICK");
		System.out.println("test"+uid);
		//�α��� ���̶�� �α������� �۾��� ����ſ� �����ش�
		if(uid==null || uid.length()==0) {
			//�α����� �ȵǾ������� �۾��� �� ��� �α������� �����ش�
			return "../Member/LoginForm.jsp";
		}else {
			//��
			//��
			//�α��� �� ������ �۾��� ���� ��������
			return "../VIEW/Product/UpdateForm.jsp";
		}
		
	}

}
