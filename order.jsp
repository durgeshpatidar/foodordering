
<%@ page import="java.util.Random"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>

				<%@ page import="java.sql.*" %>
				<%@ page import="java.io.*" %>
				<%@ page import="java.net.*" %>
				<%@ page import="javax.servlet.*" %>
				<%@ page import="javax.servlet.http.*" %>




<%
String rname=request.getParameter("rname");
 String items=request.getParameter("items");
 String address=request.getParameter("address");
 String cname=request.getParameter("name");
 String contact=request.getParameter("contact");
 String pay=request.getParameter("pay");
 String str[]=items.split(",",items.length());
int i;
String name;
String email=(String)session.getAttribute("email");
if(email==null)
response.sendRedirect("index.jsp");
int price;
int quantity;
int amount;
String remail;

	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date date = new Date();

Random rnd=new Random();
int orderid=rnd.nextInt(100000);
session.setAttribute("orderid",orderid);
int sum=0;
for(i=3;i<str.length;i=i+5)
{
sum=sum+Integer.parseInt(str[i]);
}

for(i=0;i<str.length;i++)
{
name=str[i];
i++;
price=Integer.parseInt(str[i]);
i++;
quantity=Integer.parseInt(str[i]);
i++;
amount=Integer.parseInt(str[i]);
i++;
remail=str[i];


							
							
							try
							{
							java.sql.Connection con;
							Class.forName("org.apache.derby.jdbc.ClientDriver");
							con=DriverManager.getConnection("jdbc:derby://localhost:1527/db");
							String sql="insert into history values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
							PreparedStatement st=con.prepareStatement(sql);
							st.setInt(1,orderid);
							st.setString(2,email);
							st.setString(3,remail);
							st.setString(4,rname);
							st.setString(5,name);
							st.setInt(6,price);
							st.setInt(7,quantity);
							st.setInt(8,amount);
							st.setInt(9,sum);
							st.setString(10,dateFormat.format(date));
							st.setString(11,cname);
							st.setString(12,address);
							st.setString(13,contact);
							st.setString(14,pay);
							st.setString(15,"waiting for confirmation");
							st.setString(16,"no current status");
							st.executeUpdate();
							}catch(Exception e)
							{
								out.println(e);
							}

}
response.sendRedirect("bill.jsp"); 	
%>
