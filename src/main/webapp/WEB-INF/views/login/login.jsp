<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ABCJobs</title>
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

<link rel="stylesheet" href="css/style-register.css">
</head>
<body>

	<div class="container-fluid vh-100 bg custom-font custom-vh">
		<div class="row vh-100">
			<div class="col-md-4">
				<div class="welcome-register">
					<div class="image-holder">
						<img src="/images/merryOnwheels.png" alt="logo" class="" />
					</div>
					<div class="custom-font">
						<h4 class="text-muted ms-5 pt-1">Welcome Back</h4>
						<h2 class="ms-5 pt-2">Sign in to ABCJobs</h2>
					</div>
				</div>
			</div>
			<div class="col-md-8 p-0">
				<div class="card rounded-top-left shadow vh-100">
					<div class="card-header bg-transparent px-5 m-5 border-1">
						<h5 class="text-muted text-end py-2 pb-4">
							Do not have an account? <a href="registration"
								class="TC fw-bold">Register</a>
						</h5>
						<div
							class="alert alert-danger alert-dismissible fade show my-3 ${ message == null ? "
							d-none" : "d-block" }" role="alert">
							${ message }
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>

						<div
							class="alert alert-success alert-dismissible fade show my-3 ${ scMessage == null ? "
							d-none" : "d-block" }" role="alert">
							${ scMessage }
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</div>
					<div class="card-body p-0 mx-5 pt-5">
						<div>
							<h3 class="ms-5 text-muted">Your account details</h3>
						</div>
						<div class="form-inner text-dark px-5 mt-4">
							<form:form action="login" method="post">

								<div class="form-group form-floating mb-3">
									<input type="email" class="form-control" id="emailAddress"
										name="email" value="" placeholder="Enter your Email"
										required /> <label for="emailAddress">Email Address</label>
									<div class="valid-feedback" id="emailValidFeedback">Email
										is Correct</div>
									<div class="invalid-feedback" id="emailInvalidFeedback">Email
										is Incorrect</div>
								</div>
								<div class="form-group form-floating mb-3">
									<input type="password" class="form-control"
										id="floatingPassword" name="password" value=""
										placeholder="Enter your Password" required /> <label
										for="floatingPassword">Password</label>
									<div class="valid-feedback" id="passwordValidFeedback">Password
										is Correct</div>
									<div class="invalid-feedback" id="passwordInvalidFeedback">Password
										is Incorrect</div>
								</div>

								<div class=" fs-5">
									<div class="">
										<label class="TC fw-bold fs-6"> Forgot your password?
											<button type="button"
												class=" text-dark fs-6 btn btn-outline-success btn-sm"
												style="text-decoration: none; margin: 0"
												data-bs-toggle="modal" data-bs-target="#ver">Click
												here</button>
										</label>
									</div>
								</div>

								<!-- Modal -->
								<div class="modal fade text-center" id="ver" tabindex="-1"
									aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header border border-0">
												<button type="button" class="btn-close"
													data-bs-dismiss="modal"></button>
											</div>
											<div class="modal-body">
												<i class='bx bxs-envelope fs-2'></i>
												<h2>Forget your password?</h2>
												<p>Please click the button below for further
													instructions in resetting your password.</p>
												<a href="forgot-password" class="btn btn-custom">Continue</a>
											</div>
											<div class="modal-footer border border-0"></div>
										</div>
									</div>
								</div>
								<!-- Modal -->
								<div class="card-footer bg-transparent 	p-5 mt-5 border-1">
									<div class="text-center pt-2">
										<span class="fs-6 text-muted"> By continuing, you agree
											to the ABCJobs <a href="/termsandconditions"
											class="TC fw-bold">Terms and Conditions</a>
										</span>
										<button
											class="btn btn-outline btn-custom btn-lg btn-block"
											type="submit" style="width:100%">Sign In</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	  document.addEventListener('DOMContentLoaded', function () {
          var myModal = new bootstrap.Modal(document.getElementById('ver'));
      });
	  
  const emailInput = document.getElementById('userName');
  const passwordInput = document.getElementById('floatingPassword');
  const emailValidFeedback = document.getElementById('emailValidFeedback');
  const emailInvalidFeedback = document.getElementById('emailInvalidFeedback');
  const passwordValidFeedback = document.getElementById('passwordValidFeedback');
  const passwordInvalidFeedback = document.getElementById('passwordInvalidFeedback');

  emailInput.addEventListener('input', () => {
    if (emailInput.validity.valid) {
      emailValidFeedback.style.display = 'block';
      emailInvalidFeedback.style.display = 'none';
    } else {
      emailValidFeedback.style.display = 'none';
      emailInvalidFeedback.style.display = 'block';
    }
  });

  passwordInput.addEventListener('input', () => {
    if (passwordInput.validity.valid) {
      passwordValidFeedback.style.display = 'block';
      passwordInvalidFeedback.style.display = 'none';
    } else {
      passwordValidFeedback.style.display = 'none';
      passwordInvalidFeedback.style.display = 'block';
    }
  });
</script>
</body>
</html>
