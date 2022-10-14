<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="dd" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thread</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
  </head>
  <body>
    <section class="container">
     <dd:import url="../components/header-auth.jsp" />

      <div class="wrap-flex">
        <section class="thread">

          <div class="thread-post">
            <div class="thread-profile">
             <dd:choose>
			  	<dd:when test="${empty thread.getUser().getProfile_foto()}">
			  		<img src="../../assets/img/profile.png" alt="" />			  	
			  	</dd:when>
			  	<dd:otherwise>
			  		<img src="../../assets/img/users/${thread.getUser().getProfile_foto()}" alt="" />
			  	</dd:otherwise>
			  </dd:choose>
            </div>
            <div class="thread-info">
              <div class="thread-header">
                <div class="thread-from">
                  <h4>${thread.getUser().getFirst_name()} ${thread.getUser().getLast_name()} <span>@${thread.getUser().getId_user().getUsername()}</span></h4>
                  <p>${thread.getDuration(thread.getUpdated_at())}</p>
                </div>
                <a href="thread-detail?id=${thread.getId()}">
	                <button class="btn btn-img">
	                  <img src="../../assets/img/more.png" alt="" />
	                </button>                
                </a>
              </div>
              <div class="thread-desc">
                  <dd:choose>
				  	<dd:when test="${!empty thread.getThread()}">
				  		<p class="thread-replies">reply to thread <a href="thread-detail?id=${thread.getId()}">@${thread.getThread().getUser().getId_user().getUsername()}</a></p>		  	
				  	</dd:when>
				  </dd:choose>
                <p>
                 	${thread.getContent()}
                </p>
                <img src="../../assets/img/thread/${thread.getFoto()}" alt="" />
              </div>
              <div class="thread-action">
                <div class="thread-button">
                <form action="thread-like" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                <dd:choose>
					  	<dd:when test="${thread.getIsLike(user.getId())}">
					  		<button class="btn btn-img btn-like" disable>
			                    <img src="../../assets/img/like.png" alt="" />
			                    Liked
			                </button> 	  	
					  	</dd:when>
					  	<dd:otherwise>
					  		<button class="btn btn-img" type="submit">
			                    <img src="../../assets/img/like.png" alt="" />
			                    Like
			                </button>
					  	</dd:otherwise>
				  </dd:choose>               
                </form>
                  <button class="btn btn-img">
                    <img src="../../assets/img/comment.png" alt="" />
                    Comment
                  </button>
                </div>
                <p>${thread.getNumberOfLikes()} Likes - ${thread.getNumberOfComments()} Comments</p>
              </div>
              <dd:if test="${!empty message}">
				 <div class="info">
			        <p>${message}</p>
			     </div>
			  </dd:if>
               <form action="save-thread?id=${thread.getId()}" method="POST" enctype="multipart/form-data">
               <div class="message-action comment" comment="comment">
	             	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	             	<input type="file" name="imgComment" hidden>
	                <input
	                  type="text"
	                  name="content"
	                  class="input comment"
	                  placeholder="Type comment..."
	                />
	                <button class="btn btn-img" type="button" onclick="triggerComment()">
	                  <img src="../../assets/img/img.png" alt="" />
	                </button>
	                <button class="btn btn-img" type="submit">
	                  <img src="../../assets/img/send.png" alt="" />
	                </button>
              </div>
              </form>
              
              <!-- Comment Section -->
              <div class="thread-comments">
              
              <dd:forEach var="comment" items="${thread.getThread_reply()}">
                <div class="thread-post">
                  <div class="thread-profile">
                  <dd:choose>
				  	<dd:when test="${empty comment.getUser().getProfile_foto()}">
				  		<img src="../../assets/img/profile.png" alt="" />			  	
				  	</dd:when>
				  	<dd:otherwise>
				  		<img src="../../assets/img/users/${comment.getUser().getProfile_foto()}" alt="" />
				  	</dd:otherwise>
				  </dd:choose>
                  </div>
                  <div class="thread-info">
                    <div class="thread-header">
                      <div class="thread-from">
                         <h4>${comment.getUser().getFirst_name()} ${comment.getUser().getLast_name()} <span>@${thread.getUser().getId_user().getUsername()}</span></h4>
                  		 <p>${comment.getDuration(comment.getUpdated_at())}</p>
                      </div>
                      <a href="thread-detail?id=${comment.getId()}">
	                      <button class="btn btn-img">
	                        <img src="../../assets/img/more.png" alt="" />
	                      </button>                      
                      </a>
                    </div>
                    <div class="thread-desc">
                      <p>
                        ${comment.getContent()}
                      </p>
                    </div>
                    <div class="thread-action">
                      <div class="thread-button">
                        <a href="thread-detail?id=${comment.getId()}">Show replies (${comment.getNumberOfComments()})</a>
                      </div>
                      <p>${comment.getNumberOfLikes()} Likes</p>
                    </div>
                  </div>
                </div>
                </dd:forEach>
                
              </div>
              
            </div>
          </div>
        </section>
      </div>
    </section>
    
    <script>
	    const triggerFile = () => {
			document.querySelector("[name=img]").click()
		}
	    
	    const triggerComment = () => {
			document.querySelector("[name=imgComment]").click()
		}
    </script>
  </body>
</html>
