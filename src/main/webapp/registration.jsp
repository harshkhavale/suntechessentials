<%@ page language="java" import="com.solaressentials.model.User" import="com.solaressentials.model.Cart" import="java.util.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
	response.sendRedirect("index.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	
	request.setAttribute("cart_list", cart_list);

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>solaressentials - Registration</title>
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

	<div
		class="d-flex h-auto pb-4 pt-4  justify-content-center item-center ">
		<div
			class="d-flex align-items-center py-4 bg-body-tertiary p-4 border shadow p-3 bg-body-tertiary rounded">





			<main class="form-signin p-4 ">

				<form action="userregistration" method="post">
					<div class="d-flex justify-center item-center mx-4">
						<h2>suntechessentials</h2>
						<img alt="foodlogo" src="./assets/solar-energy.png" class=""
							style="height: 30px;">
					</div>
					<p class=" mb-3 fw-normal">Please sign in
					</h5>
<div class="form-floating my-2">
						<input type="text" name="username" class="form-control"
							id="floatingInputUser" placeholder="name@example"> <label
							for="floatingInputUser">Username</label>
					</div>
					<div class="form-floating my-2">
						<input type="email" name="email" class="form-control"
							id="floatingInput" placeholder="name@example.com"> <label
							for="floatingInput">Email address</label>
					</div>
					<div class="form-floating my-2">
						<input type="password" name="password" class="form-control"
							id="floatingPassword" placeholder="Password"> <label
							for="floatingPassword">Password</label>
					</div>

<div class="form-floating my-2">
						<input type="password" name="cpassword" class="form-control"
							id="floatingCPassword" placeholder="Password"> <label
							for="floatingCPassword">Confirm Password</label>
					</div>

					<div class="form-check text-start my-3">
						<input class="form-check-input" type="checkbox"
							value="remember-me" id="flexCheckDefault"> <label
							class="form-check-label" for="flexCheckDefault"> Remember
							me </label>
					</div>
					<br>

					<button class="btn btn-primary w-100 py-2 my-4 rounded-4"
						type="submit">Sign up</button>
					<a href="login.jsp" class=" mb-3 my-4 mt-4 text-body-secondary">Already have an account? Sign in</a>

				</form>
			</main>

			<div>
				<img alt="foodlogo" src="./assets/tour.jpg" class=""
					style="height: 500px;">

			</div>
		</div>
	</div>

	<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>