package Controller.Question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.DgSuperController;
import DAO.QuestionDAO;
import VO.QuestionVO;


public class QuesResult implements DgSuperController{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("여기를 못오는 거니 ?");
		HttpSession session= req.getSession();
		String id=(String)session.getAttribute("UID");
		System.out.println("String id="+id);
		
		String sum1 = req.getParameter("sum1").trim();
		String sum2 = req.getParameter("sum2").trim();		
		String sum3 = req.getParameter("sum3").trim();
		String sum4 = req.getParameter("sum4").trim();
		String sum5 = req.getParameter("sum5").trim();
		int su1 = Integer.parseInt(sum1);
		System.out.println(su1);
		int su2 = Integer.parseInt(sum2);
		System.out.println(su2);
		int su3 = Integer.parseInt(sum3);
		System.out.println(su3);
		int su4 = Integer.parseInt(sum4);
		System.out.println(su4);
		int su5 = Integer.parseInt(sum5);		
		System.out.println(su5);
		
		
		
		QuestionDAO dao = new QuestionDAO();
		dao.insertSum(id,su1,su2,su3,su4,su5);
		dao.close();
		
//		QuestionDAO dao1 = new QuestionDAO();
//		QuestionVO vo=dao1.selectResult(id);
//		System.out.println("class QuesResult selectResult()후");
//		dao1.close();
		
		req.setAttribute("USER", id);
		//req.setAttribute("RESULT", vo);
		System.out.println("USER 모델"+id);
		//System.out.println("RESULT 모델"+vo);
		
		return "../VIEW/Result/ResultPass.jsp";
	}

}
