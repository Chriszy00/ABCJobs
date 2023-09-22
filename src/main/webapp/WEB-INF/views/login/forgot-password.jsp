<jsp:include page="../../header.jsp">
    <jsp:param value="Forgot Password" name="HTMLtitle" />
</jsp:include>

<div class="custom-center-layout">
<div class="container card border border-2 border border-dark"
	style="width: 50rem; font-family: 'Roboto Slab', serif;">

	<form action="forgot-password" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="card-body m-4 pe-5 ps-5">
			<div class="alert alert-danger ${message == null ? "d-none" : "d-block"}" role="alert">${message}</div>
			<h3 class="card-title mb-4 fs-3">Reset your password</h3>
			<hr class="border border-1 border border-dark mb-4">
			<h5 class="card-subtitle mb-2 fs-5 text-center">Please enter your registered email address</h5>
		</div>
		<div class="w-50 d-grid gap-2 col-3 mx-auto">
			<div class="mb-3">
				<label for="floatingInput" class="form-label">Email Address</label>
				<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="emailAddress" required>
				<div class="invalid-feedback">Email address should have @ and .</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary btn-custom-button d-grid gap-2 col-3 mx-auto mb-5" data-bs-toggle="modal" data-bs-target="#ver" style="width: 30%;">Continue</button>
	</form>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
