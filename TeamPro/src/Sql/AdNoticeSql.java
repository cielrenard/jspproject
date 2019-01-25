package Sql;

//이 클래스는 질의명령을 보관.. 필요시 알려주는 기능을 가진 클래스

public class AdNoticeSql {

	//질의명령 코드를 가독성있게 부여하기 위해 코드값에 이름을 부여하자.
	public static final int SELECT_BOARDLIST=1;		//게시물 목록 검색
	public static final int SELECT_TOTALCOUNT=2; 	//총 원글 게시물 수
	public static final int INSERT_ORIBOARD=3;		//원글 등록
	public static final int UPDATE_HIT=4;					//총 조회수
	public static final int SELECT_DETAIL = 5;			//원글 상세보기
	public static final int	UPDATE_BOARD = 6;			//원글수정
	public static final int DELETE_BOARD = 7;			//원글삭제
	
	//질의명령을 달라는 요구하면 질의명령을 주는 함수
	public static String getSQL(int code) {
		StringBuffer buff=new StringBuffer();
		switch(code) {
		case 7:	//원글삭제(데이터는 남기기)
			buff.append("UPDATE ");
			buff.append("	notice ");
			buff.append("SET	");
			buff.append("	no_IsShow='N' ");
			buff.append("WHERE ");
			buff.append("	no_No=? ");
			break;
		case 6:	//원글수정
			buff.append("UPDATE ");
			buff.append("	notice ");
			buff.append("SET	");
			buff.append("	no_Title=?, ");
			buff.append("	no_Contents=? ");
			buff.append("WHERE ");
			buff.append("	no_No=?");
			break;
		case 5:	//원글 상세보기
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
		case 4://조회수 증가
			buff.append("UPDATE ");
			buff.append("	notice ");
			buff.append(" SET ");
			buff.append("	no_Look=no_Look+1 ");
			buff.append("Where ");
			buff.append("	no_NO=?");
			break;
		case 3://글 등록
			buff.append("INSERT INTO ");
			buff.append("	notice ");
			buff.append("VALUES((SELECT 	NVL(MAX(no_No),0)+1 FROM notice), ");
			buff.append("	?,?,?,SYSDATE,'file',0,'Y')");
			break;
		case 2://게시물 수
			buff.append("SELECT ");
			buff.append("	COUNT(*) AS CNT ");
			buff.append("FROM ");
			buff.append("	notice ");
			buff.append("WHERE ");
			buff.append("	no_IsShow='Y'");
			break;
		case 1:	//게시물 목록 검색
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
