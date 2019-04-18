<%@ include file="header.jsp"%>
	<style>
.table {
  border-collapse: collapse;
  width: 50%;
}

.td{
  padding: 15px;
  text-align: left;
  border-bottom: 0px solid #ddd;
}
</style>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<% if(session.getAttribute("user")==null)
		{
			response.sendRedirect("index.jsp");
		}
	%>
	<div class="container py-xl-5 py-lg-3" style="margin-top: -90px">	
			<div class="row address-row pt-lg-8">
				<div class="container">
					<div class="address-right">
						<center>
							<br>
							<h3 style="color: blue">Restaurent Registration</h3><br>

							<%@ page import="java.sql.*" %>
							<%@ page import="java.io.*" %>
							<%@ page import="java.net.*" %>
							<%@ page import="javax.servlet.*" %>
							<%@ page import="javax.servlet.http.*" %>
							
							<%
							try
							{
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql="select * from registration where email='"+session.getAttribute("email")+"'";
							PreparedStatement st=con.prepareStatement(sql);
							ResultSet rt=st.executeQuery();
							if(rt.next())
							{%>
							<table class="table">
							<tr><td>Restaurent Name : </td><td><%= rt.getString(1)%></td></tr>
							<tr><td>Restaurent image : </td><td><img src='<%= rt.getString(2)%>' style="width: 150px;height: 150px"></td></tr>
							<tr><td>Address : </td><td><%= rt.getString(3)%></td></tr>
							<tr><td>Contact no. : </td><td><%= rt.getString(4)%></td></tr>
							<tr><td>Type : </td><td><%= rt.getString(5)%></td><td></td></tr>
							<tr><td>Category :</td><td><%= rt.getString(6)%></td></tr>
							
							</table>

							<%}else{%>
							<form action="rregister" method="post" enctype="multipart/form-data">
						<table class="table">
							<tr><td>Restaurent Name : </td><td><input type="text" name="name"></td></tr>
							<tr><td>Restaurent image : </td><td><input type="file" name="fileToUpload"></td></tr>
							<tr><td>Address : </td><td><textarea name="address" rows="2" cols="21"></textarea></td></tr>
							<tr><td>Contact no. : </td><td><input type="text" name="contact"></td></tr>
							<tr><td>Type : </td><td><input type="radio" name="type" value="veg" checked>veg&nbsp;&nbsp;&nbsp;<input type="radio" name="type" value="non-veg">non-veg</td><td></td></tr>
							<tr><td>Category :</td><td><textarea name="category" rows="2" cols="21"></textarea></td></tr>
							<tr><td></td><td><button class="btn btn-primary">Register</button></td></tr>
						</table>
						</form>
						<%}
						}catch(Exception e)
						{

						}
						%>


						</center>
					</div>
				</div>
			</div>
	</div>			

	<%@ include file="footer.jsp" %>
</body>
</html>