package PKG_GameStion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import oracle.jdbc.OracleTypes;

@WebServlet("/GS_BuyGames")
public class GS_BuyGame extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String CTID = request.getParameter("CTID");
		int	sumPrice = 0;

		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "games", "1");
			
			String strProcName = "{call PKG_CUSTOMERBAG.PROC_SELECTCTBAG(?,?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			csmt.setString(1, CTID);
			csmt.registerOutParameter(2, OracleTypes.CURSOR);
				
			csmt.execute();
				
			ResultSet rs = (ResultSet)csmt.getObject(2);	
			//JSON DATA로 만들자
			
			JSONObject gameBuyLists = new JSONObject();
			JSONArray gameBuyListArr = new JSONArray();
			
			while(rs.next()) {
			
				JSONObject gameBuyList = new JSONObject();
				
				gameBuyList.put("G_ID", rs.getString("G_ID"));
				gameBuyList.put("G_NAME", rs.getString("G_NAME"));
				gameBuyList.put("G_SALES_PRICE", rs.getString("G_SALES_PRICE"));
				gameBuyList.put("G_PRICE_ALL",sumPrice += Integer.parseInt(rs.getString("G_SALES_PRICE")));
				gameBuyListArr.add(gameBuyList);
			}
			
			gameBuyLists.put("GAMEBUYLISTS", gameBuyListArr);
			
			response.setContentType("application/json; charset = UTF-8");
			
			PrintWriter writer = response.getWriter();
			writer.print(gameBuyLists);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
}
