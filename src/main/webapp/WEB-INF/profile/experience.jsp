<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="dd" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile | Experience</title>
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
          <section class="experience">
            <h2 class="profile-title">Experience</h2>
            <form class="form-wrapper items-none" action="add-experience" method="POST">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="form-group">
              <select name="job" id="" class="input">
              <option value="">Job Title</option>
              <dd:forEach var="job" items="${jobs}">
                <option value="${job.getId()}">${job.getName()}</option>
              </dd:forEach>
              </select>
              <select name="employmentType" id="" class="input">
              <option value="">Employment Type</option>
              <dd:forEach var="et" items="${employemntTypes}">
                <option value="${et.getId()}">${et.getName()}</option>
              </dd:forEach>
              </select>
              <select name="company" id="" class="input">
              <option value="">Company</option>
              <dd:forEach var="company" items="${companys}">
                <option value="${company.getId()}">${company.getName()}</option>
              </dd:forEach>
              </select>
            </div>

            <label class="checkbox-label">
              <input name="isCurrentWorking" type="checkbox" class="checkbox" />
              <p>Is currently working</p>
            </label>

            <div class="form-group">
              <input type="date" name="startDate" class="input" placeholder="Start Date" />
              <input type="date" name="endDate" class="input" placeholder="Last Date" />
            </div>
            <div class="form-group">
              <textarea
                name="description"
                id=""
                cols="2"
                rows="4"
                class="input w-100"
                placeholder="Description"
              ></textarea>
              <textarea
                name="location"
                id=""
                cols="2"
                rows="4"
                class="input w-100"
                placeholder="Location"
              ></textarea>
            </div>
            <button type="submit" class="btn">Add Experience</button>
            </form>
          </section>
        </div>
      </section>

      <c:import url="../components/footer.jsp" />
    </div>
    
    <script>
    	document.querySelector("[name=role]").value = "${auth.getRole().getId()}"
    	document.querySelector("[name=gender]").value = "${auth.getGender()}"
    </script>
    
  </body>
</html>
