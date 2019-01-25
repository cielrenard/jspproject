package Sql;

/*
 * 이 클래스는 질의명령만 모아놓고 있다
 * 필요할 때 질의명령을 제공할 목적으로 만들어진 클래스이다
 * 
 * 각각의 질의 명령마다 고유한 코드값을 부여
 * 예)	방명록 등록 질의		1
 * 		방명록 검색 질의		2
 * 		코드값을 주면서   해당 질의명령을 달라고 요구하도록 하겠다
 */

public class GuestSql {

	
		public static String getSQL(int code) {
			//질의명령을 알려주는 함수.. 코드값을 알려주면 질의명령을 알려준다
			
			StringBuffer	buff = new StringBuffer();
			
			switch(code) {
			case	1:
					buff.append("INSERT INTO 	 Guest ");
					buff.append("VALUES( ");
					buff.append("				(	SELECT ");
					buff.append("				 		NVL(MAX(g_No),0)+1 ");
					buff.append("					FROM ");
					buff.append("						Guest) ");
					buff.append(" 			, ?, ?, SYSDATE)");
					break;
			case 2:
					buff.append("SELECT ");
					buff.append("		g_No			AS no, ");
					buff.append("		g_Writer		AS writer, ");
					buff.append("		g_Content	AS body, ");
					buff.append("		g_Date			AS wday ");
					buff.append("FROM ");
					buff.append("		Guest ");
					buff.append("ORDER BY ");
					buff.append("		g_No DESC");
					break;
			}
			
			return buff.toString();
		}
}










