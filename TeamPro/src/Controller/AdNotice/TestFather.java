package Controller.AdNotice;

/*이 클래스는 다형성 구현을 하기 위해서 사용할 상위 클래스 역할
 * 추상 함수가 존재하면 그 클래스는 반드시 추상 클래스로 만들어야 한다.
 */
public interface TestFather {
	//반드시 실행할 함수가 존재해야 한다.
	public abstract String execute();
	//이처럼 추상함수로 만들면 메모리 절약의 효과
	//반환값의 의미는 컨트롤러 클래스의 실행이 끝난 후 사용할 뷰 이름을 
	//스트링으로 알려주기로 약속한다.
}
