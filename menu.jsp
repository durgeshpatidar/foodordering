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

<script type="text/javascript">
   	var sum=0;
    function plus(aa,p,am)
    {	
         aa.value =parseInt(aa.value)+1 ;
         document.getElementById(am).innerHTML = aa.value*p;
         sum=sum+(p);
         document.getElementById("tam").innerHTML = sum;
         
         
    }
    function minus(aa,p,am)
    {
   		
      if (parseInt(aa.value) > 0) 
      {
        aa.value =parseInt(aa.value)-1;
        document.getElementById(am).innerHTML = aa.value*p;
        sum=sum-(p);
        document.getElementById("tam").innerHTML = sum;
        
      }  
    }

    function order()
    {
     	var xhr=new XMLHttpRequest();
    	xhr.onreadystatechange=function(){
    		if(xhr.readyState===4){
    			//code to be executed when response has been come.
    			document.getElementById(result.id).innerHTML=xhr.responseText;
    		}
    	};
    	xhr.open("get","order.jsp?total="+sum,true);
    	xhr.send();
    }
    function success()
    {
    	alert("Order successfull");

    }

  

    function abc(zemail,rname)
    {	
  
    	var items=[];
    	var rws=document.getElementById("mytbl").rows;
    	var a;
    	var b;
    	var cc;
    	var d;
    	for (i = 1; i < rws.length; i++) 
    	{
    		

            // GET THE CELLS COLLECTION OF THE CURRENT ROW.
           	 var objCells = rws.item(i).cells;
             a=objCells.item(0).innerHTML;
             a=a.trim();
             b=objCells.item(2).innerHTML;
             b=b.trim();
             var c=objCells.item(3);
             cc=  c.querySelector(".qnt").value;
             cc=cc.trim(); 
             d=objCells.item(4).innerHTML;
             d=d.trim();
             if(cc==0) continue;
             items.push(new Array(a,b,cc,d,zemail));
            
          }

    	window.location="address.jsp?items="+items+"&rname="+rname;
    	
    }

   

</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container py-xl-5 py-lg-3" style="margin-top: -90px">	
			<div class="row address-row pt-lg-8">
				<div class="container">
					<div class="address-right">
						<center>
							<br>
							<h3 style="color: red">Restaurent Menu</h3><br>

							<%@ page import="java.sql.*" %>
							<%@ page import="java.io.*" %>
							<%@ page import="java.net.*" %>
							<%@ page import="javax.servlet.*" %>
							<%@ page import="javax.servlet.http.*" %>
							
							<%
							try
							{
							String email=request.getParameter("zemail");
							String rname=request.getParameter("name");
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql="select * from menu where email='"+email+"'";
							PreparedStatement st=con.prepareStatement(sql);
							ResultSet rt=st.executeQuery();
							out.println("<h3>Menu List</h3>");
							%>
							<table class="table" id="mytbl">
								<tr style="color:red"><td>Food name</td><td></td><td>price</td><td>quantity</td><td>amount</td></tr>
							<%
							int am=1;
							while(rt.next())
							{%>
								
							<tr><td><%= rt.getString(1)%></td>
							<td><%= rt.getString(3)%></td>
							<td><%= rt.getString(2)%></td>
							

							
							<td>
								<div id="input_div">
								<input type="button" value="-" id="minus" onclick="minus(this.nextElementSibling,<%= rt.getString(2)%>,<%=am%>)">
    							<input type="text" size="1" value="0"  name="count" id="qnt" class="qnt">
							    <input type="button" value="+" id="plus" name="count" onclick="plus(this.previousElementSibling,<%= rt.getString(2)%>,<%=am%>)">
								</div>
							</td>
							<td id='<%=am%>'>0</td>
						</tr>

							<%am=am+1;}%>
							
							</table>
							
							<table class="table">
								<tr >
									<td style="color: red;"><b>Total Amount : </b></td>
									<td><p  id="tam" style="text-align: left">0</p></td>
								</tr>
							</table>
							
							<% String zemail=request.getParameter("zemail");
								
								String wemail=(String)session.getAttribute("email");
								if(wemail!=null){
							%>
							
							<button class='btn btn-danger' onclick="abc('<%=zemail%>','<%= rname%>')" >Order Now</button><br><br>
							<%}else{%>
							<div style="color:blue">
								<h3>please login for order food</h3>
							</div>
							<br><br>
							<%}%>
							</center>
						
							<%
							
						}catch(Exception e)
						{

						}
						%>


						
					</div>
				</div>
			</div>
	</div>			

	<%@ include file="footer.jsp" %>
</body>
</html>