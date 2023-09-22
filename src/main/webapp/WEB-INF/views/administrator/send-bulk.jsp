<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../header.jsp">
    <jsp:param value="Send Bulk Email" name="HTMLtitle" />
</jsp:include>

<div class="container m-5 justify-content-center align-items-center" style="font-family: 'Open Sans', sans-serif;">
    <div class="card">
    <div class="card-header">
    	<h3>Send Message</h3>
        <div class="card-body">
            <form:form action="send-bulk" method="post" modelAttribute="sendBulk">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="subject" name="emailSubject">
                    <label for="subject">Subject</label>
                </div>
                <div class="form-floating mb-3">
                    <textarea class="form-control" id="body" name="emailBody"></textarea>
                    <label for="body">Body</label>
                </div>
                <button type="submit" class="btn btn-primary">Send</button>
            </form:form>
        </div>
    </div>
    </div>
</div>

