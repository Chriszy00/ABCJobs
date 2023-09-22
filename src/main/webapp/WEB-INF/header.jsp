<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ABC Jobs | <%=request.getParameter("HTMLtitle") != null ? request.getParameter("HTMLtitle") : "Welcome"%>
</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- External CSS libraries -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Alex+Brush&family=Bodoni+Moda:opsz,wght@6..96,400;6..96,500;6..96,600;6..96,700&family=Inter:wght@200;300;400&family=Roboto+Slab:wght@300;400;500&family=Sacramento&family=Sassy+Frass&family=Tangerine:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400&display=swap"
	rel="stylesheet">

<!-- Custom CSS files -->
<link rel="stylesheet" href="css/style-landing.css">
<link rel="stylesheet" href="css/style-forgot-password.css">
<link rel="stylesheet" href="css/style-custom-btn.css">
<link rel="stylesheet" href="css/style-feed.css">
<link rel="stylesheet" href="css/style-profile.css">
<link rel="stylesheet" href="css/style-footer.css">
<link rel="stylesheet" href="css/style-header.css">
<link rel="stylesheet" href="css/style-jobs.css">
<link rel="stylesheet" href="css/styles-alluser.css">

<style>
/* CSS for resizing icons */
.icon-lg {
	font-size: 24px; /* Adjust the size as needed */
}

.icon-md {
	font-size: 18px; /* Adjust the size as needed */
}

.icon-sm {
	font-size: 14px; /* Adjust the size as needed */
}

.text-deco-none {
	text-decoration: none;
}

.button {
	border: 2px solid #00aaaa;
	border-radius: 5px;
	transition-duration: 0.2s;
	text-decoration: none;
	color: white;
	background-color: #00aaaa;
}

.button:hover {
	background-color: white;
	border: 2px solid #00aaaa;
	color: #00aaaa;
}

.button-disabled {
	border: 2px solid gray;
	border-radius: 5px;
	transition-duration: 0.2s;
	text-decoration: none;
	color: gray;
	background-color: white;
}

.button-disabled:hover {
	color: gray !important;
}

.bg-table {
			background-color: #ebebeb;
		}
		
		.color-table {
			color: #ebebeb;
		}
		
		
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">

		<div class="container collapse" id="navbarToggleExternalContent">
			<a class="navbar-brand fs-2 fw-bold text-dark me-5" href="home"
				style="font-family: 'Bodoni Moda', serif;">ABCJobs</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse flex-grow-1 text-right"
				id="navbarSupportedContent"
				style="font-family: 'Roboto Slab', serif;">
				<ul class="navbar-nav ms-auto flex-nowrap">
					<!--  	Home  	-->
					<li class="nav-item me-4">
						<%
						if ((Boolean) session.getAttribute("isLogin") != null) {
						%> <a
						class="nav-link fs-6 fw-normal <%=request.getServletPath().equals("/WEB-INF/views/dashboard/index.jsp") ? "text-dark" : "text-dark"%>"
						href="<%=request.getContextPath()%>/dashboard"><i
							class='fa fa-home icon-lg me-1'></i> Home</a> <%
 } else {
 %> <a
						class="nav-link fs-6 fw-normal <%=request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "text-dark" : "text-dark"%>"
						href="<%=request.getContextPath()%>/home"><i
							class='fa fa-home icon-lg me-1'></i> Home</a> <%
 }
 %>
					</li>
					<%-- <li class="nav-item me-4"><a
						class="nav-link fs-6 text-dark fw-normal"
						href="<%=request.getContextPath()%>/search">Search</a></li> --%>
					<%
					if ((Boolean) session.getAttribute("isLogin") != null) {
					%>
					<li class="nav-item me-4"><a
						class="nav-link fs-6 fw-normal <%=request.getServletPath().equals("/WEB-INF/views/dashboard.jsp") ? "text-dark" : "text-dark"%>"
						href="profile"><i class="fa fa-user icon-lg me-1"></i> Profile</a></li>

					<%
					}
					%>
					<!--     Job      -->
					<%
					if ((Boolean) session.getAttribute("isLogin") != null) {
					%>
					<li class="nav-item me-4"><a
						class="nav-link fw-normal <%=request.getServletPath().equals("/WEB-INF/views/job/job.jsp")
		|| request.getServletPath().equals("/WEB-INF/views/job/add-job.jsp") ? "text-dark"
				: request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "text-dark" : "on-hover text-dark"%>"
						href="<%=request.getContextPath()%>/job"> <i
							class='fa fa-briefcase icon-lg me-1'></i> Jobs
					</a></li>
					<%
					}
					%>

					<!--      Administrator -->
					<%
					if ((Boolean) session.getAttribute("isLogin") != null && session.getAttribute("roleId").toString().equals("1")) {
					%>
					<li class="nav-item me-4"><a
						class="nav-link fw-normal <%=request.getServletPath().equals("/WEB-INF/views/administrator/index.jsp")
		|| request.getServletPath().equals("/WEB-INF/views/administrator/all-users.jsp")
		|| request.getServletPath().equals("/WEB-INF/views/administrator/send-bulk.jsp") ? "text-dark"
				: request.getServletPath().equals("/WEB-INF/views/index.jsp") ? "text-dark" : "text-dark"%>"
						href="<%=request.getContextPath()%>/admin"><i
							class='fa fa-cog icon-lg me-1'></i> Administrator</a></li>
					<%
					}
					%>

				</ul>

				<%
				if ((Boolean) session.getAttribute("isLogin") != null) {
				%>
				<a href="logout" class="btn btn-outline-danger fs-6 ">Logout</a>
				<%
				} else {
				%>
				<a href="<%=request.getContextPath()%>/login"
					class="text-dark fs-6 fw-normal" style="text-decoration: none;"><i
					class="fa fa-sign-in icon-lg me-1"></i>Login</a> <a
					href="<%=request.getContextPath()%>/registration"
					class="nav-link ms-4 fs-6 fw-normal text-dark"><i
					class="fa fa-user-plus icon-lg me-1"></i> Join now</a>
				<%
				}
				%>
			</div>
		</div>
	</nav>

	<!-- Your page content goes here -->

	<!-- External JS libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>