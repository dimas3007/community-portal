<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="dd" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Search User</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
  </head>
  <body>
    <div class="container">
      <dd:import url="../components/header-auth.jsp" />

      <section class="search-result">

		<dd:forEach var="applicant" items="${applicants}">
        <div class="profile-info">
          <div class="profile">
            <div class="profile-bg">
            <dd:choose>
			  	<dd:when test="${empty applicant.getUser().getBackground_foto()}">
				    <div class="profile-bg">
		              <img src="../../assets/img/hackaton.png" alt="" />
		            </div>
			  	</dd:when>
			  	<dd:otherwise>
			    	<img src="../../assets/img/users/${applicant.getUser().getBackground_foto()}" alt="" />
			  	</dd:otherwise>
			  </dd:choose>
            </div>
            <div class="profile-body">
             <dd:choose>
				  	<dd:when test="${empty applicant.getUser().getProfile_foto()}">
					    <img src="../../assets/img/profile.png" alt="" class="profile-foto" />
				  	</dd:when>
				  	<dd:otherwise>
				    	<img
			                src="../../assets/img/users/${applicant.getUser().getProfile_foto()}"
			                alt=""
			                class="profile-foto"
			              />
				  	</dd:otherwise>
			  	</dd:choose>
			  	
              <h1>${applicant.getUser().getFirst_name()} ${applicant.getUser().getLast_name()}</h1>
              <span class="bg-blue">${applicant.getUser().getRole().getName()}</span>
              <p>${applicant.getUser().getAddress()}</p>
            </div>
            <div>
            	<p>Application Status : <b>${applicant.getStatus()}</b></p>
            </div>
            <div class="profile-footer">
              <button class="btn btn-xxs" onclick="openApplyForm('apply', ${applicant.getId()})">Apply</button>
              <button class="btn btn-xxs btn-red" onclick="openApplyForm('reject', ${applicant.getId()})">Reject</button>
              <button class="btn btn-xxs btn-yellow" onclick="openDetailApplicant(${applicant.getId()})">Detail</button>
            </div>
          </div>
        </div>
        </dd:forEach>
        
      </section>
    </div>
    
    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <div class="modal-title">
          <span class="close">&times;</span>
          <h4>Confirmation</h4>
        </div>
        <p apply="confirmation">Are you sure you will hire this job applicant?</p>
        <form class="form" action="update-status-applicant" method="POST">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <input type="hidden" name="status" value=""/>
          <input type="hidden" name="id" value=""/>
          <div class="modal-footer">
            <span></span>
            <a href="">
	            <button class="btn" type="submit" apply="button">Apply</button>            
            </a>
          </div>
        </form>
      </div>
    </div>
    
    <div id="detailApplicant" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <div class="modal-title">
          <span class="close">&times;</span>
          <h4>Confirmation</h4>
        </div>
        <h4>Expected Salary</h4>
       	<p apply="salary">$500 / Month</p>
       	<h4>Applicant Content</h4>
       	<p apply="application">this is my application content</p>
      </div>
    </div>
    
    <script src="../../assets/js/modal.js"></script>
  </body>
</html>
