package Dispatch;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.BrSuperController;
import Controller.ServiceForward;

@WebServlet("*.brs")
public class BrDispatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //요청 내용과 실제 실행 가능한 클래스를 저장할 Map변수
	private HashMap<String, BrSuperController> map= new HashMap<String, BrSuperController>();
	
    public BrDispatch() {
        super();
    }

    //초기화 함수 
	public void init(ServletConfig config) throws ServletException {	
		// Properties를 이용해서 파일안의 데이터를 읽어서 Map으로 만들어 놓는다
		// 1) 읽을 파일에 연결된 InputStrem, Reader를 만든다
		//	2) load 함수를 이용해서 Map으로 생성한다
		Properties prop = new Properties();
		
		try {
			FileInputStream fin = 
					new FileInputStream("E:\\\\ProjectWorkspace\\\\Teampro\\\\src\\\\Dispatch\\\\BrDispatch.properties");
			//문제
			// 웹 서버가 관리하는 일반 파일의 경로는 일반 서블릿에서는 사용할 수 없다
			// 풀 경로를 이용해서 파일경로로 써줘야 한다
			
			prop.load(fin);
			
			//prop가 가지고 있는 모든 키값을 Set으로 변환시킨다
			Set<?> set = prop.keySet();
			
			//Set으로 변환된 데이터를 Iterator사용해서 꺼낸다
			Iterator<?>  iter = set.iterator();
			while(iter.hasNext()) {
				//키값을 하나씩 꺼낸다
				String key = (String)iter.next();
				//키값에 해당하는 실제 데이터(문자열로 된 컨트롤러)를 알아낸다
				String value=(String)prop.getProperty(key);
				//실행이 불가능한 클래스(문자열)이므로 실행 가능한 클래스로 변경해 놓는다
				//문제	알아낸 컨트롤러는 문자열 형태
				//			문자열로된 클래스는 new시킬수 없으므로
				//			실제 실행 가능한 클래스로 만들어야 한다
					try {
						// 1) 문자열로 된 클래스이름을 이용해서 실제 클래스를 알아낸다
						Class<?> c =Class.forName(value);
						
						// 2) 이 클래스를 실행 가능하도록 new시킨다
						BrSuperController temp=(BrSuperController)c.newInstance();
						
						//실행가능한 클래스를 서비스함수에 요청이 오면 실행해야 하므로
						//map에 등록해 놓자
						map.put(key, temp);
					}
					catch (Exception e) {
						System.out.println("실행 클래스 변환 에러="+e);
						e.printStackTrace();
					}//catch
			}//while
			
		}catch(Exception e) {
			System.out.println("파일이 없어용="+e);
		}//catch
		
	}//init()

	//실제요청이 들오면
	//할일 	해당 요청에 대한 컨트롤러를 준비된 Map 알아낸다 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청을 알아낸다
		String reqPath = request.getServletPath();
		System.out.println("요청 = "+reqPath);
		
		//요청에 대한 사용컨트롤러 알아낸다
		//만약 요청내용이 잘못되면 사용할 컨트롤러가 없게 되므로
		// 에러 페이지를 보여줄 수 있도록 하자
		if(map.containsKey(reqPath)) {
			BrSuperController controller = (BrSuperController)map.get(reqPath);		
			
			//실행
			ServiceForward view = controller.execute(request, response);
			
			//실행이 끝났으므로 뷰를 호출한다
			try {
				
				RequestDispatcher rd = request.getRequestDispatcher(view.getPath());
				rd.forward(request, response);
			}catch(Exception e) {
				System.out.println("뷰 호출 에러="+e);
			}
		}
		else {
			//요청내용에 준비된 컨트롤러가 없으므로 준비된 에러페이지를 보여주자
			//response.sendRedirect("에러페이지");//여러분이 에러페이지만들자
		}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void destroy() {
	}
}








