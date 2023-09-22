<nav
	class="navbar navbar-expand-lg d-flex flex-column align-items-center w-100 pb-0 <%=request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "position-absolute" : "mb-5 shadow-sm border"%>"
	style="z-index: 1000;">
	<div class="container">


		<div class="col-md-3 col-sm-3">
			<a
				class="navbar-brand fs-3 fw-bold <%=request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "text-white" : "text-dark"%>"
				href="home"><span><i class='bx bx-git-branch'></i></span> <span
				class="text-primary">ABC</span> Jobs</a>
		</div>

		<div class="col-md-2 col-sm-4">
			<div class="ms-auto d-flex gap-3">
				<%
				if ((Boolean) session.getAttribute("isLogin") != null) {
				%>
				<a href="<%=request.getContextPath()%>/logout"
					class="btn btn-danger ms-auto">Logout</a>
				<%
				} else {
				%>
				<a href="<%=request.getContextPath()%>/login"
					class="btn btn-outline-primary ms-auto <%=request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "d-none" : ""%>">Login</a>
				<a href="<%=request.getContextPath()%>/registration"
					class="btn btn-primary ms-auto <%=request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "d-none" : ""%>">Register</a>
				<%
				}
				%>
			</div>
		</div>
	</div>


	<div class="container border-top pt-2 px-0 mt-2 mb-0">
		<!-- Hamburger icon -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>


		<div class="collapse navbar-collapse" id="navbar">
			<ul class="navbar-nav d-flex justify-content-center gap-3">

				<%
				if ((Boolean) session.getAttribute("isLogin") == null) {
				%>
				<li class="nav-item"><a
					class="nav-link fw-semibold <%=request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "text-white" : "text-dark"%>"
					href="<%=request.getContextPath()%>/home">Home</a></li>
				<%
				}
				%>

				<li class="nav-item"><a
					class="nav-link fw-semibold <%=request.getServletPath().equals("/WEB-INF/views/search/search.jsp")
		? "text-primary border-bottom border-3 border-primary"
		: request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "text-white"
				: "text-dark border-bottom border-3  border-white"%>"
					href="<%=request.getContextPath()%>/search">Search</a></li>

				<%
				if ((Boolean) session.getAttribute("isLogin") != null && session.getAttribute("roleId").toString().equals("2")) {
				%>
				<li class="nav-item"><a
					class="nav-link fw-semibold <%=request.getServletPath().equals("/WEB-INF/views/dashboard/index.jsp")
		? "text-primary border-bottom border-3 border-primary"
		: request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "text-white"
				: "text-dark border-bottom border-3  border-white"%>"
					href="<%=request.getContextPath()%>/dashboard">Dashboard</a></li>


				<%
				}
				%>

				<%
				if ((Boolean) session.getAttribute("isLogin") != null) {
				%>
				<li class="nav-item"><a
					class="nav-link fw-semibold <%=request.getServletPath().equals("/WEB-INF/views/dashboard/profile.jsp")
		? "text-primary border-bottom border-3 border-primary"
		: request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "text-white"
				: "text-dark border-bottom border-3  border-white"%>"
					href="<%=request.getContextPath()%>/profile">Profile</a></li>
				<%
				}
				%>

				<%
				if ((Boolean) session.getAttribute("isLogin") != null && session.getAttribute("roleId").toString().equals("1")) {
				%>
				<li class="nav-item"><a
					class="nav-link fw-semibold <%=request.getServletPath().equals("/WEB-INF/views/administrator/index.jsp")
		? "text-primary border-bottom border-3 border-primary"
		: request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "text-white"
				: "text-dark border-bottom border-3  border-white"%>"
					href="<%=request.getContextPath()%>/admin">Dashboard</a></li>
				<%
				}
				%>


			</ul>
		</div>


	</div>
</nav>
