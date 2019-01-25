package VO;

import java.sql.Date;

/*VO클래스는 Value Object로 데이터만 보관하기 위한 클래스
 * 그러므로 이 클래스는 
 * 1. 데이터를 기억할 변수
 * 2. 변수를 조작할 setXxx, getXxx함수가 준비되어야 한다.
 * 
 * getXxx함수는 JSTL에서 데이터를 사용할 목적으로 만들어져야 한다.
 */
public class NoticeVO {
	private int		no;
	private String 	writer;
	private String 	title;
	private int 		hit;
	private Date 	wday;
	private String 	body;
	
	private String	pw;
	private String 	grade;
	
	private String 	nfile;


	public String getNfile() {
		return nfile;
	}

	public void setNfile(String nfile) {
		this.nfile = nfile;
	}

	public String getBrBody() {
		//줄바꿈 기호를 <br/>로 바꾸어서 응답하는 get함수
		//JSTL은 변수가 아닌 get함수의 결과를 이용하므로
		//앞으로 필요하다면 데이터를 변경가공하여 처리하면 된다.
		//필요하면 get함수 만들어서 사용하기.
		String temp = body;
		if(temp!=null && temp.length()!=0) {
			temp = temp.replaceAll("\n", "<br/>");
		}
		return temp;
	}
	
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;//+"님"
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	
	public String getTitleTest() {
		return title.substring(0,10)+"...";//String이므로 가능.
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getWday() {
		return wday;
	}
	public void setWday(Date wday) {
		this.wday = wday;
	}
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
}
