<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../header.jsp">
    <jsp:param value="Jobs" name="HTMLtitle" />
</jsp:include>

<div class="container mt-5 min-vh-100"
    style="font-family: 'Open Sans', sans-serif; font-weight: 600;">
    <div class="row">
        <div
            class="alert alert-success alert-dismissible ${scMessage != null ? 'd-block' : 'd-none' }"
            data-bs-dismiss="alert" aria-label="Close" role="alert">
            ${scMessage}</div>

<!-- Search form -->
        <form:form method="GET" action="/job" class="mb-3">
            <div class="input-group">
                <input type="text" name="q" class="form-control"
                    placeholder="Search for jobs">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form:form>
        
        <div class="nav nav-tabs d-flex justify-content-center mb-3"
            id="nav-tab" role="tablist">
            <a href="add-job"
                class="button p-1 px-5 w-100 mb-2 text-center rounded-3"
                style="border: 2px solid #22A699; color: black; background-color: transparent; text-decoration: none;">Post
                A Job</a>
        </div>

        <div class="col-md-4 custom">
            <!-- 30% column -->
            <c:forEach var="j" items="${jobs}" varStatus="loop">
                <div class="card mb-2 expandable-card "
                    style="border-left: 7px solid #F24C3D;" data-toggle="card-toggle"
                    data-target="#card-${j.jobId}" data-index="${loop.index}">
                    <div class="card-body p-5">
                        <img class="rounded img-fluid "
                            src="${pageContext.request.contextPath}/images/logo-job.png"
                            alt="job logo">

                        <h5 class="card-title">${j.companyName}</h5>
                        <i class='fa fa-briefcase mb-2'></i> ${j.jobType}
                        <p class="card-text">${j.location}</p>

                        <c:set var="matchingJobApplication" value="${null}" />
                        <c:forEach var="jobApplication" items="${jobApplication}">
                            <c:if
                                test="${j.jobId == jobApplication.jobid && sessionScope.userId == jobApplication.userId}">
                                <c:set var="matchingJobApplication" value="${jobApplication}" />
                            </c:if>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${matchingJobApplication != null}">
                                <c:choose>
                                    <c:when test="${matchingJobApplication.status eq 'Pending'}">
                                        <button type="button"
                                            class="btn btn-outline-secondary ms-auto px-5" disabled>Pending</button>
                                    </c:when>
                                    <c:when test="${matchingJobApplication.status eq 'Accepted'}">
                                        <button type="button"
                                            class="btn btn-outline-success ms-auto px-5" disabled>Accepted</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button"
                                            class="btn btn-outline-primary ms-auto px-5"
                                            style="border: 1px solid #22A699; color: black; background-color: transparent;"
                                            data-bs-toggle="modal"
                                            data-bs-target="#jobModal${j.getJobId()}">Apply Now</button>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <button type="button"
                                    class="btn btn-outline-primary ms-auto px-5"
                                    style="border: 1px solid #22A699; color: black; background-color: transparent;"
                                    data-bs-toggle="modal"
                                    data-bs-target="#jobModal${j.getJobId()}">Apply Now</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="col-md-8">
            <!-- 70% column -->
            <c:forEach var="j" items="${searchResults}" varStatus="loop">
                <div class="card mb-2 expanded-card" id="card-${j.jobId}">
                    <div class="card-header">
                        <form:form action="apply/${j.getJobId()}" method="post">
                            <div class="mb-3 px-2">
                                <label for="resume" class="form-label">Resume</label> <input
                                    type="text" class="form-control" id="resume" name="resume" required
                                    placeholder="Provide a link to your resume">
                            </div>
                            <!-- Apply Job button in the second column -->
                            <button type="submit"
                                    class="button small mb-3 mx-2 btn btn-outline-primary"
                                    style="border: 1px solid #22A699; color: black; background-color: transparent;"
                                    <c:if test="${matchingJobApplication != null && (matchingJobApplication.status eq 'Pending' || matchingJobApplication.status eq 'Accepted')}">disabled</c:if>>Apply
                                Job</button>
                        </form:form>
                    </div>
                    <form:form action="apply/${j.getJobId()}" method="post">
                        <div class="card-body p-5">
                            <div class="image-and-company-container">
                                <img class="rounded img-fluid"
                                    src="${pageContext.request.contextPath}/images/logo-job.png"
                                    alt="job logo">
                                <h5 class="mb-2 fw-normal">${j.companyName}</h5>
                                <div class="company-info">
                                    <h4 class="pt-3 fs-5 text-muted">Job Description</h4>
                                    <p class="card-title">${j.jobDesc}</p>

                                    <div class="salary-and-job-type">
                                        <div>
                                            <h4 class="pt-3 fs-5 text-muted">Job Type</h4>
                                            <p class="card-text">${j.jobType}</p>
                                        </div>
                                        <div>
                                            <h4 class="pt-3 fs-5 text-muted">Salary</h4>
                                            <p class="card-text">${j.salary}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // Handle card click event
    $('.expandable-card').on('click', function() {
        // Get the target ID from the data attribute
        var targetId = $(this).data('target');
        // Get the index of the clicked card
        var clickedCardIndex = $(this).data('index');

        // Hide all expanded cards except the clicked one
        $('.expanded-card').not(targetId).hide();

        // Show the corresponding card in the 70% column
        $(targetId).show();

        // Adjust the height of the 70% card
        $(targetId).addClass('expanded-card');

        // Update the current card index
        currentCardIndex = clickedCardIndex;
    });
</script>

<jsp:include page="../../footer.jsp"></jsp:include>
