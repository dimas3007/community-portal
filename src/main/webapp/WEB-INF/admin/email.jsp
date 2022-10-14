<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="dd" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Email</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
    
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
  </head>
  <body>
    <div class="container">
      <dd:import url="../components/header-auth.jsp" />

        <div class="w-100">
          <section class="overview">
            <h2 class="profile-title">Send Email</h2>
            <form>
            <div class="form-wrapper items-none">
              <input type="text" class="input" name="email" placeholder="Email (using ',' to separate a new email)" />
              <input type="text" class="input" name="subject" placeholder="Subject" />
              <textarea
                name="description"
                id=""
                cols="2"
                rows="4"
                class="input w-100"
                placeholder="Description"
              ></textarea>
              <button class="btn" onclick="sendEmail(event)">Send</button>
            </div>
            </form>
          </section>
        </div>
      
       <section class="search-result">
        <table class="table">
          <thead>
            <tr>
              <td>No</td>
              <td>Name</td>
              <td>Gender</td>
              <td>Email</td>
              <td>Username</td>
              <td>Phone</td>
              <td>Role</td>
              <td>User Type</td>
              <td>Bio</td>
              <td>#</td>
            </tr>
          </thead>
          <tbody>
          <dd:forEach var="user" items="${users}" varStatus="i">
            <tr>
              <td>${i.index + 1}</td>
              <td>${user.getFirst_name()} ${user.getLast_name()}</td>
              <td>${user.getGender()}</td>
              <td>${user.getId_user().getEmail()}</td>
              <td>${user.getId_user().getUsername()}</td>
              <td>${user.getPhone()}</td>
              <td>${user.getRole().getName()}</td>
              <td>${user.getUser_type().getName()}</td>
              <td>${user.getBio()}</td>
              <td><input type="checkbox" value="${user.getId_user().getEmail()}" onchange="checkChange(this)"></td>
            </tr>
            </dd:forEach>
          </tbody>
        </table>
      </section>

    </div>
    
    <script>
    	const sendEmail = (e) => {
	      e.preventDefault();
	      
	      document.querySelector(".btn").disabled = true;
	      document.querySelector(".btn").textContent = "Sending..."; 
	    
	      const listEmail = document.querySelector('[name=email]').value;
	      const subject = document.querySelector('[name=subject]').value;
	      const description = document.querySelector('[name=description]').value;
        	
    	const token = document.querySelector("meta[name='_csrf']").getAttribute("content");
    	const header = document.querySelector("meta[name='_csrf_header']").getAttribute("content");
    
	    fetch(`${window.location.origin}/send-email?emails=` + listEmail +`&subject=`+subject +`&description=`+description, {
	        method: 'POST',
	        headers: new Headers([[header, token]], ['Content-Type', 'application/json'])
	    }).then(async (response) => {
	    	response.text().then(res => {
	    		
	    		if (res == "success") {
	    			document.querySelector(".btn").disabled = false;
	    			document.querySelector(".btn").classList.add("btn-green");
	    			document.querySelector(".btn").textContent = "Sent"; 
	    			 
	    			setTimeout(() => {
	    				document.querySelector(".btn").disabled = false;
	    				document.querySelector(".btn").classList.remove("btn-green");
	    				document.querySelector(".btn").textContent = "Send"; 
	    			}, 3000);
	    		} else {
	    			document.querySelector(".btn").disabled = false;
	    			document.querySelector(".btn").classList.add("btn-red");
	    			document.querySelector(".btn").textContent = "Error"; 
	    			 
	    			setTimeout(() => {
	    				document.querySelector(".btn").disabled = false;
	    				document.querySelector(".btn").classList.remove("btn-red");
	    				document.querySelector(".btn").textContent = "Send"; 
	    			}, 3000);
	    		}
	    	})
	    }).catch(err => {
	      console.log("Error nih", err);
	    });
	    
    
    }
    	
    	const checkChange = (email) => {
    		const inputEmail = document.querySelector('[name=email]');
    		const valueEmail = inputEmail.value;
    		
    		if(email.checked == true){
    			const newEmail = valueEmail + email.value + ',';
    			inputEmail.value = newEmail;
   		    } else {
   		    	inputEmail.value = valueEmail.replace(email.value + ',', '')
   		    }
    		
    	}
    </script>
  </body>
</html>
