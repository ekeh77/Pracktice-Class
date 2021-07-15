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


import PKG_ADMIN_DAO.MenuListDAO;
import oracle.jdbc.OracleTypes;

@WebServlet("/Admin_MenuList")
public class menuListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strMainMenuName = request.getParameter("mainMenuName");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			String strProcName = "{call PKG_AD_MENUS.PROC_MAINMENUS_SEL(?,?,?,?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			csmt.setString(1, "");
			csmt.setString(2, strMainMenuName);
			csmt.registerOutParameter(3, OracleTypes.CURSOR);
			csmt.registerOutParameter(4, OracleTypes.CURSOR);
			
			csmt.execute();
			ResultSet rs = (ResultSet)csmt.getObject(3);  // MAINMENULIST
			

			ArrayList<MenuListDAO> mainMenuList = new ArrayList<MenuListDAO>();
			
			while(rs.next()) {
				
				MenuListDAO mainMenu = new MenuListDAO();
				
				mainMenu.setMenuID(rs.getString("MENUID"));
				mainMenu.setMenuName(rs.getString("MENUNAME"));
				mainMenu.setMenuSeq(rs.getString("MENUSEQ"));
				mainMenu.setMenuLvl(rs.getString("MENULVL"));
		
				mainMenuList.add(mainMenu);
				
			}			
			
			con.close();
			con = null;
			
			request.setAttribute("mainMenuList", mainMenuList);

			request.getRequestDispatcher("/02_admin/menu_list.jsp").forward(request, response);
			
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
