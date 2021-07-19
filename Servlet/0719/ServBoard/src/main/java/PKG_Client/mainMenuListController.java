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

@WebServlet("/Client_MainMenuList")
public class mainMenuListController extends HttpServlet{

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doPost(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      try {
         request.setCharacterEncoding("UTF-8");
         
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
         
         String strProcName = "{call PKG_CL_MAINMENU.PROC_MAINMENU_SEL(?)}";
         
         CallableStatement csmt = con.prepareCall(strProcName);
         csmt.registerOutParameter(1, OracleTypes.CURSOR);
         
         csmt.execute();
         
         ResultSet rs = (ResultSet)csmt.getObject(1);      //
         
         //JSON 데이터로 만들기
         
         JSONObject mainmenus = new JSONObject();
         JSONArray mainmenuArr = new JSONArray();
         
         while(rs.next()) {
            
            JSONObject mRow = new JSONObject();
            
            mRow.put("MENUID", rs.getString("MENUID"));
            mRow.put("MENUNAME", rs.getString("MENUNAME"));

            
            mainmenuArr.add(mRow);
         }
         
         mainmenus.put("MAINMENULIST", mainmenuArr);
         
         response.setContentType("application/json; charset = UTF-8");
         
         PrintWriter writer = response.getWriter();
         
         writer.print(mainmenus.toJSONString());
         
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