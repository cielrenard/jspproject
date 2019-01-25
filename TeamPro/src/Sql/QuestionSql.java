package Sql;

public class QuestionSql {

	public static final int INSERT_ANSWER 		= 1;
	public static final int SELECT_QUESTION  	= 2;
	public static final int INSERT_SUM			= 3;
	public static final int SELECT_RESULT 		= 4;
	public static final int QUESTION_DEL		= 5;

		
	
public static String getSQL(int code) {
		
		StringBuffer buff = new StringBuffer();


		switch(code) {	
		case 5:
			buff.append("DELETE ");
			buff.append(" Q_ANS ");
			buff.append(" WHERE ");
			buff.append(" M_ID=? ");
			break;			
		case 4:
			buff.append(" 	SELECT 	");
			buff.append(" 	rno,	");
			buff.append("	m_id	as id, ");
			buff.append("	res1,	");
			buff.append("	res2,	");
			buff.append("	res3,	");
			buff.append("	res4,	");
			buff.append("	res5,	");
			buff.append("	resultdate	as wday   ");
			buff.append("	FROM	");
			buff.append("	RESULT	");
			buff.append("	WHERE m_id=? 	");
			buff.append("	and rno=(SELECT MAX(rno) from RESULT) 	");
			break;
			
		case 3:
			buff.append("INSERT INTO ");
			buff.append(" result(rno,m_id,res1,res2,res3,res4,res5,resultdate) ");
			buff.append("VALUES");
			buff.append("((SELECT  NVL(MAX(rno),0)+1 FROM result),?,?,?,?,?,?,sysdate)");
			break;
		case 2:
			buff.append("SELECT	");
			buff.append("  m_id 	as	id, ");
			buff.append("  sectio	as	setio, ");
			buff.append("  ans1,	");
			buff.append("  ans2,	");
			buff.append("  ans3,	");
			buff.append("  ans4,	");
			buff.append("  ans5,	");
			buff.append("  ans6,	");
			buff.append("  ans7,	");
			buff.append("  ans8,	");
			buff.append("  ans9,	");
			buff.append("  ans10	");
			buff.append(" FROM Q_ANS where m_id=? ");
			break;
		case 1:
			buff.append("insert  into q_ans values ");
			buff.append(" (?,?,?,?,?,?,?,?,?,?,?,?)");
			break;
		}
		return 	buff.toString();
	}
}
