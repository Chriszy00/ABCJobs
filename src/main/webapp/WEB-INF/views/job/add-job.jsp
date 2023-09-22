<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../header.jsp">
	<jsp:param value="Post a Job" name="HTMLtitle" />
</jsp:include>
<div class="container" style="font-family: 'Open Sans', sans-serif; font-weight: 600;"> 
	<!-- Error Message -->
  	<div class="mx-auto mt-3">
    <div class="alert alert-danger ${errMsg != null ? 'd-block' : 'd-none' }" role="alert">
      ${errMsg}
    </div>
	<!-- Registration Form -->
	<div>
	<div class="card-title text-center color fs-3">Add a Job</div>
	<div class="form-width margin-auto mt-3">
    <form:form action="add-job" method="post" modelAttribute="job">
      <div class="mb-3">
        <label for="jobName" class="form-label">Job Title</label>
        <input type="text" class="form-control" placeholder="Write job title" 
        	id="jobName" name="jobName" required>
        <div class="invalid-feedback">Job name is required</div>
      </div>
      <div class="mb-3">
        <label for="companyName" class="form-label">Company Name</label>
        <input type="text" class="form-control" placeholder="Write company name" 
        	id="companyName" name="companyName" required>
        <div class="invalid-feedback">Company name is required</div>
      </div>
      <div class="mb-3">
        <label for="jobDesc" class="form-label">Job Description</label>
        <textarea class="form-control" id="jobDesc" rows="6"name="jobDesc" required></textarea>
        <div class="invalid-feedback">Job details are required</div>
      </div>
      <div class="row">
      <div class="mb-3 col">
        <label for="location" class="form-label">Location</label>
        <input type="text" class="form-control" placeholder="e.g. Philippines" 
       		id="location" name="location" required>
        <div class="invalid-feedback">Location is required</div>
      </div>
      <div class="mb-3 col">
        <label for="workplaceType" class="form-label">Workplace Type</label>
        <select class="form-select form-control" id="workplaceType" name="workplaceType">
		  <option>Remote</option>
		  <option>Office</option>
		</select>
        <div class="invalid-feedback">Workplace type is required</div>
      </div>
      </div>
      <div class="row">
      <div class="mb-3 col">
        <label for="salary" class="form-label">Salary</label>
        <input type="text" class="form-control" placeholder="e.g. $2200-$2500" 
        	id="salary" name="salary" required>
        <div class="invalid-feedback">Salary is required</div>
      </div>
      <div class="mb-3 col">
        <label for="jobType" class="form-label">Job Type</label>
        <select class="form-select form-control" id="jobType" name="jobType">
		  <option>Full-Time</option>
		  <option>Part-Time</option>
		</select>
        <div class="invalid-feedback">Job type is required</div>
      </div>
      </div>
      <button type="submit" class="w-100 button mx-auto p-2 small mb-4 rounded"  style="border: 1px solid #22A699; color: black; background-color: transparent;">Post Job</button>
    </form:form>
    </div>
    </div>
    </div>
</div>
<jsp:include page="../../footer.jsp"></jsp:include>

