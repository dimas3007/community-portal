<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<header class="auth">
        <h1 class="logo">abcJOBS<span class="blue-color">.</span></h1>
        <div class="header-auth">
        	<a href="thread" class="header-icon">
		          <img src="../../assets/img/home.png" alt="" />
		        </a>
		  <div class="header-icon">
            <img src="../../assets/img/job-blue.png" alt="" />
            <div class="dropdown">
	             <c:choose>
				  	<c:when test="${role == 'admin'}">
				    	<a href="admin-job?operation=add">Job Post</a>
				  	</c:when>
				  </c:choose>
              <a href="job">Job List</a>
               <c:choose>
			  	<c:when test="${role != 'admin'}">
              		<a href="user-job-response">Response</a>
			  	</c:when>
			  </c:choose>
            </div>
          </div>
          <c:choose>
		  	<c:when test="${role == 'admin'}">
				<a href="admin" class="header-icon">
		            <img src="../../assets/img/header1.png" alt="" />
		          </a>	  	
	        </c:when>
	        <c:otherwise>
		    	<a href="search" class="header-icon">
		            <img src="../../assets/img/header1.png" alt="" />
		          </a>	 
		  	</c:otherwise>
		  </c:choose>
          <c:choose>
		  	<c:when test="${role == 'admin'}">
				<a href="email" class="header-icon">
	            <img src="../../assets/img/email.png" alt="" />
	          </a>		  	
	        </c:when>
		  </c:choose>
          <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </form>
          
          <div class="header-profile">
            <a href="find-user?id=${user_log.get().getId()}">${user_log.get().getFirst_name()} ${user_log.get().getLast_name()}</a>
            <div class="profile-dropdown">
              <a onclick="document.forms['logoutForm'].submit()">Logout</a>
            </div>
          </div>
        </div>
      </header>