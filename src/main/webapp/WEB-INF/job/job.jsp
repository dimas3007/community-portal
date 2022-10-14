<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="dd" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Jobs</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
  </head>
  <body>
    <section class="container">
      <dd:import url="../components/header-auth.jsp" />

      <div class="wrap-flex">
        <section class="card-list">
        
        <dd:forEach var="job" items="${jobs}">
          <dd:choose>
		  	<dd:when test="${role == 'admin'}">
		    	<div class="card-item" onclick="getDetailJob(${job.getId()}, '${job.getDuration(job.getUpdated_at())}', ${job.getNumberOfApplicants()})">
		  	</dd:when>
		  	<dd:otherwise>
		    	<div class="card-item" onclick="getDetailJob(${job.getId()}, '${job.getDuration(job.getUpdated_at())}', 0, '${job.getIsApply(user.getId())}')">
		  	</dd:otherwise>
		  </dd:choose>
            <div class="card-header">
              <div class="card-company">
                <div class="card-foto">
                  <img src="../../assets/img/companys/${job.getCompany().getProfile_foto()}" alt="" />
                </div>
                <div class="card-title">
                  <h4>${job.getRole().getName()}</h4>
                  <p>${job.getLocation()}</p>
                </div>
              </div>
              <div class="card-action">
                
              </div>
            </div>
            <div class="card-info">
              <div>
                <span class="bg-blue">${job.getEmployment_type().getName()}</span>
                <span class="bg-blue">${job.getWork_level().getName()}</span>
              </div>
              <p>${job.getDuration(job.getUpdated_at())}</p>
            </div>
          </div>
		</dd:forEach>
        </section>
        
	<dd:choose>
		<dd:when test="${!empty jobs}">
		
        <section class="card-detail">
        <dd:if test="${!empty message}">
			 <div class="info">
		        <p>${message}</p>
		     </div>
		  </dd:if>
          <div class="card-foto">
            <img src="../../assets/img/companys/${jobs.get(0).getCompany().getBackground_foto()}" detail="background" alt="" />
          </div>
          <div class="card-info">
            <div class="card-foto">
              <img src="../../assets/img/companys/${jobs.get(0).getCompany().getProfile_foto()}" detail="profile" alt="" />
            </div>
            <div class="card-header">
              <div class="card-title">
                <h4 detail="job">${jobs.get(0).getRole().getName()}</h4>
                <div>
                  <a href="" detail="company">${jobs.get(0).getCompany().getName()}</a>
                  <p detail="location">${jobs.get(0).getLocation()}</p>
                </div>
              </div>
              <div class="card-action">
                <div style="display: flex; gap: .8rem;">
                  <dd:choose>
				  	<dd:when test="${role == 'admin'}">
					  	<a href="admin-job?id=${jobs.get(0).getId()}&operation=update" detail="urlUpdate">
					    	<button class="btn btn-img">
			                  Update
			                </button>
		                </a>
		                <a href="delete-job?id=${jobs.get(0).getId()}" detail="urlDelete">
			                <button class="btn btn-img">
			                  Delete
			                </button>		                
		                </a>
		                <a detail="urlApplicant" href="admin-job-applicant?id=${jobs.get(0).getId()}">		                
			                <button class="btn btn-img" detail="applicant">
			                  ${jobs.get(0).getNumberOfApplicants()} Applicants
			                </button>
		                </a>
				  	</dd:when>
				  	<dd:when test="${jobs.get(0).getIsApply(user.getId())}">
			  			<button class="btn btn-img" detail="btnApply">
		                 <img src="../../assets/img/job.png" alt="" /> 
		                 <span>Applied</span>
		                </button>
					</dd:when>
				  	<dd:otherwise>
					  	<button class="btn btn-img" onclick="openApplyForm()" detail="btnApply">
		                 <img src="../../assets/img/job.png" alt="" /> <span>Apply</span>
		                </button>
				  	</dd:otherwise>
				  </dd:choose>
                </div>
                <p detail="duration">${jobs.get(0).getDuration(jobs.get(0).getUpdated_at())}</p>
              </div>
            </div>
            <div class="card-body">
              <div>
                <h6>Experience</h6>
                <p detail="workExperience">${jobs.get(0).getWorkExperience()}</p>
              </div>
              <div>
                <h6>Work Level</h6>
                <p detail="level">${jobs.get(0).getWork_level().getName()}</p>
              </div>
              <div>
                <h6>Employee Type</h6>
                <p detail="employmentType">${jobs.get(0).getEmployment_type().getName()}</p>
              </div>
              <div>
                <h6>Offer Salary</h6>
                <p detail="salary">$${jobs.get(0).getSalary()} / Month</p>
              </div>
            </div>
          </div>
          <div class="card-desc">
            <h4>Description</h4>
            <p detail="description">
              ${jobs.get(0).getDescription()}
            </p>
          </div>
        </section>
      </div>
    <dd:import url="../components/footer.jsp" />
    </section>

    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <div class="modal-title">
          <span class="close">&times;</span>
          <h4>Apply Job</h4>
        </div>
        <sf:form class="form" action="add-job-applicant" method="POST" modelAttribute="jobApplicant">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <sf:input type="hidden" path="jobOpportunities" name="jobOpportunities" value="${jobs.get(0).getId()}"/>
          <sf:input type="text" path="expected_salary" name="salary" class="input" placeholder="Expected Salary ($)" />
          <sf:textarea
            name="applicant"
            id=""
            cols="2"
            rows="4"
            class="input w-100"
            placeholder="Applicant Content"
            path="applicant"
          ></sf:textarea>
          <div class="modal-footer">
            <span></span>
            <button class="btn" type="submit">Apply</button>
          </div>
        </sf:form>
      </div>
    </div>
    </dd:when>
