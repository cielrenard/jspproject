package Sql;


public class ProductSql {
	

	public static final int SELECT_PRODUCTLIST = 1;		//
	public static final int SELECT_TOTALCOUNT = 2; 		//
	public static final int INSERT_ORIPRODUCT = 3;		//
	public static final int SELECT_DETAIL = 4;			//
	public static final int UPDATE_PRODUCT = 5;			//
	public static final int DELETE_PRODUCT = 6; 		//
	
	
	public static String getSQL(int code) {
		
		StringBuffer buff = new StringBuffer();
		
		switch(code) {
		case 1: 
			buff.append("SELECT ");
			buff.append("	p_No		AS	no, ");
			buff.append("	p_Sen		AS	sen, ");
			buff.append("	p_Name		AS	pname, ");
			buff.append("	p_Price 	AS	price, ");
			buff.append("	m_Id		AS	id, ");
			buff.append("	p_Img	AS	cfile ");
			buff.append(" FROM ");
			buff.append("	Product ");
			buff.append("WHERE ");
			buff.append("	p_IsShow='Y' ");
			buff.append("ORDER By p_No ASC");
			
			break;
			
		case 2: 
			buff.append("SELECT ");
			buff.append("	count(*)	AS 	no ");
			buff.append("FROM ");
			buff.append("	Product ");
			buff.append("WHERE ");
			buff.append(" 	p_IsShow='Y'");
			
			break;
			
		case 3: 
			buff.append("INSERT INTO ");
			buff.append("	Product ");
			buff.append("VALUES((SELECT NVL(MAX(p_No),0)+1 FROM Product), ");
			buff.append("	?,?,?,?,?,?,'Y',?)");
			
			break;
			
		case 4: 
			buff.append("SELECT ");
			buff.append("	p_No		AS	no, ");
			buff.append("	p_Sen		AS	sen, ");
			buff.append("	p_Name		AS	pname, ");
			buff.append("	p_Ex		AS	ex, ");
			buff.append("	p_Ample		AS	ample, ");
			buff.append("	p_Price		AS	price, ");
			buff.append("	m_Id		AS	id, ");	
			buff.append("	p_Img	AS	cfile  ");
			buff.append(" FROM ");
			buff.append("	Product ");
			buff.append("WHERE ");
			buff.append("	p_No=? ");
			buff.append("	AND ");
			buff.append("	p_IsShow='Y'");
			
			break;
			
		case 5: 
			buff.append("UPDATE ");
			buff.append("	Product ");
			buff.append("SET ");
			buff.append("	p_Sen=?, ");
			buff.append("	p_Name=?, ");
			buff.append("	p_Ex=?, ");
			buff.append("	p_Ample=?, ");
			buff.append("	p_Price=?, ");
			buff.append("	m_Id=?, ");
			buff.append("	p_Img=? ");
			buff.append(" WHERE ");
			buff.append("	p_No=? ");
			
			break;
			
		case 6: 
			buff.append("UPDATE ");
			buff.append("	Product ");
			buff.append("SET ");
			buff.append("	p_IsShow='N' ");
			buff.append("WHERE ");
			buff.append("	p_No=? ");
			buff.append("	AND ");
			buff.append("	m_Id=?");
			
			break;
		}
		return buff.toString();		
	}
}
