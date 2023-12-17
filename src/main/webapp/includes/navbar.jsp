<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div>

	<nav class="navbar navbar-expand-lg bg-body-tertiary shadow-sm sticky-top"
		style="font-family: 'Happy Monkey', sans-serif;">
		<div class="container-fluid">
			<div class="d-flex justify-center item-center mx-4">
			<img alt="foodlogo" src="./assets/solar-energy.png" class=""
					style="height: 30px;">
				<h3>SuntechEssentials</h3>
				
			</div>


			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item mx-2"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item mx-2"><a class="nav-link" href="cart.jsp"><img
							alt="search" src="./assets/bag.png" style="height: 25px"><span class="badge text-bg-danger">${cart_list.size() }</span></a></li>

					<%
					if (auth != null) {
					%>
					<li class="nav-item mx-2"><a class="nav-link" href="orders.jsp">Orders</a></li>
					<li class="nav-item rounded-4 mx-2 bg-dark rounded-4"><a
						class="nav-link text-light" href="logout">Log-out</a></li>
					<%
					} else {
					%>
					<li class="nav-item rounded-4 mx-2 bg-dark rounded-4"><a
						class="nav-link text-light" href="login.jsp">Log-in</a></li>
					<%
					}
					%>





				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-sm rounded-4"
						type="submit">
						<img alt="search" src="./assets/search.png" style="height: 25px">
					</button>
				</form>
			</div>
		</div>
	</nav>
</div>
