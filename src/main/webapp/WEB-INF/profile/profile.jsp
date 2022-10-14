<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
  </head>
  <body>
    <div class="container">
      <c:import url="../components/header-auth.jsp" />

      <section class="profile-wrap">
        <section class="profile-info">
          <div class="profile">
	          <c:choose>
			  	<c:when test="${empty uprofile.getBackground_foto()}">
				    <div class="profile-bg">
		              <img src="../../assets/img/hackaton.png" alt="" />
		            </div>
			  	</c:when>
			  	<c:otherwise>
			    	<div class="profile-bg">
		              <img src="../../assets/img/users/${uprofile.getBackground_foto()}" alt="" />
		            </div>
			  	</c:otherwise>
			  </c:choose>
            <div class="profile-body">
	            <c:choose>
				  	<c:when test="${empty uprofile.getProfile_foto()}">
					    <img src="../../assets/img/profile.png" alt="" class="profile-foto" />
				  	</c:when>
				  	<c:otherwise>
				    	<img src="../../assets/img/users/${uprofile.getProfile_foto()}" alt="" class="profile-foto" />
				  	</c:otherwise>
			  	</c:choose>
	            <h1>${uprofile.getFirst_name()} ${uprofile.getLast_name()}</h1>
	            <span class="bg-blue">${uprofile.getRole().getName()}</span>
	            <p>"${uprofile.getAddress()}"</p>            
            </div>
          </div>
          <div class="profile-button">
            <a href="profile-update">
	            <button class="btn btn-icon">
	              <img src="../../assets/img/setting.png" alt="" />
	            </button>
            </a>
          </div>
        </section>

        <div class="section-wrap">
          <section class="overview">
            <h2 class="profile-title">Overview</h2>
            <p>
             ${uprofile.getBio()}
            </p>
            <div class="overview-icon">
              <div class="icon-info">
                <h4>Address</h4>
                <p>${uprofile.getAddress()}</p>
              </div>
              <div class="icon-info">
                 <h4>Phone</h4>
                <p>${uprofile.getPhone()}</p>
              </div>
              <div class="icon-info">
                <h4>Email</h4>
                <p>${uprofile.getId_user().getEmail()}</p>
              </div>
            </div>
          </section>
          
           <section class="experience">
             <div class="section-header">
              <h2 class="profile-title">Experience</h2>
              <a href="add-experience">
	              <button class="btn btn-xxs">
	              	+
	              </button>
              </a>
            </div>

			<c:forEach var="experience" items="${experiences}">
            <div class="experience-item">
              <div class="experience-top">
                <div class="experience-left">
                  <img src="../../assets/img/companys/${experience.getCompany().getProfile_foto()}" alt="" />
                  <div class="experience-info">
                    <h2>${experience.getRole().getName()}</h2>
                    <div class="experience-company">
                      <p>at ${experience.getCompany().getName()}</p>
                      <span class="bg-blue">${experience.getEmploymentType().getName()}</span>
                    </div>
                  </div>
                </div>
                <div class="experience-right">
                  <div class="icon-info text">
                    <img src="" alt="" />
                    <span>${experience.getCompany().getAddress()}</span>
                  </div>
                  <p>${experience.getStart_date()} - ${experience.getLast_date()}</p>
                </div>
              </div>
              <div class="experience-bottom">
                <p>
                  ${experience.getDescription()}
                </p>
              </div>
            </div>
            </c:forEach>
          </section>
        </div>
      </section>
      
      <c:import url="../components/footer.jsp" />
    </div>
  </body>
</html>
