
				<%@ page import="java.sql.*" %>
				<%@ page import="java.io.*" %>
				<%@ page import="java.net.*" %>
				<%@ page import="javax.servlet.*" %>
				<%@ page import="javax.servlet.http.*" %>

<%
 String orderid=(String)request.getParameter("orderid");
 String status=request.getParameter("status");
 String respons=request.getParameter("response");
 if(respons!=null)
{
 if(respons.equals("yes"))
 	respons="order confirmed";
 else
 	respons="order cancled by restaurent";
 }
 String sql="";
 							
							try
							{
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
								if(respons==null)
								sql="update history set status=? where orderid=?";
								else
								sql="update history set response=? where orderid=?";
							PreparedStatement st=con.prepareStatement(sql);
							st.setString(2,orderid);
								if(respons==null)
								st.setString(1,status);
								else
								st.setString(1,respons);
							st.executeUpdate();
							
							}catch(Exception e)
							{
								out.println(e);
							}
							response.sendRedirect("recived_order.jsp"); 
							
	
%>
