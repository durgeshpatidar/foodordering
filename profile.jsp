	<%@ include file="header.jsp"%>
	<br>
	<style>
.table{
  border-collapse: collapse;
  width: 100%;
}

.td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
</style>

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
		String sql="select * from "+session.getAttribute("user")+" where email='"+session.getAttribute("email")+"'";
		PreparedStatement st=con.prepareStatement(sql);
		ResultSet rt=st.executeQuery();
		if(rt.next())
		{
				
				String name=rt.getString(1);
				String eemail=rt.getString(2);
				String phone=rt.getString(3);
				String gender;
				if(rt.getString(4).equals("m"))
				gender="male";
				else
				gender="female";
	%>

	<br>
	<center>
	<div class="container py-xl-5 py-lg-3" >
		<br><br><br>
			<h3 class="title text-dark mb-sm-5 mb-4">	
			<span><img src='<%= session.getAttribute("path")%>' style="width:100px;height:100px">&nbsp;Profile detail</span></h3>
			<div class="row address-row pt-lg-8">
				<div class="col-lg-10">
					<div class="address-right p-sm-5 p-4 table-responsive">
						<center>
						<table class="table">
							<tr><td class=""><h3>Name</h3></td><td class=""><%out.println(name); %></td></tr>
							<tr><td class=""><h3>Email</h3></td><td class=""><%out.println(eemail); %></td></tr>
							<tr><td class=""><h3>Mobile No.</h3></td><td class=""><%out.println(phone); %></td></tr>
							<tr><td class=""><h3>Gender</h3></td><td class=""><%out.println(gender); %></td></tr>
						
							<tr><td ><a href="delete"><button class="btn btn-danger">Delete Account</button></a></td><td></td></tr>
						</table>
						</center>
					</div>
				</div>
			</div>
	</div>					
	</center>


	<%}
		else
		{
			out.println("<center><br><br><br><br><br><br><h3 class='h3' style='color:red'>Please Login Or Register for View Profile</h3></center>");
		}
	}catch(Exception e)
	{
		e.printStackTrace();
		out.println(e);
	}
	%>
	
	<!--//profile -->
	<!-- profile detail -->
	
	<%@ include file="footer.jsp" %>

	<% if(session.getAttribute("user")==null)
		{
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>
