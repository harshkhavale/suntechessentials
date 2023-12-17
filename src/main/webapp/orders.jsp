<%@ page language="java" import="com.solaressentials.model.User"
	import="com.solaressentials.model.Cart" import="com.solaressentials.dao.ProductDao"
	import="com.solaressentials.dao.OrderDao" import="com.solaressentials.model.Product"
	import="com.solaressentials.model.Order" import="java.util.*"
	import="java.text.DecimalFormat" import="com.solaressentials.connection.DBCon"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth != null) {
	request.setAttribute("auth", auth);
	orders = new OrderDao(DBCon.getConnection()).userOrders(auth.getId());

} else {
	response.sendRedirect("login.jsp");
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
	<div class="order-page p-4">
		<h4>#All Order's</h4>
		<div class="cart-items p-4 ">
			<table class="table ">
				<thead>
					<tr>
						<th scope="col">Date</th>
						<th scope="col">Name</th>
						<th scope="col">Quantity</th>

						<th scope="col">Price</th>

						<th scope="col">Cancel</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<%
						if (orders != null) {
							for (Order order : orders) {
						%>
						<td><%=order.getDate()%></td>
						<td><%=order.getName()%></td>
						<td><%=order.getQuantity()%></td>
						<td><%=order.getPrice()%></td>
						<td><a class="btn btn-sm btn-danger rounded-4"
							href="cancle-order?id=<%=order.getOrderId()%>">Cancle </a></td>
					</tr>
					<%
					}
					}
					%>

				</tbody>
			</table>
		</div>

	</div>
	</div>
	<%@include file="includes/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>