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

import Controller.DgSuperController;

@WebServlet("*.br")
public class DgDispatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, DgSuperController> map= new HashMap<String, DgSuperController>();
	public DgDispatch() {
		super();
	}


	public void init(ServletConfig config) throws ServletException {	
		Properties prop = new Properties();
		try {
			FileInputStream fin = 
					new FileInputStream("E:\\ProjectWorkspace\\Teampro\\src\\Dispatch\\DgDispatch.properties");
			prop.load(fin);
			Set<?> set = prop.keySet();
			Iterator<?>  iter = set.iterator();
			while(iter.hasNext()) {
				String key = (String)iter.next();
				String value=(String)prop.getProperty(key);
				try {
					Class<?> c =Class.forName(value);
					DgSuperController temp=(DgSuperController)c.newInstance();
					map.put(key, temp);
				}
				catch (Exception e) {
					System.out.println("error="+e);
					e.printStackTrace();
				}//catch
			}//while
		}catch(Exception e) {
			System.out.println(e);
		}//catch

	}//init()
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqPath = request.getServletPath();
		System.out.println("rePath= "+reqPath);
		if(map.containsKey(reqPath)) {
			DgSuperController controller = (DgSuperController)map.get(reqPath);		
			String view = controller.execute(request, response);
			try {
				RequestDispatcher rd = request.getRequestDispatcher(view);
				rd.forward(request, response);
			}catch(Exception e) {
				System.out.println(e);
			}
		}
		else {
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void destroy() {
	}
}








