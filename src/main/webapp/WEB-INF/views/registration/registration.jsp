<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function handleInputValidation(inputId, regex, errorId, successMessage) {
		const input = document.getElementById(inputId);
		const inputValue = input.value.trim();

		if (regex.test(inputValue)) {
			document.getElementById(errorId).textContent = "";
			if (input.nextElementSibling.id === errorId) {
				input.nextElementSibling.textContent = successMessage;
			}
			return true;
		} else {
			document.getElementById(errorId).textContent = "Please try again";
			return false;
		}
	}

	function validateRegistrationForm() {
		let isFormValid = true;

		isFormValid &= handleInputValidation("firstName", /^[A-Za-z\s]+$/,
				"firstNameError", "");

		isFormValid &= handleInputValidation("lastName", /^[A-Za-z\s]+$/,
				"lastNameError", "");

		const emailInput = document.getElementById("email");
		const emailError = document.getElementById("emailError");
		const emailValue = emailInput.value.trim(); // Assign the value to emailValue

		if (emailValue !== "") {
			// Check if the entered email is already registered
			if (emailInput.nextElementSibling.id === "emailError"
					&& emailInput.nextElementSibling.textContent !== "") {
				isFormValid = false;
				// Show an alert box for registered email
				alert("This email is already registered. Please use a different email.");
			}
		}

		const password = document.getElementById("floatingPassword").value;
		const passwordValid = validatePassword(password);
		if (!passwordValid) {
			isFormValid = false;
		}

		return isFormValid;
	}
	
	 $(document).ready(function() {
	        $("#email").blur(function() {
	            validateEmail();
	        });
	    });

	    function validateEmail() {
	        const email = $("#email").val();
	        $.ajax({
	            url: "/check-email",
	            data: { email: email },
	            success: function(response) {
	                if (response === "exists") {
	                    $(".error-message").text("Email already exists.");
	                } else {
	                    $(".error-message").text("");
	                }
	            }
	        });
	    }

	function validatePassword(password) {
	    const passwordLengthValid = password.length >= 8;
	    const passwordUpperCaseValid = /[A-Z]/.test(password);
	    const passwordLowerCaseValid = /[a-z]/.test(password);
	    const passwordNumberValid = /[0-9]/.test(password);
	    const passwordSymbolValid = /[!@#$%^&*]/.test(password);
	    const passwordValid = passwordLengthValid && passwordUpperCaseValid
	            && passwordLowerCaseValid && passwordNumberValid
	            && passwordSymbolValid;

	    const passwordErrorElement = document.getElementById("passwordError");
	    const passwordValidationList = document.querySelectorAll(".password-validation li");

	    if (!password) {
	        passwordErrorElement.textContent = "";
	        passwordValidationList.forEach(item => {
	            item.classList.remove("check", "wrong");
	        });
	    } else if (!passwordValid) {
	        passwordErrorElement.textContent = "Invalid password format";
	        passwordValidationList.forEach(item => {
	            item.classList.remove("check");
	            item.classList.add("wrong");
	        });
	    } else {
	        passwordErrorElement.textContent = "";
	        passwordValidationList[0].classList.toggle("check", passwordLengthValid);
	        passwordValidationList[1].classList.toggle("check", passwordUpperCaseValid);
	        passwordValidationList[2].classList.toggle("check", passwordLowerCaseValid);
	        passwordValidationList[3].classList.toggle("check", passwordNumberValid);
	        passwordValidationList[4].classList.toggle("check", passwordSymbolValid);
	    }

	    return passwordValid;
	}

</script>

</head>
<body>

	<div class="container-fluid min-vh-100 bg custom-font custom-vh">
		<div class="row">
			<div class="col-md-4">
				<div class="welcome-register">
					<div class="image-holder">
						<img src="/images/merryOnwheels.png" alt="logo" class="" />
					</div>
					<div class="custom-font">
						<h4 class="text-muted ms-5 pt-1">Welcome to ABCJobs</h4>
						<h2 class="ms-5 pt-2">Create Your Account</h2>
					</div>
				</div>
			</div>
			<div class="col-md-8 p-0">
				<div class="card rounded-top-left shadow">
					<div class="card-header bg-transparent px-5 m-5 border-1">
						<h5 class="text-muted text-end py-2 pb-4">
							Already have an account? <a href="login" class="TC fw-bold">Login</a>
						</h5>
						<c:if test="${not empty success_register}">
							<div class="alert alert-success">${success_register}
								Click here to <a href="login">Sign In</a>
							</div>
						</c:if>
					</div>
					<div class="card-body p-0 mx-5">
						<div>
							<h3 class="ms-5 text-muted">Your account details</h3>
						</div>
						<div class="form-inner text-dark px-5 mt-4">
							<form action="registration" method="post"
								onsubmit="return validateRegistrationForm();">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

								<div class="row">
									<div class="col">
										<div class="form-group form-floating mb-3">
											<input type="text" class="form-control" id="firstName"
												name="firstName" placeholder="Enter your First Name" />
											<label for="firstName">First Name</label>
											<div id="firstNameError" class="invalid-feedback"></div>
										</div>
									</div>

									<div class="col">
										<div class="form-group form-floating mb-3">
											<input type="text" class="form-control" id="lastName"
												name="lastName" placeholder="Enter your Last Name" />
											<label for="lastName">Last Name</label>
											<div id="lastNameError" class="invalid-feedback"></div>
										</div>
									</div>
								</div>

								<div class="form-group form-floating mb-3">
									<input type="email" class="form-control" id="email"
										name="email" placeholder="Enter your Email" />
									<label for="email">Email Address</label>
									<!-- <div class="invalid-feedback">Please enter a valid Email</div> -->
									<!-- <div id="emailError" class="invalid-feedback"></div> -->
									<small class="error-message" style="color: red;"></small>
								</div>

								<div class="form-group form-floating mb-3">
									<input type="password" class="form-control"
										id="floatingPassword" name="password"
										placeholder="Enter your Password" />
									<label for="floatingPassword">Password</label>
									<div id="passwordError" class="invalid-feedback"></div>
								</div>

								<div class="password-validation-box">
									<div class="password-validation">
										<p class="px-3">Your password must have:</p>
										<ul>
											<li class="${passwordLengthValid ? 'check' : 'wrong'}">✓
												At least 8 characters</li>
											<li class="${passwordUpperCaseValid ? 'check' : 'wrong'}">✓
												1 upper-case letter</li>
											<li class="${passwordLowerCaseValid ? 'check' : 'wrong'}">✓
												1 lower-case letter</li>
											<li class="${passwordNumberValid ? 'check' : 'wrong'}">✓
												1 number</li>
											<li class="${passwordSymbolValid ? 'check' : 'wrong'}">✓
												1 symbol</li>
										</ul>
									</div>
								</div>
								<div class="card-footer bg-transparent py-5 mt-5 border-1">
									<div class="text-center">
										<span class="fs-6 text-muted "> By continuing, you agree
											to the ABCJobs <a href="/termsandconditions"
											class="TC fw-bold">Terms and Conditions</a>
										</span>
										<button
											class="btn btn-outline btn-custom btn-lg btn-block"
											type="submit" style="width:100%;">Sign Up</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
