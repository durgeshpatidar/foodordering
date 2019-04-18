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
		String email=(String)session.getAttribute("email");
		String type=(String)session.getAttribute("user");
		String sql;
		if(type.equals("customer"))
		sql="delete from customer where email=?";
		else
		sql="delete from radmin where email=?";
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
		PreparedStatement pt=con.prepareStatement(sql);
		pt.setString(1,email);
		pt.executeUpdate();
		pt.close();
		con.close();
		session.invalidate();
		response.sendRedirect("index.jsp");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}