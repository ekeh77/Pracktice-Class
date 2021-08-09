package PKG_GameStion;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

import oracle.jdbc.OracleTypes;

@WebServlet("/GS_ChkLog")
public class GS_ChkLogin extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strGSID = request.getParameter("userID");
		String strGSPass = request.getParameter("userPass");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "games", "1");
			
			String strProcName = "{call PKG_CUSTOMERS_TBL.PROC_CHK_LOGIN(?,?,?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			csmt.setString(1, strGSID);
			csmt.setString(2, strGSPass);
			csmt.registerOutParameter(3, OracleTypes.CURSOR);
			
			csmt.execute();
			ResultSet rs = (ResultSet)csmt.getObject(3);
			rs.next();
			String Login = rs.getString("CHKYN");
			
			HttpSession session = request.getSession(true);
			
			if(Login.equals("Y")){
				session.setAttribute("user", strGSID);
				session.setAttribute("userName", rs.getString("CT_NAME"));
				response.sendRedirect("make_game_page/gameBuy.jsp?result=Y");
			}
			else{
				response.sendRedirect("make_game_page/gameBuy.jsp?result=N");
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
