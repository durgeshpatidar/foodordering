package tm;
import java.io.*;
import java.nio.file.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class addmenu extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{
	try
	{
		String name=rq.getParameter("name");
		String price=rq.getParameter("price");
		String quantity=rq.getParameter("quantity");
		
			HttpSession session=rq.getSession();
			String email=(String)session.getAttribute("email");
			String sql="insert into menu (name,price,quantity,email) values (?, ?, ?, ?)";
			String url="jdbc:derby://localhost:1527/db";
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			Connection con=DriverManager.getConnection(url);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,name);
			st.setString(2,price);
			st.setString(3,quantity);
			st.setString(4,email);
			st.executeUpdate();
			st.close();
			con.close();
			rs.sendRedirect("/foodordering/restaurent_menu.jsp");
		
	}catch(Exception exception)
	{
	System.out.println(exception);
	}
}
}