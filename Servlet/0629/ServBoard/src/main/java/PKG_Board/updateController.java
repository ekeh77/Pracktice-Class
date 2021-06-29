package PKG_Board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardUpdate")
public class updateController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] strAdmins = request.getParameterValues("admin");
		String[] strIdxes = request.getParameterValues("idx");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##JavaDB", "1");
			Statement stmt = con.createStatement();
			
			
			for(int i=0; i<strAdmins.length; i++) {
				String strSql = "UPDATE BOARDS SET ADMIN = '" + strAdmins[i] + "' WHERE IDX= " + strIdxes[i];
				stmt.execute(strSql);
			}
			
			response.sendRedirect("/ServBoard/BoardList");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}
	
}
