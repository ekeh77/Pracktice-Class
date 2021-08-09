package PKG_GameStion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import oracle.jdbc.OracleTypes;

@WebServlet("/GS_InsertBag")
public class GS_InsertBag extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] gameID = request.getParameterValues("GLchk");
		String CTID = request.getParameter("ctID");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "games", "1");
			
			String strProcName = "{call PKG_CUSTOMERBAG.PROC_INSERTBAG(?,?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			for(var i = 0; i<gameID.length; i++) {

				csmt.setString(1, CTID);
				csmt.setString(2, gameID[i]);
				
				csmt.execute();
				
			}
			
			response.sendRedirect("make_game_page/gameBuy_BuyList.jsp");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
