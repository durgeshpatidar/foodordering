package tm;
import java.io.*;
import java.nio.file.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class register extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{
	try
	{
		String name=rq.getParameter("name");
		String email=rq.getParameter("email");
		String phone=rq.getParameter("phone");
		
		Part filePart=rq.getPart("fileToUpload");
		InputStream fileInputStream=filePart.getInputStream();

		String gender=rq.getParameter("gender");
		if(gender.equals("male"))
			gender="m";
		else
			gender="f";
		String password=rq.getParameter("password");
		String type=rq.getParameter("user");
		if(type.equals("customer"))
		{
			String path="c:/tomcat9/webapps/foodordering/upload/"+email+"/"+filePart.getSubmittedFileName();
			File fileToSave=new File(path);
			path="upload/"+email+"/"+filePart.getSubmittedFileName();
			fileToSave.getParentFile().mkdirs();
			Files.copy(fileInputStream,fileToSave.toPath(),StandardCopyOption.REPLACE_EXISTING);

			String sql="insert into customer (name,email,phone,gender,password,path) values (?, ?, ?, ?, ?,?)";
			String url="jdbc:derby://localhost:1527/db";
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			Connection con=DriverManager.getConnection(url);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,name);
			st.setString(2,email);
			st.setString(3,phone);
			st.setString(4,gender);
			st.setString(5,password);
			st.setString(6,path);
			st.executeUpdate();
			HttpSession session=rq.getSession();
			session.setAttribute("register","Invalid email or password");
			
			session.setAttribute("path",path);
			st.close();
			con.close();
			rs.sendRedirect("/foodordering/index.jsp");
		}
		else
		{
			String path="c:/tomcat9/webapps/foodordering/upload/"+email+"/"+filePart.getSubmittedFileName();
			File fileToSave=new File(path);
			
			path="upload/"+email+"/"+filePart.getSubmittedFileName();
			fileToSave.getParentFile().mkdirs();
			Files.copy(fileInputStream,fileToSave.toPath(),StandardCopyOption.REPLACE_EXISTING);


			String sql="insert into radmin (name,email,phone,gender,password,path) values (?, ?, ?, ?, ?,?)";
			String url="jdbc:derby://localhost:1527/db";
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			Connection con=DriverManager.getConnection(url);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,name);
			st.setString(2,email);
			st.setString(3,phone);
			st.setString(4,gender);
			st.setString(5,password);
			st.setString(6,path);
			st.executeUpdate();
			HttpSession session=rq.getSession();
			session.setAttribute("register","Invalid email or password");
			
			session.setAttribute("path",path);
			st.close();
			con.close();
			rs.sendRedirect("/foodordering/index.jsp");
		}
	}catch(Exception exception)
	{
	System.out.println(exception);
	}
}
}