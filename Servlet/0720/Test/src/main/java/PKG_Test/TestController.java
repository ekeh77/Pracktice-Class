package PKG_Test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Test")
public class TestController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String getId = req.getParameter("id");
		String getPass = req.getParameter("password");
		
		req.setAttribute("ID", getId);
		req.setAttribute("PASS", getPass);
		
		req.getRequestDispatcher("/Test/result.jsp").forward(req, resp);
	}
	
}
