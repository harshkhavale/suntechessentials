<%@ page language="java" import="com.solaressentials.model.User"
	import="com.solaressentials.model.Cart" import="com.solaressentials.dao.ProductDao"
	import="com.solaressentials.model.Product" import="java.util.*"
	import="java.text.DecimalFormat" import="com.solaressentials.connection.DBCon"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pdao = new ProductDao(DBCon.getConnection());
	cartProduct = pdao.getCartProducts(cart_list);
	double total = pdao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Happy+Monkey&display=swap"
	rel="stylesheet">
<title>solaressentials</title>
<style>
body {
	font-family: 'Happy Monkey', sans-serif;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="user-cart p-4">
		<h4>#Your Box</h4>
		<div
			class="box rounded-4 border position-fixed top-50 end-0 bg-light translate-middle-y p-4 shadow">
			<h4>Total Price :</h4>
			<h2 class="">
				<strong> Rs. ${(total>0)?dcf.format(total):0 }</strong>
			</h2>
			<a href="check-out" class="btn btn-primary rounded-pill">
				<img alt="foodlogo" src="./assets/checkout.png"
					class="bg-light rounded-pill p-1 m-1" style="height: 30px;">Check-Out
			</a>

		</div>
		<div class="cart-items ">
			<table class="table w-75">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Category</th>
						<th scope="col">Price</th>
						<th scope="col">Quantity</th>

						<th scope="col">Buy Now</th>
						<th scope="col">Cancel</th>

					</tr>
				</thead>
				<tbody>
					<%
					if (cart_list != null) {
						for (Cart c : cartProduct) {
					%>
					<tr>
						<form action="order-now" method="post" class="form-inline">
						<th scope="row"><%=c.getName()%></th>
						<td><%=c.getCategory()%></td>
						<td><%=dcf.format(c.getPrice())%></td>
						<td><div>
								<input type="hidden" name="id" value="<%=c.getId()%>"
									class="form-control" />
								<div class="d-flex item-center align-middle">
									<a href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><img
										alt="foodlogo" src="./assets/plus.png" style="height: 25px;"></a>
									<input type="text" name="quantity"
										class="form-control mx-2 w-25" value="<%=c.getQuantity()%>"
										class="rounded-0 border" readonly /> <a
										href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><img
										alt="foodlogo" src="./assets/minus.png" style="height: 25px;"></a>

								</div>
							</div></td>
						<td><button type="submit"
								class="btn btn-sm btn-success  mx-2 rounded-pill ">Buy
								Now</button></td>
						<td><a href="remove-from-cart?id=<%=c.getId()%>"
							class="btn btn-danger rounded-pill btn-sm">Remove </a></td>
						</form>
					</tr>

					<%
					}
					}
					%>


				</tbody>
			</table>
		</div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>