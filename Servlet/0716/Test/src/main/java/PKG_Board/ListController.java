package PKG_Board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardList")
public class ListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strPage = request.getParameter("pageName");
		
		String[] strs = new String[5];
		
		strs[0] = "aaaa";
		strs[1] = "bbbb";
		strs[2] = "cccc";
		strs[3] = "dddd";
		strs[4] = "eeee";
		
		String[] strs2 = new String[5];
		
		strs2[0] = "aaaa";
		strs2[1] = "bbbb";
		strs2[2] = "cccc";
		strs2[3] = "dddd";
		strs2[4] = "eeee";
		
		ArrayList arr = new ArrayList();
		arr.add(strs);
		arr.add(strs2);
		
		
		
		request.setAttribute("rows", arr);
		request.setAttribute("row2", strs2);
		request.getRequestDispatcher("/SERBoard/" + strPage).forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