</dd:choose>
    <script>
    	const span = document.getElementsByClassName('close')[0];
      	const modal = document.getElementById('myModal');
      	
    	const getDetailJob = (id, NumberOfduration, NumberOfapplicant = 0, isApply = false) => {
    		console.log(isApply);
    		fetch(`${window.location.origin}/get-detail-job?id=` + id, {
			    method: 'GET',
			    headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            	}
			}).then(async (response) => {		
				
				response.json().then(job => {
					const background = document.querySelector("[detail=background]");
					const profile = document.querySelector("[detail=profile]");
					const jobs = document.querySelector("[detail=job]");
					const company = document.querySelector("[detail=company]");
					const location = document.querySelector("[detail=location]");
					const level = document.querySelector("[detail=level]");
					const employmentType = document.querySelector("[detail=employmentType]");
					const salary = document.querySelector("[detail=salary]");
					const description = document.querySelector("[detail=description]");
					const workExperience = document.querySelector("[detail=workExperience]");
					
					const ids = document.querySelector("[name=jobOpportunities]");
					
					const applicant = document.querySelector("[detail=applicant]");
					const duration = document.querySelector("[detail=duration]");
					const url = document.querySelector("[detail=urlApplicant]");
					
					const urlDelete = document.querySelector("[detail=urlDelete]");
					const urlUpdate = document.querySelector("[detail=urlUpdate]");
					
					background.src = '../../assets/img/companys/' + job.company.background_foto;
					profile.src = '../../assets/img/companys/' + job.company.profile_foto;
					jobs.textContent = job.role.name;	
					company.textContent = job.company.name;
					location.textContent = job.location;
					level.textContent = job.work_level.name;
					employmentType.textContent = job.employment_type.name;
					salary.textContent = '$' + job.salary + ' / Month';
					ids.value = job.id;
					description.textContent = job.description;
					duration.textContent = NumberOfduration;
					workExperience.textContent = job.workExperience;
					
					const role = `${role}`;
					if (role == 'admin') {
						url.href = window.location.origin + "/admin-job-applicant?id=" + id
						urlDelete.href= window.location.origin + "/delete-job?id=" + id
						urlUpdate.href= window.location.origin + "/admin-job?id=" + id + "&operation=update"
	
						applicant.textContent = NumberOfapplicant + " Applicants";						
					} else {
						const btnApply = document.querySelector("[detail=btnApply]");
						const btnApplyText = document.querySelector("[detail=btnApply]>span");
						
						if (isApply == "true") {
							btnApplyText.textContent = "Applied";
							btnApply.setAttribute("onclick", "");
						} else {
							btnApplyText.textContent = "Apply";
							btnApply.setAttribute("onclick", "openApplyForm()");
						}
					}
					
				})
				
			}).catch(err => {
			  console.log("Error nih", err);
			});
    	}
    	
		const openApplyForm = () => {
	        modal.style.display = 'block';
	        modal.style.transform = 'translateY(-0.5rem)';
	    };
	
      span.onclick = () => {
        modal.style.display = 'none';
      };

      window.onclick = event => {
        if (event.target == modal) {
          modal.style.display = 'none';
        }
      };
    </script>
  </body>
</html>
