
<%@ page import="java.util.Random"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>

				<%@ page import="java.sql.*" %>
				<%@ page import="java.io.*" %>
				<%@ page import="java.net.*" %>
				<%@ page import="javax.servlet.*" %>
				<%@ page import="javax.servlet.http.*" %>




<%
String foodname=request.getParameter("foodname").trim();
String email=(String)session.getAttribute("email");
if(email==null)
response.sendRedirect("index.jsp");
							
							try
							{
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql="delete from menu where email=? and name=?";
							PreparedStatement st=con.prepareStatement(sql);
							st.setString(2,foodname);
							st.setString(1,email);
							
							st.executeUpdate();
							}catch(Exception e)
							{
								out.println(e);
							}


response.sendRedirect("restaurent_menu.jsp"); 	
%>
