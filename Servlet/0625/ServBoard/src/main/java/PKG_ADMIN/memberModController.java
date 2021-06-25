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

@WebServlet("/Admin_ModMemberList")
public class memberModController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String[] strMemberIDs = request.getParameterValues("memberid");
		String[] strMemberNames = request.getParameterValues("membername");
		String[] strMemberAuthes = request.getParameterValues("auth");
		String[] strGBN = request.getParameterValues("gbn");
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			
			String strProcName = "{call PKG_AD_MEMBER.PROC_MEMBER_MOD(?,?,?,?)}"; 
			CallableStatement csmt = con.prepareCall(strProcName);
			
			for(int i=0; i<strMemberIDs.length; i++) {
				
				csmt.setString(1, strMemberIDs[i]);
				csmt.setString(2, strMemberNames[i]);
				csmt.setString(3, strMemberAuthes[i]);
				csmt.setString(4, strGBN[i]);
				csmt.execute();
				
			}
			
			con.close();
			con = null;
			
			response.sendRedirect("/ServBoard/Admin_MemList");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
