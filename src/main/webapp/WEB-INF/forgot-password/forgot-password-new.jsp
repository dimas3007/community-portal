<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forgot Password | New Password</title>
    <link rel="stylesheet" href="assets/css/style.css" />
  </head>
  <body>
    <section class="register">
      <div class="title">
        <h1 class="main-title">
          Create new Password<span class="blue-color">.</span>
        </h1>
        <p class="description">
          one more step to update your password, fill in your new password in
          the input field below
        </p>
      </div>

      <c:if test="${!empty message}">
		 <div class="info">
	        <p>${message}</p>
	     </div>
	  </c:if>

      <form action="forgot-password-new" method="POST" class="form form-register">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="password" name="password" placeholder="New Password" class="input" />
        <input type="password" name="rpassword" placeholder="Repeat Password" class="input" />
        <button type="submit" class="btn">Create new password</button>
      </form>
    </section>
    
    <c:import url="../components/footer.jsp" />
  </body>
</html>
