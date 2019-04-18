
    <%@ include file="header.jsp" %>

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
									<input type="search" name="search" placeholder="Search here..." required="">
									<input type="submit" value="Search">
									<div class="clearfix"> </div>
								</form>
						</div>
				</div>
			</div>
	</div>
	<!-- //banner -->





	
	

	<!-- contact -->
	<div class="address py-5" id="contact">
		<div class="container py-xl-5 py-lg-3">
			<h3 class="title text-center text-dark mb-sm-5 mb-4">
				<span>Contact US</span> world's no.1 foodordering services</h3>
			<div class="row address-row pt-lg-5">
				<div class="col-lg-6">
					<div class="address-right p-sm-5 p-4">
						<div class="address-info wow fadeInRight animated" data-wow-delay=".5s">
							<h4 class="mb-3">Address</h4>
							<p>Hostel 11 Appu Bhawan M.A.N.I.T.,
								<span>Bhopal (Madhya Pradesh), India<br>Pin Code :- 462003</span>
							</p>
						</div>
						<div class="address-info address-mdl wow fadeInRight animated my-sm-5 my-4" data-wow-delay=".7s">
							<h4 class="mb-3">Phone </h4>
							<p href="callto:+919098938007">+91 9098938007</p>
							<p href="callto:+919098938007">+91 9685382191</p>
						</div>
						<div class="address-info agileits-info wow fadeInRight animated" data-wow-delay=".6s">
							<h4 class="mb-3">Mail</h4>
							<p>
								<a href="mailto:durgeshpatidar4@gmail.com"> durgeshpatidar4@gmail.com</a>
							</p>
							<p>
								<a href="mailto:durgeshpatidar4@gmail.com"> anishkumarnit	@gmail.com</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 address-left wow agile fadeInLeft animated mt-lg-0 mt-5" data-wow-delay=".5s">
					<div class="address-grid p-sm-5 p-4">
						<h4 class="wow fadeIndown animated mb-3" data-wow-delay=".5s">Get In Touch</h4>
						<form action="send.jsp"  onsubmit="javascript:send()" method="get">
							<div class="form-group">
								<input type="text" placeholder="Name" name="name" class="form-control" required="">
							</div>
							<div class="form-group">
								<input type="email" placeholder="Email" name="email" class="form-control" required="">
							</div>
							<div class="form-group">
								<textarea placeholder="Message"  name="message" class="form-control" required=""></textarea>
							</div>
							<input type="submit" value="SEND">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//contact-->

	<%@ include file="footer.jsp" %>

</body>

</html>
<script type="text/javascript">
	function send()
	{
		alert("Thank you ... your feedback send successfully !");
	}
</script>