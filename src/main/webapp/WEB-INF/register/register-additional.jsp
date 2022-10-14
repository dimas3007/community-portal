<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register | Additional</title>
    <link rel="stylesheet" href="assets/css/style.css" />
  </head>
  <body>
    <section class="register">
      <div class="title">
        <h1 class="main-title">Register<span class="blue-color">.</span></h1>
        <p class="description">
          in just a few steps to become a part of a large community of
          professional developers
        </p>
      </div>
      
      <c:if test="${!empty message}">
		 <div class="info">
	        <p>${message}</p>
	     </div>
	  </c:if>

      <form action="register?page=additional" method="POST" class="form form-register">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="text" name="first_name" placeholder="First Name" class="input" />
        <input type="text" name="last_name" placeholder="Last Name" class="input" />
        <input type="text" name="phone" placeholder="Phone" class="input" />
        <select name="gender" id="" class="input">
          <option value="male">Male</option>
          <option value="female">Female</option>
        </select>
        <input type="text" name="address" placeholder="Address" class="input" />
        <button type="submit" class="btn">Next</button>
      </form>
    </section>
    
    <c:import url="../components/footer.jsp" />
  </body>
</html>
