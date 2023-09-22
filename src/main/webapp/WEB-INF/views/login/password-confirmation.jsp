<jsp:include page="../../header.jsp">
    <jsp:param value="Password Confirmation" name="HTMLtitle" />
</jsp:include>

<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card shadow-lg w-75 d-flex justify-content-center align-items-center rounded-3 border border-1 border border-dark bg-white">
        <img src="images/img2.svg" width="530px" height="400px" style="transform: translateY(-50%); position: absolute;" alt="happy people">
        <div class="card-body text-center " style="margin-top: 170px;">
            <h5 class="card-title text-success ms-5 me-5" style="font-family: 'Tangerine', cursive; font-size: 80px;">Password Updated!</h5>
            <p class="card-text fs-5" style="font-family: 'Roboto Slab', serif;">
                Your password has been changed successfully.<br> Use your new password to log in.
            </p>
            <a href="login" class="btn btn-custom-button mb-3" style="min-width: 150px; font-family: 'Roboto Slab', serif;">Log In</a>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
