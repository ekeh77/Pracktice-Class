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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import PKG_ADMIN_DAO.AuthListDAO;
import oracle.jdbc.OracleTypes;

@WebServlet("/Admin_ProgramList")
public class programListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
					
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
					
					String strProcName = "{call PKG_AD_PROGRAM.PROC_PROGRAM_LIST(?,?)}";
					CallableStatement csmt = con.prepareCall(strProcName);
					
					csmt.setString(1, "");
					csmt.registerOutParameter(2, OracleTypes.CURSOR);
					
					csmt.execute();
					ResultSet rs = (ResultSet)csmt.getObject(2);
					
					//JSON DATA로 만들자
					
					JSONObject programs = new JSONObject();
					JSONArray programArr = new JSONArray();
					
					while(rs.next()) {
					
						JSONObject pRow = new JSONObject();
						pRow.put("PID", rs.getString("PID"));
						pRow.put("MENUID", rs.getString("MENUID"));
						pRow.put("PNAME", rs.getString("PNAME"));
						pRow.put("PURL", rs.getString("PURL"));
						pRow.put("PFILENAME", rs.getString("PFILENAME"));
						
						programArr.add(pRow);
					}
					
					programs.put("PROGRAMS", programArr);
					
					response.setContentType("application/json; charset = UTF-8");
					
					PrintWriter writer = response.getWriter();
					writer.print(programs);
					
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
	}
}
