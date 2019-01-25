package Sql;

/*
 * �� Ŭ������ ���Ǹ�ɸ� ��Ƴ��� �ִ�
 * �ʿ��� �� ���Ǹ���� ������ �������� ������� Ŭ�����̴�
 * 
 * ������ ���� ��ɸ��� ������ �ڵ尪�� �ο�
 * ��)	���� ��� ����		1
 * 		���� �˻� ����		2
 * 		�ڵ尪�� �ָ鼭   �ش� ���Ǹ���� �޶�� �䱸�ϵ��� �ϰڴ�
 */

public class GuestSql {

	
		public static String getSQL(int code) {
			//���Ǹ���� �˷��ִ� �Լ�.. �ڵ尪�� �˷��ָ� ���Ǹ���� �˷��ش�
			
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










