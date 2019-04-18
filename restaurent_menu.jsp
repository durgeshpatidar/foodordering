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
							<h3 style="color: blue">Restaurent Menu</h3><br>

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
							String sql="select * from menu where email='"+session.getAttribute("email")+"'";
							PreparedStatement st=con.prepareStatement(sql);
							ResultSet rt=st.executeQuery();
							out.println("<h3>Menu List</h3>");
							%>
							<table class="table">
								<tr style="color:red"><td>Food name</td><td>price</td><td>quantity</td><td></td></tr>
							<%
							
							while(rt.next())
							{%>
								
							<tr><td><%= rt.getString(1)%></td>
							<td><%= rt.getString(2)%></td>
							<td><%= rt.getString(3)%></td>
							<form action="deletefood.jsp">
							<input type="hidden" name="foodname" value="<%= rt.getString(1)%>">
							<td><button class="btn btn-danger" onclick='javascript:return confirm("are you sure want to delete this item");'>Delete</button></td></tr>
							</form>
							<%}
							out.println("</table>");
							{%>
							<h3>Add Menu</h3>
							<form action="addmenu" method="post" >
						<table class="table">
							<tr><td>Food Name : </td><td><input class="form-control" type="text" name="name" required=""></td></tr>
							<tr><td>price : </td><td><input type="text" name="price" class="form-control" required=""></td></tr>
							<tr><td>Quantity : </td><td><input type="text" name="quantity" class="form-control" required=""></td></tr>
							<tr><td></td><td><button class="btn btn-primary">Add item</button></td></tr>
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