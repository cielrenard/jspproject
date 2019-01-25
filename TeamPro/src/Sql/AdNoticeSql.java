package Sql;

//�� Ŭ������ ���Ǹ���� ����.. �ʿ�� �˷��ִ� ����� ���� Ŭ����

public class AdNoticeSql {

	//���Ǹ�� �ڵ带 �������ְ� �ο��ϱ� ���� �ڵ尪�� �̸��� �ο�����.
	public static final int SELECT_BOARDLIST=1;		//�Խù� ��� �˻�
	public static final int SELECT_TOTALCOUNT=2; 	//�� ���� �Խù� ��
	public static final int INSERT_ORIBOARD=3;		//���� ���
	public static final int UPDATE_HIT=4;					//�� ��ȸ��
	public static final int SELECT_DETAIL = 5;			//���� �󼼺���
	public static final int	UPDATE_BOARD = 6;			//���ۼ���
	public static final int DELETE_BOARD = 7;			//���ۻ���
	
	//���Ǹ���� �޶�� �䱸�ϸ� ���Ǹ���� �ִ� �Լ�
	public static String getSQL(int code) {
		StringBuffer buff=new StringBuffer();
		switch(code) {
		case 7:	//���ۻ���(�����ʹ� �����)
			buff.append("UPDATE ");
			buff.append("	notice ");
			buff.append("SET	");
			buff.append("	no_IsShow='N' ");
			buff.append("WHERE ");
			buff.append("	no_No=? ");
			break;
		case 6:	//���ۼ���
			buff.append("UPDATE ");
			buff.append("	notice ");
			buff.append("SET	");
			buff.append("	no_Title=?, ");
			buff.append("	no_Contents=? ");
			buff.append("WHERE ");
			buff.append("	no_No=?");
			break;
		case 5:	//���� �󼼺���
			buff.append("SELECT ");
			buff.append("	no_No 			AS no, ");
			buff.append("	m_Id 				AS writer, ");
			buff.append("	no_Title 			AS title, ");
			buff.append("	no_Contents		AS body, ");
			buff.append("	no_Look 			AS hit, ");
			buff.append("	no_Date			AS wday ");
			//buff.append(" 	no_File		AS nfile ");
			buff.append("FROM ");
			buff.append("	notice ");
			buff.append("WHERE ");
			buff.append("	no_No=? ");
			buff.append("	AND ");
			buff.append("	no_IsShow='Y'");
			break;
		case 4://��ȸ�� ����
			buff.append("UPDATE ");
			buff.append("	notice ");
			buff.append(" SET ");
			buff.append("	no_Look=no_Look+1 ");
			buff.append("Where ");
			buff.append("	no_NO=?");
			break;
		case 3://�� ���
			buff.append("INSERT INTO ");
			buff.append("	notice ");
			buff.append("VALUES((SELECT 	NVL(MAX(no_No),0)+1 FROM notice), ");
			buff.append("	?,?,?,SYSDATE,'file',0,'Y')");
			break;
		case 2://�Խù� ��
			buff.append("SELECT ");
			buff.append("	COUNT(*) AS CNT ");
			buff.append("FROM ");
			buff.append("	notice ");
			buff.append("WHERE ");
			buff.append("	no_IsShow='Y'");
			break;
		case 1:	//�Խù� ��� �˻�
			buff.append("SELECT ");
			buff.append("	no_No		AS	no, ");
			buff.append("	m_Id			AS	writer, ");
			buff.append("	no_Title		AS	title,	");
			buff.append("	no_Look		AS	hit, ");
			buff.append("	no_Date		AS	wday ");
			//buff.append(" 	no_File		AS nfile ");
			buff.append("FROM ");
			buff.append("	notice ");
			buff.append("WHERE ");
			buff.append("	no_IsShow='Y' ");
			buff.append("ORDER BY no_No DESC");
			break;
		}
		return buff.toString();
	}
	
}
