package PKG_20210623;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PKG_20210623DAO.listDAO;

@WebServlet("/goList")
public class listController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "games", "1");
			
			String strSql = "SELECT * FROM GAMES_TBL";
			
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery(strSql);
			
			ArrayList<listDAO> arr = new ArrayList<listDAO>();
			
			while(rs.next()) {
				
				listDAO list = new listDAO();
				list.setG_ID(rs.getString("G_ID"));
				list.setG_NAME(rs.getString("G_NAME"));
				list.setG_MAKER(rs.getString("G_MAKER"));
				list.setG_RELEASE(rs.getString("G_RELEASE"));
				list.setG_SALES_PRICE(rs.getString(4));
				list.setG_SUPPLY_PRICE(rs.getString(5));
				list.setG_GENRE(rs.getString(6));
				
				arr.add(list);
			}
			
			con.close();
			con = null;
			
			request.setAttribute("list", arr);
			
			request.getRequestDispatcher("/20210623/list.jsp").forward(request, response);
			
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
		
	}
}
