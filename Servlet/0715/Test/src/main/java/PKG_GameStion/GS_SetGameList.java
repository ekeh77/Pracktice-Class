package PKG_GameStion;

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

@WebServlet("/GS_GameList")
public class GS_SetGameList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strGListName = request.getParameter("");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "games", "1");
			
			String strProcName = "{call PKG_GAMES_TBL.PROC_SHOW_GAMES(?,?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			csmt.setString(1, strGListName);
			csmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			csmt.execute();
			ResultSet rs = (ResultSet)csmt.getObject(2);
			
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
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
