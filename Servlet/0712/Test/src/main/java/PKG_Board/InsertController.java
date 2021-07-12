package PKG_Board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardInsert")
public class InsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strTitle = request.getParameter("title");
		
		//DB���� ������ �����ϰ�
		
		request.setAttribute("title", strTitle);
		
		RequestDispatcher  r = request.getRequestDispatcher("/SERBoard/list.jsp");
				
		r.forward(request, response);
	}
	
	
}
