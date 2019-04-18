<%@ include file="header.jsp" %>
<style>
.table{
  border-collapse: collapse;
  width: 80%;
  border:30px;
  border-spacing: 50px;
}

.td .th{
  padding: 30px;
  text-align: right;
}
</style>

	<!-- banner -->
	<br>
	<div class="container py-xl-5 py-lg-3" >
		<br><br><br>
			<h3 class="title text-black mb-md-1 mb-1 text-center h3" >Come to the luxurious 
					<span>Tasty Foods</span>
			</h3>
			<p class="movetxt text-black mb-1 text-center">Find Delivery Outlet near you</p>
			<div class="row address-row pt-lg-8">
				<div class="col-lg-10">
						<div class="search-agile" style="margin-left: 130px">
								<form action="search.jsp" method="post">
									<input type="search" name="search" placeholder="Search here..." required="" value='<%=request.getParameter("search")%>'>
									<input type="submit" value="Search">
									<div class="clearfix"> </div>
								</form>
						</div>
				</div>
			</div>
	</div>
	<h3 class="container">Restaurent</h3><br><br>
	<!-- //banner -->
	<%@ page import="java.sql.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.net.*" %>
	<%@ page import="javax.servlet.*" %>
	<%@ page import="javax.servlet.http.*" %>

	<%
	try
	{
		String search=request.getParameter("search");
		
		java.sql.Connection con;
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
		String sql="select * from registration where name LIKE '%"+search+"%' or address LIKE '%"+search+"%' or category LIKE '%"+search+"%'";
		PreparedStatement st=con.prepareStatement(sql);
		ResultSet rt=st.executeQuery();
		while(rt.next())
		{
			String name=rt.getString(1);
			String image=rt.getString(2);
			String address=rt.getString(3);
			String contact=rt.getString(4);
			String type=rt.getString(5);
			String category=rt.getString(6);
			String zemail=rt.getString(7);

	%>

	<script type="text/javascript">
		function rm(id)
		{
			id.submit();
		}
	</script>
	<div class="container py-xl-5 py-lg-3" style="margin-top: -90px">	
			
			<div class="row address-row pt-lg-8">
				<div class="container">
					<div class="address-right p-sm-5 p-4 table-responsive">
						<form action="menu.jsp" onclick="javascript:rm(this)">
							<input type="hidden" name="zemail" value="<%=zemail%>">
							<input type="hidden" name="name" value="<%=name%>">
							<table class="table table-responsive" style="cursor: pointer;">
							<tr><td class="td" rowspan="4"><img src="<%=image%>" style="width: 200px;height: 150px"></td><td class="td"><b>Name : <%=name%></b></td></tr>
							<tr><td class="td">Address : <%=address%></td></tr>
							<tr><td class="td">Phone : <%=contact%></td><td class="td">Category : <%=type%></td></tr>
							<tr><td class="td">Distance : under 50km</td><td class="td">Rating : 4.5/5</td></tr>
						</table>
						</form>
					</div>
				</div>
			</div>
	</div>		
	<%
		}

	}
	catch(Exception e)
	{
		e.printStackTrace();
	}				
	%>
	
							
							

	<%@ include file="footer.jsp" %>
</body>
</html>