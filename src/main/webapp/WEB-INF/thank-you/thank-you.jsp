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
        <h1 class="main-title">Thank You<span class="blue-color">.</span></h1>
        <p class="description thanks">
	        Thank you, your account is now <span class="blue-color">active</span>,
      		your journey start begin
        </p>
        <p class="text-xs">
         <a href="login" class="btn-link">Login</a>
        </p>
      </div>

    </section>
    <c:import url="../components/footer.jsp" />
  </body>
</html>
