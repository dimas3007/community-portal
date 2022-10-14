<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forgot Password</title>
    <link rel="stylesheet" href="assets/css/style.css" />
  </head>
  <body>
    <section class="register">
      <div class="title">
        <h1 class="main-title">
          Forgot Password<span class="blue-color">.</span>
        </h1>
        <p class="description">
          Don't worry if you forget your password, you can still update your
          password
        </p>
      </div>

      <c:if test="${!empty message}">
		 <div class="info">
	        <p>${message}</p>
	     </div>
	  </c:if>

      <form action="forgot-password" method="POST" class="form form-register">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="text" name="email" placeholder="Email" class="input" />
        <button type="submit" class="btn">Reset Password</button>
        <a href="" class="btn-link center"> Back </a>
      </form>
    </section>
      
      <c:import url="../components/footer.jsp" />
  </body>
</html>
