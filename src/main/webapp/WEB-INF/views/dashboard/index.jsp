<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../header.jsp">
	<jsp:param value="Dashboard" name="HTMLtitle" />
</jsp:include>


<!DOCTYPE html>
<html>
<head>
<title>ABCJobs | Feed</title>
<!-- Include the jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<!-- 
	Bulk Mail
	AJAX
	Request
	 -->
<script>
	$(document).ready(
			function() {
				function fetchBulkMailData() {
					$.ajax({
						type : 'GET',
						url : '/ABCJobs/page/notifications', // URL mapped to the controller's endpoint
						dataType : 'json',
						success : function(response) {
							// 'response' will contain the JSON data
							displayBulkMail(response);
						},
						error : function(error) {
							console.error('Error fetching bulk mail:', error);
						}
					});
				}

				function displayBulkMail(bulkMail) {
					var container = $("#bulkMailContainer");

					// Clear the container before adding new bulk mail
					container.empty();

					// Loop through each bulk mail and create a container for it
					$.each(bulkMail, function(index, mail) {
						var mailContainer = $("<div>").addClass(
								"bulk-mail-container");

						var emailSubject = $("<h3>").text(mail.emailSubject);
						var emailBody = $("<p>")
								.text("Body: " + mail.emailBody);
						var createdAt = $("<p>").text(
								"Created At: " + mail.createdAt);
						var boundary = $("<hr>");

						mailContainer.append(emailSubject, emailBody,
								createdAt, boundary);

						// Create a separate container for each bulk mail
						var mailCardContainer = $("<div class='mail-card'>")
								.append(mailContainer);
						container.append(mailCardContainer);
					});
				}

				// Call the function to fetch and display bulk mail when the page loads
				fetchBulkMailData();
			});
</script>

<style>

</style>
</head>

