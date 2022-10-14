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
    <link rel="stylesheet" href="assets/css/style.css" />
  </head>
  <body>
    <div class="container">
      <dd:import url="../components/header-auth.jsp" />

      <section class="search">
      <form method="POST" action="search?type=admin">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input
          type="text"
          class="input w-100 white-color"
          name="search"
          placeholder="Search (Name)"
        />
        <button class="btn" hidden>Search</button>
      </form>
      </section>

      <section class="search-result" style="padding-bottom: 10rem;">
          <dd:forEach var="user" items="${users}" varStatus="i">
          
          <div class="profile-info" style="margin-top: 0;">
          <div class="profile">
            <div class="profile-bg">
            <dd:choose>
			  	<dd:when test="${empty user.getBackground_foto()}">
				    <div class="profile-bg">
		              <img src="../../assets/img/hackaton.png" alt="" />
		            </div>
			  	</dd:when>
			  	<dd:otherwise>
			    	<img src="../../assets/img/users/${user.getBackground_foto()}" alt="" />
			  	</dd:otherwise>
			  </dd:choose>
            </div>
            <div class="profile-body">
             <dd:choose>
				  	<dd:when test="${empty user.getProfile_foto()}">
					    <img src="../../assets/img/profile.png" alt="" class="profile-foto" />
				  	</dd:when>
				  	<dd:otherwise>
				    	<img
			                src="../../assets/img/users/${user.getProfile_foto()}"
			                alt=""
			                class="profile-foto"
			              />
				  	</dd:otherwise>
			  	</dd:choose>
			  	
              <h1>${user.getFirst_name()} ${user.getLast_name()}</h1>
              <span class="bg-blue">${user.getRole().getName()}</span>
              <p>${user.getAddress()}</p>
            </div>
            <div class="profile-footer">
	            <a href="delete-user?id=${user.getId()}">
	              <button class="btn btn-xxs btn-red">Delete</button>	            
	            </a>
	            <a href="user-update?id=${user.getId()}">
	              <button class="btn btn-xxs">Update</button>	            
	            </a>
	             <a href="find-user?id=${user.getId()}">
	              <button class="btn btn-xxs btn-yellow">Detail</button>	            
	            </a>
            </div>
          </div>
        </div>
        </dd:forEach>
      </section>
      
      <dd:import url="../components/footer.jsp" />
    </div>
  </body>
</html>
