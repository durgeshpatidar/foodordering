<%@ include file="header.jsp"%>

<% 
String items=request.getParameter("items");
String rname=request.getParameter("rname");

%>





<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<% 
String email=(String)session.getAttribute("email");
String address="";
String name="";
String contact="";
						try
						{
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql="select *from deliveryaddress where email=?";
							PreparedStatement st=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
							st.setString(1,email);
							ResultSet rs=st.executeQuery();
							rs.next();
							address=rs.getString(2);
							name=rs.getString(3);
							contact=rs.getString(4);
						}
						catch(Exception e)
						{

						}

%>







<br><br><br><br><br><br><br>
<div class="container py-xl-5 py-lg-3" style="margin-top: -90px">	
			
			<div class="row address-row pt-lg-8">
				<div class="container">
					<div class="address-right p-sm-5 p-4">

						<form action="order.jsp">
							<input type="hidden" name="items" value='<%=items%>'>
							<input type="hidden" name="rname" value='<%=rname%>'>
							<center>
							<h3 style="color:red">Please fill details</h3><br>
							<table class="table table-striped">
							
							<tr>
							<td><label >Delivery Address :</label></td>
							<td><textarea class="form-control" required="" name='address'><%=address%></textarea></td>
							</tr>
							<tr>
							<td><label >Name : </label></td>
							<td><input class="form-control" type="text" name="name" required="" value="<%=name%>"></td>
							</tr>
							<tr>
							<td><label>Contact :</label></td>
							<td><input class="form-control" required="" type="text" name="contact" value="<%=contact%>"></td>
							</tr>
							<tr>
								<td>Payment Mode : </td>
								<td>Cash-On-Delivery&nbsp;&nbsp;<input type="radio" checked name="pay" value="cod"></td>
							</tr>
							<tr>
								<td></td>
								<td>PayTm&nbsp;&nbsp;<input type="radio" name="pay" value="paytm"></td>
							</tr>
							<tr>
								<td></td>
								<td>Bhim Upi&nbsp;&nbsp;<input type="radio" name="pay" value="bhimupi"></td>
							</tr>
							</table>
							<button class="btn btn-danger" >Order </button>
							</center>
						</form>

					</div>
				</div>
			</div>
	</div>		
	

<%@ include file="footer.jsp"%>

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
<script type="text/javascript">
	function success()
	{
		alert("Order Successful!");
		window.location.href='index.jsp';
	}
</script>