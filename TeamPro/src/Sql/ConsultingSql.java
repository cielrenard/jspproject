package Sql;



public class ConsultingSql {


	public static final int SELECT_BOARDLIST = 1;			
	public static final int SELECT_TOTALCOUNT = 2;		
	public static final int INSERT_ORIBOARD = 3; 			
	public static final int UPDATE_HIT = 4;							
	public static final int SELECT_DETAIL = 5;							
	public static final int UPDATE_BOARD = 6;				
	public static final int DELETE_BOARD = 7;

	public static String getSQL(int code) {
		
		StringBuffer buff = new StringBuffer();

		switch(code) {		
		case 7:
			buff.append(" UPDATE  ");
			buff.append("	Consulting ");
			buff.append(" SET ");
			buff.append("	cons_Isshow='N'	");
			buff.append(" where ");
			buff.append("	cons_no=? ");
			break;
		case 6:
			buff.append(" UPDATE ");
			buff.append(" 		Consulting ");
			buff.append(" SET ");
			buff.append("		cons_title  = ?, ");
			buff.append(" 		cons_contents  = ? ");			
			buff.append(" where ");
			buff.append("	cons_no=?   ");
			break;
		
		case 5:
			buff.append("SELECT ");
			buff.append("		cons_No			as no,	");
			buff.append("		m_id		as writer, ");
			buff.append("		cons_Title			as title,	");
			buff.append("		cons_Contents	as body, ");
			buff.append("		cons_Date		as wday, ");
			buff.append("		cons_look			as hit	");
			buff.append(" from ");
			buff.append("	Consulting ");
			buff.append(" where ");
			buff.append("	cons_no=? ");
			buff.append("	and ");
			buff.append("	cons_isshow='Y'");
			break;
		case 4:
			buff.append("UPDATE ");
			buff.append("	Consulting ");
			buff.append("SET ");
			buff.append("	cons_look=cons_look+1 ");
			buff.append("WHERE ");
			buff.append("	cons_No=?");
			break;
		case 3: 
			buff.append("INSERT INTO ");
			buff.append("	Consulting ");
			buff.append("VALUES((SELECT  NVL(MAX(cons_No),0)+1 FROM Consulting), ");
			buff.append("        ?,?,?,SYSDATE,'0',0,'Y')");
			break;
		case 2:	
			buff.append("SELECT ");
			buff.append("	COUNT(*) AS cnt ");
			buff.append("FROM ");
			buff.append("	Consulting ");
			buff.append("WHERE ");
			buff.append("	cons_IsShow='Y'");
			break;
		case 1:  
			buff.append("SELECT ");
			buff.append("	cons_No			AS	no, ");
			buff.append("	m_id		AS	writer, ");
			buff.append("	cons_Title		AS	title, ");
			buff.append("	cons_look			AS	hit, ");
			buff.append("	cons_Date			AS	wday ");		
			buff.append("FROM ");
			buff.append("	Consulting ");		
			buff.append("WHERE ");
			buff.append("	cons_IsShow='Y' ");
			buff.append("ORDER BY cons_No DESC");
			break;
		}
		return 	buff.toString();
	}


}
