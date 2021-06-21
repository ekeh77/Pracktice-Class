package PKG_Board;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardInsert")
public class BoardInsert extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strTitle = request.getParameter("title");
		String strContent = request.getParameter("content");
		
		//DB¿¬°á
		
		//1.Connection
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##JavaDB", "1");
			
			
			String strProcName = "{call PKG_BOARD.PROC_BOARD_INS(?,?,?,?)}"; 
			CallableStatement csmt = con.prepareCall(strProcName);
			
			csmt.setString(1, strTitle);
			csmt.setString(2, strContent);
			csmt.setString(3, "MEM001");
			csmt.setString(4, "M001");
			
			csmt.execute();
			
			con.close();
			con = null;
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/01_client/list.jsp").forward(request, response);
	}
	
}
