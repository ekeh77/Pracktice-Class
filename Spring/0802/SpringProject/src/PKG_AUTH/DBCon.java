package PKG_AUTH;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;

public class DBCon {

   public DBCon() {
      
   }
   
   public Connection getCon() {
      
      Connection con = null;
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
   
   public ResultSet dbSelect(String procName) {
      
      Connection con = getCon();
      
      String strProcName = "{call PKG_AD_AUTH.PROC_AUTH_LIST(?, ?)}";
      
      CallableStatement csmt = con.prepareCall(strProcName);
      csmt.setString(1, "");
      csmt.registerOutParameter(2, OracleTypes.CURSOR);
      
      csmt.execute();
      
      ResultSet rs = (ResultSet)csmt.getObject(2);
      
      return rs;
   }
   
   public void dbInsert() {
      
      
   }
   
   public void dbUpdate() {
      
   }
   
   public void dbDelete() {
      try {
         
         Connection con = getCon();
         
         String strProcName = "{call PKG_AD_AUTH.PROC_AUTH_DEL(?)}";
         
         CallableStatement csmt = con.prepareCall(strProcName);
         csmt.setString(1, "");
         
         csmt.execute();
         
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      
   }
   
}
