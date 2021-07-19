package PKG_Client;

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

@WebServlet("/TEST_AUTH")
public class testAuthController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 try {
			 
			 String loginID = request.getParameter("memberID");
			 String strSelectedMenuID = request.getParameter("menuID");
			 			 
	         request.setCharacterEncoding("UTF-8");
	         
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
	         
	         String strProcName = "{call PKG_CL_MAINMENU.PROC_EACH_AUTH(?, ?, ?)}";
	         
	         CallableStatement csmt = con.prepareCall(strProcName);
	         csmt.setString(1, loginID);
	         csmt.setString(2, strSelectedMenuID);
	         csmt.registerOutParameter(3, OracleTypes.CURSOR);
	         
	         csmt.execute();
	         
	         ResultSet rs = (ResultSet)csmt.getObject(3);      //
	         
	         //JSON 데이터로 만들기
	         
	         JSONObject auths = new JSONObject();
	         JSONArray authuArr = new JSONArray();
	         
	         while(rs.next()) {
	            
	            
	            JSONObject authRow = new JSONObject();
	            authRow.put("MID", rs.getString("MID"));
	            authRow.put("AUTHID", rs.getString("AUTHID"));
	            authRow.put("MENUID", rs.getString("MENUID"));
	            authRow.put("AUTH_SEL", rs.getString("AUTH_SEL"));
	            authRow.put("AUTH_INS", rs.getString("AUTH_INS"));
	            authRow.put("AUTH_UP", rs.getString("AUTH_UP"));
	            authRow.put("AUTH_DEL", rs.getString("AUTH_DEL"));

	            
	            authuArr.add(authRow);
	         }
	         
	         auths.put("MENU_AUTHES", authuArr);
	         
	         response.setContentType("application/json; charset = UTF-8");
	         
	         PrintWriter writer = response.getWriter();
	         
	         writer.print(auths.toJSONString());
	         
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


		
		
	
	
}
