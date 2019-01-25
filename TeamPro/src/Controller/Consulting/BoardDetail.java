package Controller.Consulting;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Controller.DgSuperController;
import Sql.ConsultingSql;
import Util.POOLUtil;
import VO.ConsultingVO;

public class BoardDetail implements DgSuperController{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
                   
        String strNo = req.getParameter("oriNo");        
        int oriNo = Integer.parseInt(strNo);
        System.out.println("oriNo="+oriNo);
        
        
        String nowPage = req.getParameter("nowPage");        
        
        
        boolean isHit = false;        
        HttpSession session = req.getSession();
        ArrayList<Integer> list = (ArrayList<Integer>)session.getAttribute("SHOW");
         
        if(list==null || list.size()==0    ) {
            
            isHit = true;
            list = new ArrayList<Integer>();
            list.add(oriNo);
            session.setAttribute("SHOW", list);
        }
        else if(list.contains(oriNo)) {
           
            isHit = false;
        }
        else    {
           
            isHit = true;
            list.add(oriNo);
            session.setAttribute("SHOW",list);
        }
        ConsultingVO vo = new ConsultingVO();
        POOLUtil db = new POOLUtil();
        Connection con = db.getCon();
        String sql = ConsultingSql.getSQL(ConsultingSql.UPDATE_HIT);            System.out.println("sql="+sql);
        PreparedStatement stmt = db.getSTMT(con, sql);
        
        try {
            
            stmt.setInt(1, oriNo);
            if(isHit==true) {
                stmt.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("Update_hit�떎�뻾 �뿉�윭"+e);
        }
        
        
        sql = ConsultingSql.getSQL(ConsultingSql.SELECT_DETAIL);
        System.out.println("�긽�꽭蹂닿린SQL="+sql);
        stmt = db.getSTMT(con, sql);
        try {
			stmt.setInt(1, oriNo);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			vo.setNo(rs.getInt("NO"));
			vo.setWriter(rs.getString("WRITER"));
			vo.setTitle(rs.getString("TITLE"));
			vo.setBody(rs.getString("BODY"));
			vo.setWday(rs.getDate("WDAY"));
			vo.setHit(rs.getInt("HIT"));
		
			db.close(rs);
		} catch (SQLException e) {
			System.out.println("�긽�꽭 蹂닿린 �떎�뻾 �뿉�윭"+e);			
		}
       
        sql = ConsultingSql.getSQL(6);
        System.out.println(sql);
        stmt = db.getSTMT(con, sql);
        ArrayList<ConsultingVO> list1 = new ArrayList<ConsultingVO>();        
        try {
        	stmt.setInt(1, oriNo);
        	ResultSet rs = stmt.executeQuery();        	
        	while(rs.next()) {
        		ConsultingVO rvo =new ConsultingVO();
        		rvo.setNo(rs.getInt("NO"));
        		rvo.setOriNo(rs.getInt("ORINO"));
        		rvo.setWriter(rs.getString("WRITER"));
        		rvo.setTitle(rs.getString("TITLE"));
        		rvo.setBody(rs.getString("BODY"));
        		rvo.setWday(rs.getDate("WDAY"));
        		
        		list1.add(rvo);        		
        	}
        	db.close(rs);
        }
        catch(Exception e) {
        	System.out.println("�뙎湲�寃��깋 �떎�뻾 �뿉�윭 "+e);
        }
        db.close(stmt);
        db.close(con);        
        req.setAttribute("DVIEW", vo); 
        req.setAttribute("REPLY", list1);        
        req.setAttribute("nowPage", nowPage);        
       
        return "../VIEW/Consulting/BoardDetail.jsp";
    }

}



