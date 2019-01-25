package VO;

import java.sql.Date;

/*VOŬ������ Value Object�� �����͸� �����ϱ� ���� Ŭ����
 * �׷��Ƿ� �� Ŭ������ 
 * 1. �����͸� ����� ����
 * 2. ������ ������ setXxx, getXxx�Լ��� �غ�Ǿ�� �Ѵ�.
 * 
 * getXxx�Լ��� JSTL���� �����͸� ����� �������� ��������� �Ѵ�.
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
		//�ٹٲ� ��ȣ�� <br/>�� �ٲپ �����ϴ� get�Լ�
		//JSTL�� ������ �ƴ� get�Լ��� ����� �̿��ϹǷ�
		//������ �ʿ��ϴٸ� �����͸� ���氡���Ͽ� ó���ϸ� �ȴ�.
		//�ʿ��ϸ� get�Լ� ���� ����ϱ�.
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
		return writer;//+"��"
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	
	public String getTitleTest() {
		return title.substring(0,10)+"...";//String�̹Ƿ� ����.
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
