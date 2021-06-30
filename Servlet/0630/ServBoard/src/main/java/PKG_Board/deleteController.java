package PKG_Board;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PKG_DAO.listDAO;
import oracle.jdbc.OracleTypes;

@WebServlet("/BoardDelete")
public class deleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//±€ªË¡¶
		String idx = request.getParameter("idx");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##JavaDB", "1");
			
			String strProcName = "{call PKG_BOARD.PROC_BOARD_DEL(?)}"; 
			
			CallableStatement csmt = con.prepareCall(strProcName);
			csmt.setInt(1, Integer.parseInt(idx));
			
			csmt.execute();
			
			response.sendRedirect("/ServBoard/BoardList");
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
