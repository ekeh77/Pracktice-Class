package PKG_GameStion;

import java.io.IOException;
import java.io.PrintWriter;
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
		String[] gameID = request.getParameterValues("GLchk");

		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "games", "1");
			
			Statement stmt = con.createStatement();
			
			
			String strSql = "SELECT G_NAME, G_SALES_PRICE FROM GAMES_TBL WHERE G_ID='" + gameID[0] + "' ";
			for(var i=1; i<gameID.length; i++) {
				strSql +="OR G_ID='" + gameID[i] + "'";	
				
			}
			
			ResultSet rs = stmt.executeQuery(strSql);
			
			int sumPrice = 0;
			//JSON DATA로 만들자
			
			JSONObject gameBuyLists = new JSONObject();
			JSONArray gameBuyListArr = new JSONArray();
			
			while(rs.next()) {
			
				JSONObject gameBuyList = new JSONObject();
				
				gameBuyList.put("G_NAME", rs.getString("G_NAME"));
				gameBuyList.put("G_SALES_PRICE", rs.getString("G_SALES_PRICE"));
				gameBuyList.put("G_PRICE_ALL",sumPrice += Integer.parseInt(rs.getString("G_SALES_PRICE")));
				gameBuyListArr.add(gameBuyList);
			}
			
			gameBuyLists.put("GAMEBUYLISTS", gameBuyListArr);
			
			request.setAttribute("data", gameBuyLists);
			
			request.getRequestDispatcher("make_game_page/gameBuy_BuyList.jsp").forward(request, response);
			//JSON 오브젝트의 값을 가지고 gameBuy_BuyList.jsp로 이동
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
}
