package tm;
import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class login extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{ 
try
{
String email=rq.getParameter("email");
String password=rq.getParameter("password");
String user=rq.getParameter("user");
HttpSession session=rq.getSession();
if(user.equals("customer"))
{
			//DATABASE varify Class.forName();
			String sql="select *from customer where email=? and password=?";
			String url="jdbc:derby://localhost:1527/db";
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			Connection con=DriverManager.getConnection(url);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,email);
			st.setString(2,password);
			ResultSet rt=st.executeQuery();
			if(rt.next())
			{
				String name=rt.getString(1);
				session.setAttribute("email",email);
				session.setAttribute("user",user);
				session.setAttribute("name",name);
				session.setAttribute("path",rt.getString(6));
				
				st.close();
				con.close();
				rs.sendRedirect("index.jsp");
			}
			else
			{
				
				session.setAttribute("logout","Invalid email or password");
				st.close();
				con.close();
				rs.sendRedirect("index.jsp");
			}
}
else
{
				String sql="select *from radmin where email=? and password=?";
				String url="jdbc:derby://localhost:1527/db";
				Class.forName("org.apache.derby.jdbc.ClientDriver");
				Connection con=DriverManager.getConnection(url);
				PreparedStatement st=con.prepareStatement(sql);
				st.setString(1,email);
				st.setString(2,password);
				ResultSet rt=st.executeQuery();
				if(rt.next())
				{
					String name=rt.getString(1);
					
					session.setAttribute("name",name);
					session.setAttribute("email",email);
					session.setAttribute("user","radmin");
					session.setAttribute("path",rt.getString(6));
					
					st.close();
					con.close();
					rs.sendRedirect("restaurent_registration.jsp");
				}
				else
				{
					
					session.setAttribute("logout","Invalid email or password");
					st.close();
					con.close();
					rs.sendRedirect("index.jsp");
				}	
}


}catch(Exception exception)
{
System.out.println(exception);
}
}
}