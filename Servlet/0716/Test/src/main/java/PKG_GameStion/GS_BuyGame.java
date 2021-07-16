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
			
			String strSql = "SELECT * FROM GAMES_TBL;";
			//String strSql = "SELECT G_NAME, G_SALES_PRICE FROM GAMES_TBL WHERE G_ID='G005' OR G_ID='G016';";
			
			ResultSet rs = stmt.executeQuery(strSql);;
			
			/*
			String strSql = "SELECT G_NAME, G_SALES_PRICE FROM GAMES_TBL WHERE G_ID='" + gameID[0] + "' ";
			for(var i=1; i<gameID.length; i++) {
				strSql +="OR G_ID='" + gameID[i] + "'";	
			}
			strSql += ";";
			*/
			
			
			
			/*					
			//JSON DATA로 만들자
			
			JSONObject gameLists = new JSONObject();
			JSONArray gameListArr = new JSONArray();
			
			while(rs.next()) {
			
				JSONObject gameList = new JSONObject();
				gameList.put("G_ID", rs.getString("G_ID"));
				gameList.put("G_NAME", rs.getString("G_NAME"));
				gameList.put("G_MAKER", rs.getString("G_MAKER"));
				gameList.put("G_RELEASE", rs.getString("G_RELEASE"));
				gameList.put("G_SALES_PRICE", rs.getString("G_SALES_PRICE"));
				gameList.put("G_GENRE", rs.getString("G_GENRE"));
				
				gameListArr.add(gameList);
			}
			
			gameLists.put("GAMELISTS", gameListArr);
			
			response.setContentType("application/json; charset = UTF-8");
			
			PrintWriter writer = response.getWriter();
			writer.print(gameLists);
			*/
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
}
