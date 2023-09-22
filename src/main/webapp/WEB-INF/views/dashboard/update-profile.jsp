<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../header.jsp">
	<jsp:param value="User Profile" name="HTMLtitle" />
</jsp:include>

<div class="container" style="font-family: 'Roboto Slab', serif;">
	<form:form modelAttribute="profile" action="update-profile"
		method="post">
		<input type="hidden" name="userDetailsId" value="${id}">
		<div class="row">
			<div class="col-lg-3">
				<div class="card  mt-5">
					<div class="card-header fs-5">Profile Picture</div>
					<div class="card-body ">
						<div class="account-settings">
							<div class="user-profile">
								<div class="user-avatar pb-3 text-center">
									<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
										class="img-fluid" style="width: 100px">
								</div>
								<h5 class="user-name text-center fs-5 fw-normal">${firstName}
									${lastName}</h5>
								<h5 class="user-title text-center fs-5 fw-normal">${title}</h5>
								<h6 class="user-email text-center text-muted">${email}</h6>
							</div>

						</div>
						<div class="mt-3" style="text-align: center;">
							<button type="submit" class="btn btn-primary text-center">Save
								Changes</button>
						</div>
					</div>
				</div>
			</div>

			<!--- Personal Details, About, Experience, and Education Card-->
			<div class="col-lg-6 gedf-main mt-5">
				<div class="card social-timeline-card mb-4 shadow-lg">
					<div class="card-header">
						<h2 class="fw-semibold">Personal Details</h2>
					</div>
					<div class="card-body">
						<div class="row gutters">

							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="firstName">First Name</label> <input type="text"
										class="form-control" id="firstName" name="firstName"
										placeholder="Enter first name" value="${firstName}">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="lastName">Last Name</label> <input type="text"
										class="form-control" id="lastName" name="lastName"
										placeholder="Enter last name" value="${lastName}">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="email">Email</label> <input type="email"
										class="form-control" id="email" name="email"
										placeholder="Enter email ID" value="${email}" disabled>
								</div>
							</div>

							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="website">Websites</label> <input type="text"
										class="form-control" id="website" name="website"
										placeholder="Website url" value="${website}">
								</div>
							</div>

							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="company">Company</label> <input type="text"
										class="form-control" id="company" name="companyName"
										placeholder="Company" value="${company}">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="title">Position</label> <input type="text"
										class="form-control" id="title" name="title"
										placeholder="Position" value="${title}">
								</div>
							</div>
						</div>
					</div>
				</div>

				<%-- About --%>
				<div class="card social-timeline-card mb-5 shadow-lg">
					<div class="card-header">
						<h2 class="fw-semibold">About</h2>
					</div>
					<div class="card-body">
						<textarea class="form-control" name="about" id="about" cols="10">${about}</textarea>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</div>

<script src="../js/profile.js">
	
</script>


<jsp:include page="../../footer.jsp"></jsp:include>