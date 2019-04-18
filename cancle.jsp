
				<%@ page import="java.sql.*" %>
				<%@ page import="java.io.*" %>
				<%@ page import="java.net.*" %>
				<%@ page import="javax.servlet.*" %>
				<%@ page import="javax.servlet.http.*" %>

<%
 String id=request.getParameter("orderid");
 id=id.trim();
 int orderid=Integer.parseInt(id); 
							try
							{
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql="update history set remail='null', response='order cancled by you' , status='no status' where orderid=?";
							PreparedStatement st=con.prepareStatement(sql);
							st.setInt(1,orderid);
							st.executeUpdate();
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
							response.sendRedirect("orderhistory.jsp"); 
							
	
%>
