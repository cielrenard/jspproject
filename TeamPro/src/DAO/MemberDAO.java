package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Sql.MemberSql;
import Util.POOLUtil;
import Util.PageUtil;
import VO.MemberVO;

public class MemberDAO {

	private POOLUtil db;
	private Connection con;

	public MemberDAO() {
		db = new POOLUtil();
		con = db.getCon();
	}

	public int insertMember(MemberVO dto) {
		String sql = MemberSql.getSQL(MemberSql.MEMBER_JOININSERT);
		PreparedStatement stmt = db.getSTMT(con, sql);
		int temp = 0;
		try {

			stmt.setString(1, dto.getM_id());
			stmt.setString(2, dto.getM_name());
			stmt.setString(3, dto.getM_pw());
			stmt.setString(4, dto.getM_jumin());
			// stmt.setString(5,"서울");
			stmt.setString(5, dto.getM_phone());
			stmt.setString(6, dto.getM_email());
			stmt.setInt(7, dto.getM_grade());

			temp = stmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("댓글 등록질의 실행 에러 = " + e);
		}
		db.close(stmt);
		return temp;
	}

	public MemberVO serchPW(String name, String id, String email) {
		String sql = MemberSql.getSQL(MemberSql.MEMBER_SEARCH_PW);// user가 입력한 id값에 해당하는 pw1조회
		PreparedStatement stmt = db.getSTMT(con, sql);

		MemberVO dto = new MemberVO();

		try {
			stmt.setString(1, name);
			stmt.setString(2, id);
			stmt.setString(3, email);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				dto.setM_pw(rs.getString("m_pw"));
			}

			db.close(rs);

		} catch (Exception e) {
			System.out.println(e);
		}
		db.close(stmt);

		return dto;
	}

	public MemberVO serchID(String name, String email) {

		String sql = MemberSql.getSQL(MemberSql.MEMBER_SEARCH_ID);// user가 입력한 id값에 해당하는 pw1조회

		PreparedStatement stmt = db.getSTMT(con, sql);

		MemberVO dto = new MemberVO();

		try {
			stmt.setString(1, name);
			stmt.setString(2, email);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				dto.setM_id(rs.getString("m_id"));
			}

			db.close(rs);

		} catch (Exception e) {
			System.out.println(e);
		}
		db.close(stmt);

		return dto;
	}

	// 메서드의 param으로 id,pw를 받습니다.
	public int getMember(String id, String pw) {

		String sql = MemberSql.getSQL(MemberSql.MEMBER_LOGIN);// user가 입력한 id값에 해당하는 pw1조회
		PreparedStatement stmt = db.getSTMT(con, sql);

		int flag = -1;

		try {
			stmt.setString(1, id);

			ResultSet rs = stmt.executeQuery();

			// 만약 위의 id가 맞다면 하나의 row가 반환됩니다.

			if (rs.next()) { // user가 입력한 id가 db에 저장되어있디
				// param으로 넘어온 암호와 값이 같은지 비교..
				if (pw.equals(rs.getString("m_pw"))) {
					if(rs.getInt("m_grade")==0){
						flag = 2; // id와 암호 모두 같음...
					}
					else {
						flag = 1;
					}
				} else {
					flag = 0; // id는 맞으나 암호가 틀림...
				}
			} else {
				flag = -1;// 이 부부은 반환된 result가 없다라는 뜻.따라서 id 자체가 없거나 틀림.
			}

			db.close(rs);

		} catch (Exception e) {
			System.out.println(e);
		}
		db.close(stmt);

		return flag;

	}

	public MemberVO idCheck(String id) {
		String sql = MemberSql.getSQL(MemberSql.MEMBER_IDCHECK);
		PreparedStatement stmt = db.getSTMT(con, sql);
		// 결과물을 담기위한 변수
		MemberVO dto = new MemberVO();

		try {
			stmt.setString(1, id);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				dto.setM_id(rs.getString("m_id"));
			} else {
				dto = null;
			}

			db.close(rs);
		} catch (Exception e) {
			System.out.println(e);
		}
		db.close(stmt);
		return dto;
	}

	public MemberVO checkMember(String name, String ssn, String hp) {
		String sql = MemberSql.getSQL(MemberSql.MEMBER_CHECK);
		PreparedStatement stmt = db.getSTMT(con, sql);
		// 결과물을 담기위한 변수
		MemberVO dto = new MemberVO();

		try {
			stmt.setString(1, name);
			stmt.setString(2, ssn);
			stmt.setString(3, hp);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				dto.setM_name(rs.getString("m_name"));
				dto.setM_jumin(rs.getString("m_jumin"));
				dto.setM_phone(rs.getString("m_phone"));
			} else {
				dto = null;
			}

			db.close(rs);
		} catch (Exception e) {
			System.out.println(e);
		}
		db.close(stmt);
		return dto;
	}

	// ------------------------------------------------------------------------------
	public int memberGetCount() {

		String sql = MemberSql.getSQL(MemberSql.ADMIN_MEMBER_COUNT);

		int temp = 0;

		try {

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				temp = rs.getInt(1);
			}
			db.close(rs);
			db.close(stmt);

		} catch (Exception e) {
			System.out.println(e);
		}

		return temp;

	}

	

	public MemberVO getMemberAdmin(String id) {

		String sql = MemberSql.getSQL(MemberSql.ADMIN_MEMBER_UPDATE_SELECT);
		PreparedStatement stmt = db.getSTMT(con, sql);

		MemberVO dto = new MemberVO();

		try {
			stmt.setString(1, id);

			ResultSet rs = stmt.executeQuery();

			rs.next();

			dto.setM_id(rs.getString("m_id"));
			dto.setM_name(rs.getString("m_name"));
			dto.setM_jumin(rs.getString("m_jumin"));
			dto.setM_phone(rs.getString("m_phone"));
			dto.setM_add(rs.getString("m_add"));
			dto.setM_email(rs.getString("m_email"));

			db.close(rs);

		} catch (Exception e) {
			System.out.println("실행에러=" + e);
		}
		db.close(stmt);

		return dto;
	}

	public void updatemember(String id, String name, String jumin, String phone, String add, String email) {
		String sql = MemberSql.getSQL(MemberSql.ADMIN_MEMBER_UPDATE);
		PreparedStatement stmt = db.getSTMT(con, sql);
		System.out.println(sql);
		try {

			stmt.setString(1, name);
			stmt.setString(2, jumin);
			stmt.setString(3, phone);
			stmt.setString(4, add);
			stmt.setString(5, email);
			stmt.setString(6, id);

			System.out.println(name);
			System.out.println(jumin);
			System.out.println(phone);
			System.out.println(add);
			System.out.println(email);
			System.out.println(id);

			stmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("실행 에러=" + e);
		}
		db.close(stmt);

	}

	public int deletemember(String id) {
		String sql = MemberSql.getSQL(MemberSql.ADMIN_MEMBER_DELETE);
		PreparedStatement stmt = db.getSTMT(con, sql);
		int change = 0;

		try {
			stmt.setString(1, id);

			// update질의명령을 실행한 후 변화된 데이터 개수를 알아내서
			// 1이면 한개가 수정된 것이고
			// 0이면 수정되지 않은 것이다
			change = stmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("실행 에러=" + e);
		}
		db.close(stmt);
		return change;

	}

	
	public void close() {
		db.close(con);
	}
}
