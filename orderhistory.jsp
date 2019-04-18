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
String email=(String)session.getAttribute("email");
						try
						{
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql="select *from history where useremail=? order by datetime DESC";
							PreparedStatement st=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
							st.setString(1,email);
							
							ResultSet rs=st.executeQuery();

							%>
							<h3 style="color: blue;text-align: center;">Order History</h3><br>
							<br>
							<br><%
							
							while(rs.next())
							{
							%>
							<div class="container py-xl-5 py-lg-3 table-responsive" style="margin-top: -90px">	
								<div class="row address-row pt-lg-8 " >
									<div class="container">
										<div class="address-right table-responsive">
											<center>
											<br>
											
											
												<%
												String tsum=rs.getString(9);
												int orderid=rs.getInt(1);
												%>
												<table class="table table-striped">
												<tr style="background-color: red"><td>OrderId  :</td><td><%=rs.getInt(1)%></td><td>Restaurent Name :</td><td><%=rs.getString(4)%></td></tr>
												<tr><td>Date & Time  :</td><td><%=rs.getString(10)%></td><td>Pay Mode :</td><td><%=rs.getString(14)%></td></tr>
												<tr style="color:red"><td>Food name</td><td>price</td><td>quantity</td><td>amount</td></tr>

													
													<%
													String remail="";
													int nextorderid;
													do
													{
													%>
													<tr><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td></tr>
													<%
													
													tsum=rs.getString(9);
													remail=rs.getString(3);
													if(!rs.next())
													break;

													nextorderid=rs.getInt(1);
													}
													while(orderid == nextorderid);
													rs.previous();
													%>
													<tr><td>Total amount :</td><td></td><td></td><td><%=tsum%></td></tr>
													<tr><td style="color:red">Response By restaurent:</td><td><%=rs.getString(15)%></td><td></td><td></td></tr>
													<tr>
														<td style="color:red">Your Order current status:</td><td><%=rs.getString(16)%></td>
														<%String sts=rs.getString(16).trim();
														String rsp=rs.getString(15).trim();
													if(sts.equals("delivered") || rsp.equals("order cancled by you") || sts.equals("On the way") || rsp.equals("order cancled by restaurent")){
														out.println("<td></td><td></td>");
													}else{%>
														<td style="color:red">If you want to cancle</td>
														<td>
															<form action="cancle.jsp" >
															<input type="hidden" name="orderid" value="<%=orderid%>">
															<button class="btn btn-danger" onclick='javascript:return confirm("are you sure want to cancle this order");'>cancle</button></td>
															</form>
															<%}%>
													</tr>

											</table>
											<br><br>
											</center>
										</div>
									</div>
								</div>
							</div>
										
							<%
												
							}
						}catch(Exception e)
							{

							}
%>


	<!-- Js files -->
	<!-- JavaScript -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- Default-JavaScript-File -->

	<!-- banner slider -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function () {
			// Slideshow 4
			$("#slider3").responsiveSlides({
				auto: true,
				pager: true,
				nav: false,
				speed: 500,
				namespace: "callbacks",
				before: function () {
					$('.events').append("<li>before event fired.</li>");
				},
				after: function () {
					$('.events').append("<li>after event fired.</li>");
				}
			});

		});
	</script>
	<!-- //banner slider -->

	<!-- password-script -->
	<script>
		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}

	</script>
	<!-- //password-script -->

	<!-- gallery light box -->
	<script src="js/smoothbox.jquery2.js"></script>
	<!-- //gallery light box -->

	<!-- smooth scrolling -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smooth scrolling -->

	<!-- move-top -->
	<script src="js/move-top.js"></script>
	<!-- easing -->
	<script src="js/easing.js"></script>
	<!--  necessary snippets for few javascript files -->
	<script src="js/snacks.js"></script>

	<script src="js/bootstrap.js"></script>
	<!-- Necessary-JavaScript-File-For-Bootstrap -->
	<!-- //Js files -->											