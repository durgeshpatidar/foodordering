package tm;
import java.io.*;
import java.nio.file.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class rregister extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{
	try
	{
		String name=rq.getParameter("name");
		String address=rq.getParameter("address");
		String contact=rq.getParameter("contact");
		
		Part filePart=rq.getPart("fileToUpload");
		InputStream fileInputStream=filePart.getInputStream();

		String type=rq.getParameter("type");
		String category=rq.getParameter("category");
		
			String path="c:/tomcat9/webapps/foodordering/restaurent/"+name+"/"+filePart.getSubmittedFileName();
			File fileToSave=new File(path);
			path="restaurent/"+name+"/"+filePart.getSubmittedFileName();
			fileToSave.getParentFile().mkdirs();
			Files.copy(fileInputStream,fileToSave.toPath(),StandardCopyOption.REPLACE_EXISTING);

			HttpSession session=rq.getSession();

			String sql="insert into registration (name,image,address,contact,type,category,email) values (?, ?, ?, ?, ?,?,?)";
			String url="jdbc:derby://localhost:1527/db";
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			Connection con=DriverManager.getConnection(url);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,name);
			st.setString(2,path);
			st.setString(3,address);
			st.setString(4,contact);
			st.setString(5,type);
			st.setString(6,category);
			String email=(String)session.getAttribute("email");
			st.setString(7,email);
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