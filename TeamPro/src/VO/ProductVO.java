package VO;

//VO클래스는 Value Object로 데이터만 보관하기 위한 클래스
/*그러므로 이 클래스는
 *1.데이터를 기억할 변수
 *2.변수를 조작할 setXXX,getXXX함수가 준비되어야 한다
 *
 *getXXX함수 JSTL에서 데이터를 사용할 목적으로 만들어야 한다
 */
public class ProductVO {
	private int no;
	private String sen;
	private String pname;
	private String ex;
	private String ample;
	private String price;
	private String id;
	
	private int oriNo;
	private String cfile;
	
	//Getters Setters	
	public String getCfile() {
		return cfile;
	}
	public void setCfile(String cfile) {
		this.cfile = cfile;
	}
	public int getOriNo() {
		return oriNo;
	}
	public void setOriNo(int oriNo) {
		this.oriNo = oriNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSen() {
		return sen;
	}
	public void setSen(String sen) {
		this.sen = sen;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getEx() {
		return ex;
	}
	public void setEx(String ex) {
		this.ex = ex;
	}
	public String getAmple() {
		return ample;
	}
	public void setAmple(String ample) {
		this.ample = ample;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
