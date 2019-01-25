package Sql;

//이 클래스는 질의명령을 보관..필요시 알려주는 기능을 가진 클래스

public class MemberSql {

	//질의명령 코드 가독성있게 부여하기 위해 코드값에 이름을 부여하자
	public static final int MEMBER_CHECK = 1;	//회원체크
	public static final int MEMBER_IDCHECK = 2;
	public static final int MEMBER_LOGIN=3;
	public static final int MEMBER_SEARCH_ID=4;
	public static final int MEMBER_SEARCH_PW=5;
	public static final int MEMBER_JOININSERT=6;
	public static final int ADMIN_MEMBER_COUNT=7;
	public static final int ADMIN_MEMBER_LIST=8;
	public static final int ADMIN_MEMBER_UPDATE_SELECT=9;
	public static final int ADMIN_MEMBER_UPDATE=10;
	public static final int ADMIN_MEMBER_DELETE=11;

	
	//질의명령을 달라는 요구하면 질의명령을 주는 함수
	public static String getSQL(int code) {
		
		StringBuffer buff = new StringBuffer();
		 
		switch(code) {
		case 11:
			buff.append("	DELETE	");
			buff.append("	FROM	");
			buff.append("	member	");
			buff.append("	WHERE	");
			buff.append("	m_id=?	");
	
			break;
		case 10:
			buff.append("	UPDATE ");
			buff.append("	member ");
			buff.append("	SET ");
			buff.append("	m_name=?, ");
			buff.append("	m_jumin=?,	");
			buff.append("	m_phone=?,	");
			buff.append("	m_add=?, ");
			buff.append("	m_email=? ");
			buff.append("	WHERE ");
			buff.append("	m_id=?	");
			break;
		case 9:
			buff.append("	select	");
			buff.append("	m_id,	");
			buff.append("	m_name,	");
			buff.append("	m_jumin,	");
			buff.append("	m_phone,	");
			buff.append("	m_add,	");
			buff.append("	m_email	");
			buff.append("	from	");
			buff.append("	member	");
			buff.append("	where	");
			buff.append("	m_id=?	");
			break;
			
		case 8:
			buff.append("SELECT ");
			buff.append("(SELECT Count(m_id) FROM MEMBER) AS CNT, ");
			buff.append("	m_id,	");
			buff.append("	m_name,	");
			buff.append("	m_jumin,	");
			buff.append("	m_phone,	");
			buff.append("	m_add,	");
			buff.append("	m_email,	");
			buff.append("	m_grade	");
			buff.append("FROM ");
			buff.append("	MEMBER ");
			buff.append("	WHERE	");
			buff.append("	m_grade=1	");
			buff.append("ORDER BY M_NAME DESC");
			break;
			
		case 7:
			buff.append("SELECT ");
			buff.append("	COUNT(*) AS cnt ");
			buff.append("FROM ");
			buff.append("	member ");
			break;
			
		case 6: 
			buff.append("	insert	");
			buff.append("	into	");
			buff.append("	member	");
			buff.append("	(m_ID, m_NAME, m_PW, m_jumin, m_add, m_phone, m_EMAIL, m_GRADE)	");
			buff.append("	values	");
			buff.append("	(?,?,?,?,'서울',?,?,?)	");
			break;
		case 5:
			buff.append("	select	");
			buff.append("	m_pw	");
			buff.append("	from	");
			buff.append("	member	");
			buff.append("	where	");
			buff.append("	m_name=?	");
			buff.append("	and	");
			buff.append("	m_id=?	");
			buff.append("	and	");
			buff.append("	m_email=?	");
			break;
			
		case 4:
			buff.append("	select	");
			buff.append("	m_id	");
			buff.append("	from	");
			buff.append("	member	");
			buff.append("	where	");
			buff.append("	m_name=?	");
			buff.append("	and	");
			buff.append("	m_email=?	");
			break;
			
		case 3:
			buff.append("	select	");
			buff.append("	m_id,	");
			buff.append("	m_pw,	");
			buff.append("	m_grade	");
			buff.append("	from	");
			buff.append("	member	");
			buff.append("	where	");
			buff.append("	m_id=?	");
			break;
		
		case 2: //MEMBER_IDCHECK
		
			buff.append("	select	");
			buff.append("	m_id	");
			buff.append("	from	");
			buff.append("	member	");
			buff.append("	where	");
			buff.append("	m_id=?	");
			break;
			
		case 1:  //MEMBER_CHECK
			buff.append("	SELECT ");
			buff.append("	m_name,	");
			buff.append("	m_jumin,	");
			buff.append("	m_phone	");
			buff.append("	FROM ");
			buff.append("	member ");
			buff.append(" where ");
			buff.append(" m_name=? ");
			buff.append(" and ");
			buff.append(" m_jumin=? ");
			buff.append(" and ");
			buff.append(" m_phone=? ");
			break;
		}
		return 	buff.toString();
	}
	
	
}
