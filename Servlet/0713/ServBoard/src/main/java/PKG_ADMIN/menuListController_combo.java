package PKG_ADMIN;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import PKG_ADMIN_DAO.MenuListDAO;
import oracle.jdbc.OracleTypes;

@WebServlet("/Admin_MenuList_combo")
public class menuListController_combo extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			String strProcName = "{call PKG_CL_MAINMENU.PROC_MENU_SEL(?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			csmt.registerOutParameter(1, OracleTypes.CURSOR);
			
			csmt.execute();
			
			ResultSet rs = (ResultSet)csmt.getObject(1);  // MAINMENULIST
			
			JSONObject menus = new JSONObject();
			JSONArray menuArr = new JSONArray();
			
			while(rs.next()) {
				
				JSONObject menu = new JSONObject();
				menu.put("MENUID", rs.getString("MENUID"));
				menu.put("MENUNAME", rs.getString("MENUNAME"));
				
				menuArr.add(menu);
				
			}			
			
			menus.put("MENUS", menuArr);
			
			
			response.setContentType("application/json; charset = UTF-8");
			
			PrintWriter writer = response.getWriter();
			writer.print(menus);
			
			con.close();
			con = null;

			
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
