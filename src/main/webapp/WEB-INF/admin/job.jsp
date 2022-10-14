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
    <title>Profile | Update</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
  </head>
  <body>
    <div class="container">
     <dd:import url="../components/header-auth.jsp" />

     <section class="profile-wrap">
        <section class="profile-info">
          <div class="profile">
	          <dd:choose>
			  	<dd:when test="${empty user.getBackground_foto()}">
				    <div class="profile-bg">
		              <img src="../../assets/img/hackaton.png" alt="" />
		            </div>
			  	</dd:when>
			  	<dd:otherwise>
			    	<div class="profile-bg">
		              <img src="../../assets/img/users/${user.getBackground_foto()}" alt="" />
		            </div>
			  	</dd:otherwise>
			  </dd:choose>
            <div class="profile-body">
	            <dd:choose>
				  	<dd:when test="${empty user.getProfile_foto()}">
					    <img src="../../assets/img/profile.png" alt="" class="profile-foto" />
				  	</dd:when>
				  	<dd:otherwise>
				    	<img src="../../assets/img/users/${user.getProfile_foto()}" alt="" class="profile-foto" />
				  	</dd:otherwise>
			  	</dd:choose>
	            <h1>${user.getFirst_name()} ${user.getLast_name()}</h1>
	            <span class="bg-blue">${user.getRole().getName()}</span>
	            <p>"${user.getAddress()}"</p>            
            </div>
          </div>
        </section>

       <div class="w-100">
          <section class="overview">
            <h2 class="profile-title">${operation} Job Opportunities</h2>
            <dd:if test="${!empty message}">
			 <div class="info">
		        <p>${message}</p>
		     </div>
		  </dd:if>
            <sf:form class="form-wrapper items-none" action="admin-add-job" method="POST" modelAttribute="job">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="id" value="${job.getId()}"/>
            <input type="hidden" name="operation" value="${operation}"/>
            <div class="form-wrapper items-none">
              <sf:textarea
                name="description"
                path="description"
                cols="2"
                rows="4"
                class="input w-100"
                placeholder="Description"
              ></sf:textarea>
              <div class="form-group">
                <sf:input type="text" name="salary" path="salary" class="input" placeholder="Salary ($)" value="${job.getSalary()}" />
                <sf:select name="employment_type" path="employment_type" id="" class="input">
                  <option value="">Employment Type</option>
                  <dd:forEach var="et" items="${employemntTypes}">
                  	<sf:option value="${et.getId()}">${et.getName()}</sf:option>
                  </dd:forEach>
                </sf:select>
                <sf:select name="company" path="company" id="" class="input">
                <option value="">Company</option>
	                <dd:forEach var="company" items="${companys}">
	                  <sf:option value="${company.getId()}">${company.getName()}</sf:option>
	                </dd:forEach>
                </sf:select>
              </div>
              <div class="form-group">
                <sf:select name="role" path="role" id="" class="input">
                  <option value="">Job Title</option>
                  <dd:forEach var="role" items="${roles}">
	                <sf:option value="${role.getId()}">${role.getName()}</sf:option>
	              </dd:forEach>
                </sf:select>
                <sf:select name="work_level" path="work_level" id="" class="input">
                  <option value="">Work Level</option>
                  <dd:forEach var="level" items="${workLevels}">
	                <sf:option value="${level.getId()}">${level.getName()}</sf:option>
	              </dd:forEach>
                </sf:select>
                <sf:select name="workExperience" path="workExperience" id="" class="input">
                  <option value="">Minimum Work Experience</option>
                  <option value="< 1 Years">< 1 Years</option>
                  <option value="1 Years">1 Years</option>
                  <option value="2 Years">2 Years</option>
                  <option value="3 Years">3 Years</option>
                  <option value="3++ Years">3++ Years</option>
                </sf:select>
              </div>
              <sf:textarea	
                name="location"
                path="location"
                id=""
                cols="2"
                rows="4"
                class="input w-100"
                placeholder="Address"
              ></sf:textarea>
            </div>
            <button type="submit" class="btn">${operation} Job</button>
            </sf:form>
          </section>

      <dd:import url="../components/footer.jsp" />
    </div>
    
    <script>
    	document.querySelector("[name=employment_type]").value = "${job.getEmployment_type().getId()}"
    	document.querySelector("[name=company]").value = "${job.getCompany().getId()}"
    	document.querySelector("[name=role]").value = "${job.getRole().getId()}"
    	document.querySelector("[name=work_level]").value = "${job.getWork_level().getId()}"
    	document.querySelector("[name=workExperience]").value = "${job.getWorkExperience()}"
    </script>
    
  </body>
</html>
