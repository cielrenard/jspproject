package Controller.Question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import DAO.QuestionDAO;

public class Question04 implements DgSuperController{
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("4번 컨트롤러");
		String row = req.getParameter("sero").trim();
		System.out.println("sero파람값="+row);
		HttpSession session= req.getSession();

		String id=(String)session.getAttribute("UID");
		String sum1 = req.getParameter("sum1");
		String sum2 = req.getParameter("sum2");
		String sum3 = req.getParameter("sum3");
		
		String btn1 = req.getParameter("btn1").trim();
		String btn2 = req.getParameter("btn2").trim();
		String btn3 = req.getParameter("btn3").trim();
		String btn4 = req.getParameter("btn4").trim();
		String btn5 = req.getParameter("btn5").trim();
		String btn6 = req.getParameter("btn6").trim();
		String btn7 = req.getParameter("btn7").trim();
		String btn8 = req.getParameter("btn8").trim();
		String btn9 = req.getParameter("btn9").trim();
		String btn10 = req.getParameter("btn10").trim();
		int setio =Integer.parseInt(row);
		int bt1 = Integer.parseInt(btn1);
		int bt2 = Integer.parseInt(btn2);
		int bt3 = Integer.parseInt(btn3);
		int bt4 = Integer.parseInt(btn4);
		int bt5 = Integer.parseInt(btn5);
		int bt6 = Integer.parseInt(btn6);
		int bt7 = Integer.parseInt(btn7);
		int bt8 = Integer.parseInt(btn8);
		int bt9 = Integer.parseInt(btn9);
		int bt10 = Integer.parseInt(btn10);
		System.out.println(setio+","+btn1+","+btn2+","+btn3+","+btn4+","+btn5+","+btn6+","+btn7+","+btn8+","+btn9+","+btn10);

		
		QuestionDAO dao = new QuestionDAO();
			dao.insertAnswer(setio,id,bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9,bt10);
			int sum4 = dao.getSum(bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9,bt10);

			dao.close();

		req.setAttribute("USER", id);
		req.setAttribute("SUM1", sum1);
		req.setAttribute("SUM2", sum2);
		req.setAttribute("SUM3", sum3);
		req.setAttribute("SUM4", sum4);

		
		
		
			return "../VIEW/Question/Question05.jsp";
		
	}

}
