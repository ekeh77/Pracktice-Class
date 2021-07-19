package PKG_ADMIN;

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

import oracle.jdbc.OracleTypes;

@WebServlet("/Admin_AuthList_AJAX")
public class authListController_ajax extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//���Ѹ���Ʈ�� ���� �����͸� ��������
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1525:xe", "C##mngauth", "1");
			
			String strProcName = "{call PKG_AD_AUTH.PROC_AUTH_LIST(?,?)}";
			CallableStatement csmt = con.prepareCall(strProcName);
			
			csmt.setString(1, "");
			csmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			csmt.execute();
			ResultSet rs = (ResultSet)csmt.getObject(2);
			
			//xml로 만들자
			String strXML = "<?xml version='1.0' encoding='utf-8'  ?>";
			
			strXML += "<authLists>";
			
			strXML += "<authList>";
			strXML += "<authID>";
			strXML += "</authID>";
			strXML += "<authName>";
			strXML += "선택하세요";
			strXML += "</authName>";
			strXML += "</authList>";
			
			while(rs.next()) {
				
				strXML += "<authList>";
				strXML += "<authID>";
				strXML += rs.getString("AUTHID");
				strXML += "</authID>";
				strXML += "<authName>";
				strXML += rs.getString("AUTHNAME");
				strXML += "</authName>";
				strXML += "</authList>";
				
			}
			strXML += "</authLists>";
			
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/xml; charset=utf-8");
			
			PrintWriter writer = response.getWriter();
			writer.print(strXML);
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}

