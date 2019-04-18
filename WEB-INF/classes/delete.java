package tm;
import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class delete extends HttpServlet
{
	public void service(HttpServletRequest request,HttpServletResponse response)
	{
		try{
		HttpSession session=request.getSession();
		String email=String(session.getAttribute("email"));
		String sql="delete from customer where email=?";
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/foodordering");
		PreparedStatement pt=con.prepareStatement(sql);
		pt.setString(1,email);
		ResultSet rs=pt.executeUpdate(sql);
		rs.close();
		pt.close();
		con.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}