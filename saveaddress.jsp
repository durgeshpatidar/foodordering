
				<%@ page import="java.sql.*" %>
				<%@ page import="java.io.*" %>
				<%@ page import="java.net.*" %>
				<%@ page import="javax.servlet.*" %>
				<%@ page import="javax.servlet.http.*" %>

<%
 String email=(String)session.getAttribute("email");
 String address=request.getParameter("address");
 String name=request.getParameter("name");
 String contact=request.getParameter("contact");
 String btn=request.getParameter("btn");

 							
							try
							{
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql1="insert into deliveryaddress values(?,?,?,?)";
							String sql2="update deliveryaddress set address=? , name=? , contact=? where email=?";
							PreparedStatement st1=con.prepareStatement(sql1);
							PreparedStatement st=con.prepareStatement(sql2);
							if(btn.equals("save"))
							{
							
							st1.setString(1,email);
							st1.setString(2,address);
							st1.setString(3,name);
							st1.setString(4,contact);
							st1.executeUpdate();
							}
							else
							{
							st.setString(1,address);
							st.setString(2,name);
							st.setString(3,contact);
							st.setString(4,email);
							st.executeUpdate();
							}
							
							
							
							}catch(Exception e)
							{
								out.println(e);
							}
							response.sendRedirect("deliveryaddress.jsp"); 
							
	
%>
