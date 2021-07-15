package PKG_ADMIN;

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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import oracle.jdbc.OracleTypes;

@WebServlet("/Admin_AuthSubMenuList")
public class authSubMenuListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strSelectedAuthID = request.getParameter("selectedAuthID");
		String strSelectedMenuID = request.getParameter("selectedMenuID");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			String strProcName = "{call PKG_AD_AUTH_MENUS.PROC_SUBMENUS_SEL(?,?,?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			csmt.setString(1, strSelectedMenuID);
			csmt.setString(2, strSelectedAuthID);
			csmt.registerOutParameter(3, OracleTypes.CURSOR);
			
			csmt.execute();
			ResultSet rs = (ResultSet)csmt.getObject(3);
			
			//JSON DATA로 만들자
			
			JSONObject menus = new JSONObject();
			JSONArray menuArr = new JSONArray();
			
			while(rs.next()) {
			
				JSONObject menu = new JSONObject();
				menu.put("MENUID", rs.getString("MENUID"));
				menu.put("MENUNAME", rs.getString("MENUNAME"));
				menu.put("MENULVL", rs.getString("MENULVL"));
				menu.put("AUTH_SEL", rs.getString("AUTH_SEL"));
				menu.put("AUTH_INS", rs.getString("AUTH_INS"));
				menu.put("AUTH_UP", rs.getString("AUTH_UP"));
				menu.put("AUTH_DEL", rs.getString("AUTH_DEL"));
				
				menuArr.add(menu);
			}
			
			menus.put("MENUS", menuArr);
			
			response.setContentType("application/json; charset = UTF-8");
			
			PrintWriter writer = response.getWriter();
			writer.print(menus);
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