<body>

	<div class="container gedf-wrapper" style="font-family: 'Open Sans', sans-serif;">
		<div class="row">
			<div class="col-md-12 col-lg-3">
				<div class="card">
					<div class="card-body">
						<div class="d-flex flex-column border rounded-3 pb-4 shadow">
							<a href="profile" class="text-decoration-none">
								<div class="border p-0 rounded-top border-1">
									<div
										class="fs-1 d-flex align-items-center justify-content-center bg-secondary text-white"
										style="height: 20vh;">
										<span>${f}${l}</span>
									</div>
								</div>
							</a>
							<div class="px-4 py-3 text-center">
								<h3>${fullName}</h3>
								<p>${title}</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Create a Post -->
			<div class="col-md-12 col-lg-5">
				<div class="border rounded-3 mb-3 px-3 shadow on-point" id="post1" style="background-color: #ffffff;"
					data-bs-toggle="modal" data-bs-target="#postModal">
					<div class="d-flex align-items-center gap-2 py-3">
						<img class="rounded img-fluid"
							src="https://img.icons8.com/ios-filled/50/737373/user-male-circle.png"
							alt="user-male-circle" /> <input
							class="rounded border-2 border border-dark-subtle w-100 p-2" placeholder="Create a post"></input>
					</div>

					<!-- Content -->
					<div
						class="d-flex align-items-center justify-content-start gap-3 py-3">
						<a href=""
							class="d-flex align-items-center gap-2 btn btn-outline-dark post-hover" style="color: #22a699;"><i
							class='fa fa-image dark-cyan'></i></a> <a href=""
							class="d-flex align-items-center gap-2 btn btn-outline-dark post-hover" style="color: #22a699;"><i
							class='fa fa-video dark-cyan'></i></a> <a href=""
							class="d-flex align-items-center gap-2 btn btn-outline-dark post-hover" style="color: #22a699;"><i
							class='fa fa-briefcase dark-cyan'></i></a> <a href=""
							class="d-flex align-items-center gap-2 btn btn-outline-dark post-hoverx" style="color: #22a699;"><i
							class="fa fa-newspaper-o dark-cyan"></i> </a>
					</div>
				</div>
				<!-- CREATE POST MODAL -->
				<div class="modal fade" id="postModal">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<div class="d-flex justify-content-center">
									<span class="modal-title fs-5 fw-bold text-center color ms-2"
										id="exampleModalLabel">Create post</span>
								</div>
								<button type="button" class="btn-close ms-0"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- JOB APPLICATION -->
								<div class="mb-2">
									<div class="row">
										<div class="d-flex align-items-center my-2">
											<img class="rounded img-fluid"
												src="https://img.icons8.com/ios-filled/50/737373/user-male-circle.png"
												alt="user-male-circle" />
											<div class="p-2">
												<h6 class="mb-0">${fullName}</h6>
												<span class="small text-muted">${title}</span>
											</div>
										</div>
									</div>
								</div>
								<!-- 	FORM -->
								<form:form action="create-post" method="post">
									<div class="mb-3">
										<select class="form-select" aria-label="Select category"
											name="category" required>
											<option selected>Select category</option>
											<option value="General">General</option>
											<option value="Technology">Technology</option>
											<option value="Security">Security</option>
											<option value="Cloud">Cloud</option>
											<option value="Commerce">Commerce</option>
										</select>
									</div>
									<div class="mb-3">
										<input type="text" name="heading" class="form-control"
											id="exampleFormControlInput1" placeholder="Write a caption">
									</div>
									<div class="mb-3">
										<textarea class="form-control" id="body" name="body"
											placeholder="Let everyone hear your thoughts!"
											style="height: 200px" required></textarea>
									</div>
									<div
										class="d-flex align-items-center justify-content-start gap-3 py-3">
										<a href=""
											class="d-flex align-items-center gap-2 btn btn-outline-secondary post-hover" style="color: #22a699;"><i
											class='fa fa-image dark-cyan'></i></a> <a href=""
											class="d-flex align-items-center gap-2 btn btn-outline-secondary post-hover" style="color: #22a699;"><i
											class='fa fa-video dark-cyan'></i></a> <a href=""
											class="d-flex align-items-center gap-2 btn btn-outline-secondary post-hover" style="color: #22a699;"><i
											class='fa fa-briefcase dark-cyan'></i></a> <a href=""
											class="d-flex align-items-center gap-2 btn btn-outline-secondary post-hover" style="color: #22a699;"><i
											class="fa fa-newspaper-o dark-cyan"></i> </a>
									</div>
									<button type="submit" class="button w-100 p-2 small mb-3 btn btn-primary">Post</button>
								</form:form>
							</div>
						</div>
					</div>
				</div>

				<c:choose>
					<c:when test="${not empty posts}">
						<c:forEach var="p" items="${posts}">
							<div class="border rounded-3 mb-3 px-3 shadow" id="post1" style="background-color: #ffffff;">
								<div class="d-flex align-items-center gap-2 py-3" style="color:#22a699;">
									<span
										class="px-3 py-2 rounded-circle border border-dark text-dark">M</span>
									<a href="" class="text-decoration-none fs-5 text-black"></a> <small class="ms-auto">${p.timeSincePosted}</small>

								</div>
								<hr style="margin-top:0;">

								<!-- Content -->
								<div class="ms-5">
									<h3 class="mb-3">${p.heading}</h3>
									<p class="fs-6">${p.body}</p>
								</div>

								<div class="d-flex align-items-center gap-2 py-3 ms-5" style="color: #22a699;">
									<a href=""
										class="d-flex align-items-center gap-2 btn btn-outline-secondary post-hover"><i
										class="fas fa-thumbs-up" style="color: #22a699;"></i></a> <a href=""
										class="d-flex align-items-center gap-2 btn btn-outline-secondary post-hover"><i
										class="fas fa-comment-dots" style="color: #22a699;"></i></a> <a href=""
										class="d-flex align-items-center gap-2 btn btn-outline-secondary post-hover"><i
										class='fa fa-share-alt' style="color: #22a699;"></i></a>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p class="fs-5 text-center mx-auto">No posts available</p>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- Notification -->
			<div class="col-md-12 col-lg-4 d-none d-lg-block">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Notifications</h3>
						<hr class="">
						<div id="bulkMailContainer" class="text-muted"></div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>