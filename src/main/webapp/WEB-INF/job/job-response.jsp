<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="dd" uri="http://java.sun.com/jsp/jstl/core"%> 
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
          <div class="card-item" onclick="getDetailJob(${job.getId()})">
            <div class="card-header">
              <div class="card-company">
                <div class="card-foto">
                  <img src="../../assets/img/companys/${job.getJobOpportunities().getCompany().getProfile_foto()}" alt="" />
                </div>
                <div class="card-title">
                  <h4>${job.getJobOpportunities().getRole().getName()}</h4>
                  <p>${job.getJobOpportunities().getLocation()}</p>
                </div>
              </div>
              <div class="card-action">
			    <span class="btn btn-img" detail="status">${job.getStatus()}</span>
              </div>
            </div>
            <div class="card-info">
              <div>
                <span class="bg-blue">${job.getJobOpportunities().getEmployment_type().getName()}</span>
                <span class="bg-blue">${job.getJobOpportunities().getWork_level().getName()}</span>
              </div>
              <p>${job.getJobOpportunities().getDuration(job.getJobOpportunities().getUpdated_at())}</p>
            </div>
          </div>
		</dd:forEach>
        </section>

		 <dd:choose>
		  	<dd:when test="${!empty jobs}">
		    	<section class="card-detail">
		          <div class="card-foto">
		            <img src="../../assets/img/companys/${jobs.get(0).getJobOpportunities().getCompany().getBackground_foto()}" detail="background" alt="" />
		          </div>
		          <div class="card-info">
		            <div class="card-foto">
		              <img src="../../assets/img/companys/${jobs.get(0).getJobOpportunities().getCompany().getProfile_foto()}" detail="profile" alt="" />
		            </div>
		            <div class="card-header">
		              <div class="card-title">
		                <h4 detail="job">${jobs.get(0).getJobOpportunities().getRole().getName()}</h4>
		                <div>
		                  <a href="" detail="company">${jobs.get(0).getJobOpportunities().getCompany().getName()}</a>
		                  <p detail="location">${jobs.get(0).getJobOpportunities().getLocation()}</p>
		                </div>
		              </div>
		              <div class="card-action">
					    	<span class="btn btn-img" detail="status-detail">${jobs.get(0).getStatus()}</span>
		                <p detail="duration">${jobs.get(0).getJobOpportunities().getDuration(jobs.get(0).getJobOpportunities().getUpdated_at())}</p>
		              </div>
		            </div>
		            <div class="card-applicant">
		     		  <h4>My Application</h4>
		              <div>
		                <h6>Expected Salary</h6>
		                <p detail="expectedSalary">$${jobs.get(0).getExpected_salary()} / Month</p>
		              </div>
		              <div>
		                <h6>Application Content</h6>
		                <p detail="application">
		                	${jobs.get(0).getApplicant()}
		                </p>
		              </div>
		            </div>
		            <div class="card-body">
		              <div>
		                <h6>Experience</h6>
		                <p detail="workExperience">${jobs.get(0).getJobOpportunities().getWorkExperience()}</p>
		              </div>
		              <div>
		                <h6>Work Level</h6>
		                <p detail="level">${jobs.get(0).getJobOpportunities().getWork_level().getName()}</p>
		              </div>
		              <div>
		                <h6>Employee Type</h6>
		                <p detail="employmentType">${jobs.get(0).getJobOpportunities().getEmployment_type().getName()}</p>
		              </div>
		              <div>
		                <h6>Offer Salary</h6>
		                <p detail="salary">$${jobs.get(0).getJobOpportunities().getSalary()} / Month</p>
		              </div>
		            </div>
		          </div>
		          <div class="card-desc">
		            <h4>Description</h4>
		            <p detail="description">
		              ${jobs.get(0).getJobOpportunities().getDescription()}
		            </p>
		          </div>
		        </section>
		  	</dd:when>
		</dd:choose>
        
      </div>
    <dd:import url="../components/footer.jsp" />
    </section>
    
    <script>
    	const getDetailJob = (id) => {
    		fetch(`${window.location.origin}/get-detail-response?id=` + id, {
			    method: 'GET',
			    headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            	}
			}).then(async (response) => {			
				response.json().then(job => {
					const status = document.querySelector("[detail=status-detail]");
					const background = document.querySelector("[detail=background]");
					const profile = document.querySelector("[detail=profile]");
					const jobs = document.querySelector("[detail=job]");
					const company = document.querySelector("[detail=company]");
					const location = document.querySelector("[detail=location]");
					const level = document.querySelector("[detail=level]");
					const employmentType = document.querySelector("[detail=employmentType]");
					const salary = document.querySelector("[detail=salary]");
					const description = document.querySelector("[detail=description]");
					const expectedSalary = document.querySelector("[detail=expectedSalary]");
					const application = document.querySelector("[detail=application]");
					const workExperience = document.querySelector("[detail=workExperience]");
					
					background.src = '../../assets/img/companys/' + job.jobOpportunities.company.background_foto;
					profile.src = '../../assets/img/companys/' + job.jobOpportunities.company.profile_foto;
					jobs.textContent = job.jobOpportunities.role.name;	
					company.textContent = job.jobOpportunities.company.name;
					location.textContent = job.jobOpportunities.location;
					level.textContent = job.jobOpportunities.work_level.name;
					employmentType.textContent = job.jobOpportunities.employment_type.name;
					salary.textContent = '$' + job.jobOpportunities.salary + ' / Month';
					description.textContent = job.jobOpportunities.description;
					status.textContent = job.status;
					expectedSalary.textContent = '$' + job.expected_salary + ' / Month';
					application.textContent = job.applicant;
					workExperience.textContent = job.jobOpportunities.workExperience;
					
				})
				
			}).catch(err => {
			  console.log("Error nih", err);
			});
    	}
    </script>
  </body>
</html>
