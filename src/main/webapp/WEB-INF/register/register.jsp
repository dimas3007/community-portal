<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
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

      <form action="register?page=register" method="POST" class="form form-register">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      	<input type="text" name="username" placeholder="Username" class="input" />
        <input type="text" name="email" placeholder="Email" class="input" />
        <input type="password" name="password" placeholder="Password" class="input" />
        <a href="login" class="link">Have an account?, Login now</a>
        <button type="submit" class="btn">Register</button>
      </form>
    </section>
    
    <c:import url="../components/footer.jsp" />
  </body>
</html>
