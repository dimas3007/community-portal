<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="dd" uri="http://java.sun.com/jsp/jstl/core"%> 
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
			  	<dd:when test="${empty auth.getBackground_foto()}">
				    <div class="profile-bg">
		              <img src="../../assets/img/hackaton.png" alt="" />
		            </div>
			  	</dd:when>
			  	<dd:otherwise>
			    	<div class="profile-bg">
		              <img src="../../assets/img/users/${auth.getBackground_foto()}" alt="" />
		            </div>
			  	</dd:otherwise>
			  </dd:choose>
            <div class="profile-body">
	            <dd:choose>
				  	<dd:when test="${empty auth.getProfile_foto()}">
					    <img src="../../assets/img/profile.png" alt="" class="profile-foto" />
				  	</dd:when>
				  	<dd:otherwise>
				    	<img src="../../assets/img/users/${auth.getProfile_foto()}" alt="" class="profile-foto" />
				  	</dd:otherwise>
			  	</dd:choose>
	            <h1>${auth.getFirst_name()} ${auth.getLast_name()}</h1>
	            <span class="bg-blue">${auth.getRole().getName()}</span>
	            <p>"${auth.getAddress()}"</p>            
            </div>
          </div>
        </section>

        <div class="w-100">
          <section class="overview">
            <h2 class="profile-title">Overview</h2>
            <dd:if test="${!empty message}">
				 <div class="info">
			        <p>${message}</p>
			     </div>
			  </dd:if>
            <form class="form-wrapper items-none" action="profile-update?from=${from}" method="POST" enctype="multipart/form-data">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              <textarea
                name="bio"
                id=""
                cols="2"
                rows="4"
                class="input w-100"
                placeholder="Bio"
              >${auth.getBio()}</textarea>
              <div class="form-group">
                <input type="text" name="first_name" class="input" placeholder="First Name" value="${auth.getFirst_name()}" />
                <input type="text" name="last_name" class="input" placeholder="Last Name" value="${auth.getLast_name()}" />
                <select name="gender" id="" class="input">
                  <option value="male">Male</option>
                  <option value="female">Female</option>
                </select>
              </div>
              <div class="form-group">
                <select name="role" id="" class="input">
                <dd:forEach var="role" items="${roles}">
                  <option value="${role.getId()}">${role.getName()}</option>
                </dd:forEach>
                </select>
                <input type="text" name="phone" class="input" placeholder="Phone" value="${auth.getPhone()}"/>
              </div>
              <textarea
                name="address"
                id=""
                cols="2"
                rows="4"
                class="input w-100"
                placeholder="Adrress"
              >${auth.getAddress()}</textarea>
              <div>
              	<p>Profile foto</p>
              	<input type="file" name="profile">
              </div>
              <div>
              	<p>Background foto</p>
              	<input type="file" name="background">
              </div>
              <button type="submit" class="btn">Update profile</button>
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
