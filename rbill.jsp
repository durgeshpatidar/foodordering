<%@ include file="header.jsp"%>
		<%@ page import="java.sql.*" %>
		<%@ page import="java.io.*" %>
		<%@ page import="java.net.*" %>
		<%@ page import="javax.servlet.*" %>
		<%@ page import="javax.servlet.http.*" %>

							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>

						<%

						try
						{
							
							String orderid=(String)request.getParameter("orderid");
														
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql="select *from history where orderid=?";
							PreparedStatement st=con.prepareStatement(sql);
							st.setString(1,orderid);
							
							ResultSet rs=st.executeQuery();
							while(rs.next())
							{
							%>
							<div class="container py-xl-5 py-lg-3" style="margin-top: -90px">	
								<div class="row address-row pt-lg-8">
									<div class="container">
										<div class="address-right">
											<center>
											<br>
											<h3 style="color: blue">Your Order bill</h3><br>
											<table class="table table-striped">
												<tr><td>OrderId  :</td><td><%=rs.getInt(1)%></td><td>Restaurent Name :</td><td><%=rs.getString(4)%></td></tr>
												<tr><td>Customer Name :</td><td><%=rs.getString(11)%></td><td>Customer contact no :</td><td><%=rs.getString(13)%></td></tr>
												<tr><td>Customer address :</td><td><%=rs.getString(12)%></td><td></td><td></td></tr>
												<tr><td>Date & Time  :</td><td><%=rs.getString(10)%></td><td>Pay Mode :</td><td><%=rs.getString(14)%></td></tr>
												
												<%
												String tsum=rs.getString(9);
												%>
												<tr style="color:red"><td>Food name</td><td>price</td><td>quantity</td><td>amount</td></tr>
												<%
												do
												{
												%>

													<tr><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td></tr>	
													<%
												}while(rs.next());
												%>
												<tr><td>Total amount :</td><td></td><td></td><td><%=tsum%></td></tr>
												<tr><td></td><td></td><td><button class="btn btn-primary" onclick="window.print()">Print</button></td><td></td></tr>
											</table>
										</center>
										</div>
									</div>
								</div>
							</div>

							<%
							}
						}catch(Exception e)
							{
								e.printStackTrace();
							}
%>
<%@ include file="footer.jsp"%>