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
import oracle.jdbc.OracleTypes;

@WebServlet("/Admin_AuthList")
public class authListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strAuthName = request.getParameter("authname");
		
		//���Ѹ���Ʈ�� ���� �����͸� ��������
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			String strProcName = "{call PKG_AD_AUTH.PROC_AUTH_LIST(?,?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			csmt.setString(1, strAuthName);
			csmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			csmt.execute();
			ResultSet rs = (ResultSet)csmt.getObject(2);
			
			ArrayList<AuthListDAO> authLists = new ArrayList<AuthListDAO>();
			
			while(rs.next()) {
				
				AuthListDAO authList = new AuthListDAO();
				authList.setAuthID(rs.getString("AUTHID"));
				authList.setAuthName(rs.getString("AUTHNAME"));
				
				authLists.add(authList);
				
			}
			
			con.close();
			con = null;
			
			request.setAttribute("authLists", authLists);
			
			request.getRequestDispatcher("/02_admin/auth_list.jsp").forward(request, response);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
