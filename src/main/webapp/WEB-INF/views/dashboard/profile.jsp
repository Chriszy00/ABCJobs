<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="../../header.jsp">
        <jsp:param value="Update Profile" name="HTMLtitle" />
    </jsp:include>


 <div class="container" style="font-family: 'Open Sans', sans-serif; font-weight: 600;">
            <div class="row">
            <div class="col-lg-3">
                <div class="card  mt-5">
                 <div class="card-header">Profile Picture</div>
                    <div class="card-body">
                  <div class="account-settings">
                    <div class="user-profile">
                        <div class="user-avatar">
                            <img class="rounded-circle" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Maxwell Admin">
                        </div>
                        <h5 class="user-name">${firstName} ${lastName}</h5>
                        <h5 class="user-title">${title}</h5>                        
                        <h6 class="user-email">${email}</h6>
                    </div> 
                                      
                 </div>  
                 <div class="" style="text-align:center; ">
                    <a href="update-profile" class="btn btn-primary text-center">Edit Profile</a>
                </div>               
               </div>                               
             </div>
           </div>

          <!--- Personal Details, About, Experience, and Education Card-->                             
            <div class="col-lg-6 gedf-main mt-5" style="font-family: 'Open Sans', sans-serif; font-weight: 600;">          
                    <div class="card social-timeline-card">
                    <div class="card-header">
					<h2>Personal Details</h2>
                    </div>
					  <div class="card-body">
         		<div class="row gutters">
                  
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter first name" value="${firstName}">
                        </div>
                    </div>
                       <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter last name" value="${lastName}">
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email ID" value="${email}" disabled>
                        </div>
                    </div>

                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <label for="website">Websites</label>
                            <input type="text" class="form-control" id="website" name="website" placeholder="Website url" value="${website}">
                        </div>
                    </div>
                    
                      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <label for="company">Company</label>
                            <input type="text" class="form-control" id="company" name="companyName" placeholder="Company" value="${company}">
                        </div>
                    </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                            <label for="title">Position</label>
                            <input type="text" class="form-control" id="title" name="title" placeholder="Position" value="${title}">
                        </div>
                    </div>
                </div>
					  </div>				
                </div>
                
                 <%-- About --%>
                 <div class="card social-timeline-card">
                    <div class="card-header">
					<h2>About</h2>
                    </div>
					  <div class="card-body">
					  	<textarea class="form-control" name="about" id="about" cols="10">${about}</textarea>						
					  </div>				
                </div>
                    
                    
                </div>
            </div>
    </div>
    
<script src="../js/profile.js">
</script>

<jsp:include page="../../footer.jsp"></jsp:include>