package VO;

import java.sql.Date;

public class ConsultingVO {
	
	private 	int		no;
	private 	String	writer;
	private 	String	title;
	private		Date 	wday;	
	private 	int		hit;
	private		String	body;	
	private		int 	oriNo;
	
	
				
	public String getBody() {
		
		return body;
	}
	public String getBrBody() {
		
		String temp =body;
			if(temp!=null && temp.length()!=0) {
				temp = temp.replaceAll("\r\n", "<br/>");
				
			}
		return temp;
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
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}	
	public String getTitleTest() {
		return title.substring(0,10)+"...";
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWday() {
		return wday;
	}
	public void setWday(Date wday) {
		this.wday = wday;
	}
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getOriNo() {
		return oriNo;
	}
	public void setOriNo(int oriNo) {
		this.oriNo = oriNo;
	}

	
	
}
