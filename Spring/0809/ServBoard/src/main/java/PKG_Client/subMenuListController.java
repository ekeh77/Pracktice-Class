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

@WebServlet("/Client_SubMenuList")
public class subMenuListController extends HttpServlet{

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doPost(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      try {
         request.setCharacterEncoding("UTF-8");
         
         String strMainMenuID = request.getParameter("mainmenuid");
         
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
         
         String strProcName = "{call PKG_CL_MAINMENU.PROC_SUBMENU_SEL(?, ?)}";
         
         CallableStatement csmt = con.prepareCall(strProcName);
         csmt.setString(1, strMainMenuID);
         csmt.registerOutParameter(2, OracleTypes.CURSOR);
         
         csmt.execute();
         
         ResultSet rs = (ResultSet)csmt.getObject(2);      //
         
         //JSON 데이터로 만들기
         
         JSONObject submenus = new JSONObject();
         JSONArray submenuArr = new JSONArray();
         
         while(rs.next()) {
            
            
            JSONObject sRow = new JSONObject();
            sRow.put("MENUID", rs.getString("MENUID"));
            sRow.put("MENUNAME", rs.getString("MENUNAME"));
            sRow.put("MENULVL", rs.getString("MENULVL"));
            sRow.put("MENUSEQ", rs.getString("MENUSEQ"));
            sRow.put("PURL", rs.getString("PURL"));
            sRow.put("PFILENAME", rs.getString("PFILENAME"));

            
            submenuArr.add(sRow);
         }
         
         submenus.put("SUBMENULIST", submenuArr);
         
         response.setContentType("application/json; charset = UTF-8");
         
         PrintWriter writer = response.getWriter();
         
         writer.print(submenus.toJSONString());
         
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