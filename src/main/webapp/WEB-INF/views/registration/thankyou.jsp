<jsp:include page="../../header.jsp">
    <jsp:param value="Thank You !" name="HTMLtitle" />
</jsp:include>
<div class="container-fluid" style="font-family: 'Roboto Slab', serif;">
   <div class="">
    <h1 class="fs-1 fst-italic text-center mt-5 mb-4 d-flex align-items-center justify-content-center text-wrap">Thank you ${firstName} ${lastName} for joining ABCJobs</h1>
    <h2 class="fs-2 fst-italic d-flex align-items-center justify-content-center mb-5">Find your dream job in our community</h2>
    <img src="images/img9.svg" class="rounded mx-auto d-block">
    </div>
    <p class="text-center fs-3 mt-5">We've sent you an activation email to  <span class="fw-bold">${email}.</span> <br> Click the link in the email to help <br>us verify your account</p>
    <button type="button" class="btn d-grid gap-2 col-3 mx-auto mt-4 fs-4 mb-5 btn-custom-button" data-bs-toggle="modal" data-bs-target="#ver">
	  Get Confirmation Link
	</button>
</div>

<!-- Modal -->
<div class="modal fade text-center" style="font-family: 'Roboto Slab', serif;" id="ver" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-body">
      	<i class='bx bxs-envelope fs-2'></i>
      	<h2>Successful</h2>
      	<p>The link has been sent it to your email</p>
       	<a href="verified" class="btn btn-custom-button">Continue</a>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../../footer.jsp"></jsp:include>
