<%@ include file="header.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>


<style type="text/css">
	td
	{
		padding: 10px;
	}
</style>

<br>
	<br>
		<br>
			<br>
				<br>
					<br>
						<br>
							<%
							String email=(String)session.getAttribute("email");
						try
						{
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql="select *from history where remail=? order by datetime DESC";
							PreparedStatement st=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
							st.setString(1,email);
							
							ResultSet rs=st.executeQuery();

							%>
								<h3 style="color: blue;text-align: center;">Recieved Order list</h3>
								<br>
									<br>
										<%
							
							while(rs.next())
							{
							%>
							<br><br>
											<div class="container py-xl-5 py-lg-3" style="margin-top: -90px">
												<br>
												<div class="row address-row pt-lg-8">
													<div class="container">
														<div class="address-right">
															<center>
																<br><%
												String tsum=rs.getString(9);
												String sstatus=rs.getString(16).trim();
												String rresponse=rs.getString(15).trim();
												int orderid=rs.getInt(1);
												%>
																	<table border="2" class="table-striped" style="padding: 20">
																		<tr style="background-color: red">
																			<td>OrderId  :</td>
																			<td><%=rs.getInt(1)%>
																			</td>
																			<td>Restaurent Name :</td>
																			<td><%=rs.getString(4)%>
																			</td>
																		</tr>
																		<tr>
																			<td>Date & Time  :</td>
																			<td><%=rs.getString(10)%>
																			</td>
																			<td>Pay Mode :</td>
																			<td><%=rs.getString(14)%>
																			</td>
																		</tr>
																		<tr>
																			<td>Customer Address  :</td>
																			<td><%=rs.getString(12)%>
																			</td>
																			<td></td>
																			<td></td>
																		</tr>
																		<tr>
																			<td>Customer Name :</td>
																			<td><%=rs.getString(11)%>
																			</td>
																			<td>Customer Contact :</td>
																			<td><%=rs.getString(13)%>
																			</td>
																		</tr>
																		<tr style="color:red">
																			<td>Food name</td>
																			<td>price</td>
																			<td>quantity</td>
																			<td>amount</td>
																		</tr>
																		<%
													int nextorderid;
													
													
													do
													{
														
														
													%>
																		<tr>
																			<td><%=rs.getString(5)%>
																			</td>
																			<td><%=rs.getString(6)%>
																			</td>
																			<td><%=rs.getString(7)%>
																			</td>
																			<td><%=rs.getString(8)%>
																			</td>
																		</tr><%
													
													tsum=rs.getString(9);
													if(!rs.next())
													break;

													nextorderid=rs.getInt(1);
													
													}
													while(orderid == nextorderid);
													rs.previous();
													%>
																		<tr>
																			<td style="color: red">Total amount :</td>
																			<td></td>
																			<td></td>
																			<td><%=tsum%>
																			</td>
																		</tr>
																		<tr>
																			
																			<td style="color: red">Do You Want to Proceed this Order :</td>
																			<%if(rresponse.equals("waiting for confirmation")){%>
																			<td>
																				<a href="updatestatus.jsp?response=yes&orderid=<%=rs.getString(1)%>">
																					<button class="btn btn-success">Accept</button>
																				</a>&nbsp;&nbsp; 
																				<a href="updatestatus.jsp?response=no&orderid=<%=rs.getString(1)%>">
																					<button class="btn btn-danger">Reject</button>
																				</a>
																			</td>
																			<%}else{%>
																			<td><%=rresponse%></td>
																			<%}%>
																			<td></td>
																			<td>
																				<form action="rbill.jsp">
																					<input type="hidden" name="cemail" value="<%=rs.getString(2)%>">
																						<input type="hidden" name="orderid" value="<%=rs.getString(1)%>">
																							<button class="btn btn-primary">Generate Bill</button>
																						</form>
																					</td>
																				</tr>

																				<%if(rresponse.equals("order confirmed")){%>
																				<tr>
																					<td style="color: red">Previous status of order:</td>
																					<td><%=sstatus%></td>
																					<td></td>
																					<td></td>
																				</tr>


																				<%if(sstatus.equals("delivered")){}else{%>
																				<tr>
																					<form action="updatestatus.jsp">
																						<input type="hidden" name="orderid" value="<%=orderid%>">
																							<td style="color:red">Order Status:</td>
																							<td>Being Prepared      
																								<input type="radio" name="status" value="being prepared">
																								</td>
																								<td>On the Way    
																									<input type="radio" name="status" value="On the way">
																									</td>
																									<td>delivered     
																										<input type="radio" name="status" value="delivered">
																										</td>
																				</tr>
																				<tr>
																									<td></td>
																									<td></td>
																									<td></td>
																									<td>
																										<button class="btn btn-info">Update status</button>
																									</td>
																				</tr>
																					</form>
																				<%}%>

																				<%}%>

																				</table>
																								<br>
																								</center>
																							</div>

																							<br>
																						</div>
																					</div>
																				</div><%
												
							}
							
						}catch(Exception e)
							{

							}
%>
<%@include file="footer.jsp"%>																				