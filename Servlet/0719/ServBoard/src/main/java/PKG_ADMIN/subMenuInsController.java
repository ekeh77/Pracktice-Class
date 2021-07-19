package PKG_ADMIN;

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

@WebServlet("/Admin_InsSubMenu")
public class subMenuInsController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String strMenuName = request.getParameter("insSubMenuName");
		String strMenuSeq = request.getParameter("insSubMenuSeq");
		String strMenuLvl = request.getParameter("insSubMenuLvl");
		String strparentID = request.getParameter("subinsparentID");
		
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			
			String strProcName = "{call PKG_AD_MENUS.PROC_SUBMENU_INS(?,?,?,?)}"; 
			CallableStatement csmt = con.prepareCall(strProcName);
				
			csmt.setString(1, strMenuName);
			csmt.setString(2, strMenuSeq);
			csmt.setString(3, strMenuLvl);
			csmt.setString(4, strparentID);
			csmt.execute();
			
			con.close();
			con = null;
			
			response.sendRedirect("/ServBoard/Admin_MenuList");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
