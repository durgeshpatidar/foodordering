
				<%@ page import="java.sql.*" %>
				<%@ page import="java.io.*" %>
				<%@ page import="java.net.*" %>
				<%@ page import="javax.servlet.*" %>
				<%@ page import="javax.servlet.http.*" %>

<%
 String name=request.getParameter("name");
 String email=request.getParameter("email");
 String message=request.getParameter("message");
 							
							try
							{
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql="insert into contact values(?,?,?)";
							PreparedStatement st=con.prepareStatement(sql);
							st.setString(1,name);
							st.setString(2,email);
							st.setString(3,message);
							st.executeUpdate();
							
							}catch(Exception e)
							{
								out.println(e);
							}
							response.sendRedirect("index.jsp"); 
							
	
%>
