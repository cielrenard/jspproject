package VO;

//VOŬ������ Value Object�� �����͸� �����ϱ� ���� Ŭ����
/*�׷��Ƿ� �� Ŭ������
 *1.�����͸� ����� ����
 *2.������ ������ setXXX,getXXX�Լ��� �غ�Ǿ�� �Ѵ�
 *
 *getXXX�Լ� JSTL���� �����͸� ����� �������� ������ �Ѵ�
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
