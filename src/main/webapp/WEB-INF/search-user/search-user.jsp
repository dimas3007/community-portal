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
      <form method="POST" action="search?type=search">
        <input
          type="text"
          class="input w-100 white-color"
          name="search"
          placeholder="Search (Name)"
        />
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button class="btn" hidden>Search</button>
      </form>
      </section>

      <section class="search-result">
      	<dd:forEach var="user" items="${users}">
			<div class="result-item">
	          <div class="result-left">
	            <img src="../assets/img/profile.png" alt="" />
	            <div class="result-user">
	              <a href="find-user?id=${user.getId()}">
	              	<h1>${user.getFirst_name()} ${user.getLast_name()}</h1>
	              </a>
	              <h3>${user.getRole().getName()}</h3>
	            </div>
	          </div>
	          <div class="result-right">
	            <div>
	              <button class="btn btn-xxs">+ Connect</button>
	            </div>
	            <div class="img-group">
	              <img src="../assets/img/3.png" alt="" />
	              <img src="../assets/img/2.png" alt="" />
	              <img src="../assets/img/5.png" alt="" />
	            </div>
	          </div>
	        </div>
		</dd:forEach>
      </section>
      
      <c:import url="../components/footer.jsp" />
    </div>
  </body>
</html>
