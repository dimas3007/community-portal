<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register | Who Are You</title>
    <link rel="stylesheet" href="assets/css/style.css" />
  </head>
  <body>
    <section class="register">
      <div class="title">
        <h1 class="main-title">Who are you<span class="blue-color">.</span></h1>
        <p class="description">
          By knowing your area of ​​expertise, it will be easier for us to
          recommend people who share your interests
        </p>
      </div>
      
      <c:if test="${!empty message}">
		 <div class="info">
	        <p>${message}</p>
	     </div>
	  </c:if>
	  
      <div class="roles">
      <c:forEach var="role" items="${roles}">
        <div class="role-item" onclick="toggleClick(this)" role="${role.getId()}">
          <img src="./assets/img/${role.getFoto()}" alt="" />
          <h4 class="role-title">${role.getName()}</h4>
        </div>
      </c:forEach>
      </div>

      <div class="btn-wrapper">
      	<form action="register?page=field" method="POST">
      	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      		<input type="hidden" name="role" value="">
      		<button type="submit" class="btn">Finish</button>
      	</form>
      </div>
    </section>

 <c:import url="../components/footer.jsp" />
      
    <script>
      const toggleClick = e => {
        const elements = document.getElementsByClassName('role-item');

        Array.from(elements).forEach(function (item) {
          item.classList.remove('border-blue');
        });

        e.classList.add('border-blue');
        document.querySelector("[name=role]").value = e.getAttribute("role");
      };
      
    </script>
  </body>
</html>
