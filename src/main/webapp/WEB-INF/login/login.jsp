<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="assets/css/style.css" />
  </head>
  <body>
    <section class="register">
      <div class="title">
        <h1 class="main-title">Login<span class="blue-color">.</span></h1>
        <p class="description">
          We help you to find best community to build your future and build a
          better future of digital era
        </p>
      </div>

      <c:if test="${!empty message}">
		 <div class="info">
	        <p>${message}</p>
	     </div>
	  </c:if>

      <form action="${contextPath}/login" method="POST" class="form form-register">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="text" name="username" placeholder="Email" class="input" />
        <input type="password" name="password" placeholder="Password" class="input" />
        <a href="forgot-password" class="link">Forgot password ?</a>
        <button type="submit" class="btn">Log in</button>
      </form>
    </section>
    
    <footer class="footer">
        <h1 class="logo">abcJOBS<span class="blue-color">.</span></h1>
        <p>&copy; 2019 - 2022 abc jobs PTE ltd.</p>
      </footer>
  </body>
</html>
