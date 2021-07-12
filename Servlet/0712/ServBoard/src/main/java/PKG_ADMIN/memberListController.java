package PKG_ADMIN;

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

import PKG_ADMIN_DAO.AuthListDAO;
import PKG_ADMIN_DAO.memberListDAO;
import oracle.jdbc.OracleTypes;

@WebServlet("/Admin_MemList")
public class memberListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strMemberName = request.getParameter("memberName");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			String strProcName = "{call PKG_AD_MEMBER.PROC_MEMBER_LIST(?,?,?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			csmt.setString(1, strMemberName);
			csmt.registerOutParameter(2, OracleTypes.CURSOR);
			csmt.registerOutParameter(3, OracleTypes.CURSOR);
			
			csmt.execute();
			ResultSet rs = (ResultSet)csmt.getObject(2);  // MEMBERLIST
			ResultSet rs2 = (ResultSet)csmt.getObject(3); //AUTHLIST
			
			ArrayList<memberListDAO> memberLists = new ArrayList<memberListDAO>();
			ArrayList<AuthListDAO> authLists = new ArrayList<AuthListDAO>();
			
			while(rs.next()) {
			
				memberListDAO memberList = new memberListDAO();
				memberList.setMID(rs.getString("MID"));
				memberList.setMName(rs.getString("MNAME"));
				memberList.setAuthID(rs.getString("AUTHID"));
				memberList.setAuthName(rs.getString("AUTHNAME"));
				
				memberLists.add(memberList);
				
			}
			
			while(rs2.next()) {
				
				AuthListDAO authList = new AuthListDAO();
				authList.setAuthID(rs2.getString("AUTHID"));
				authList.setAuthName(rs2.getString("AUTHNAME"));
				
				authLists.add(authList);
				
			}
			
			con.close();
			con = null;
			
			request.setAttribute("memberLists", memberLists);
			request.setAttribute("authLists", authLists);
			
			request.getRequestDispatcher("/02_admin/member_list.jsp").forward(request, response);
			
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
