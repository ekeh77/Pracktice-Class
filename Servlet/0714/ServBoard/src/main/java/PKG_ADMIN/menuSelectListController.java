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

import PKG_ADMIN_DAO.MenuListDAO;
import oracle.jdbc.OracleTypes;

@WebServlet("/Admin_SelectListMake")
public class menuSelectListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			String strProcName = "{call PKG_AD_MENUS.PROC_SELECTLIST_SEL(?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			
			csmt.registerOutParameter(1, OracleTypes.CURSOR);
			
			csmt.execute();
			
			ResultSet rs2 = (ResultSet)csmt.getObject(1); // SUBMENULIST
			
			ArrayList<MenuListDAO> subMenuList = new ArrayList<MenuListDAO>();
			
			while(rs2.next()) {
				
				MenuListDAO subMenu = new MenuListDAO();
				
				subMenu.setMenuID(rs2.getString("MENUID"));
				subMenu.setMenuName(rs2.getString("MENUNAME"));
				subMenu.setMenuSeq(rs2.getString("MENUSEQ"));
				subMenu.setMenuLvl(rs2.getString("MENULVL"));
				subMenu.setParentID(rs2.getString("PARENTID"));
				
				subMenuList.add(subMenu);
				
			}
			
			
			String strXML = "<?xml version='1.0' encoding='utf-8' ?>";
			strXML += "<submenulists>";
			for(MenuListDAO subMenu : subMenuList) {
				
				strXML += "<submenulist>";
				
				strXML += "<menuid>" + subMenu.getMenuID() + "</menuid>";
				strXML += "<menuname>" + subMenu.getMenuName() + "</menuname>";
				
				strXML += "</submenulist>";
			}
			strXML += "</submenulists>";
			
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/xml; charset=utf-8");
			
			PrintWriter writer = response.getWriter();
			writer.print(strXML);
			
			//request.setAttribute("subMenuList", subMenuList);
			//request.getRequestDispatcher("/02_admin/menu_list.jsp").forward(request, response);
			
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
		doGet(request, response);
	}
}
