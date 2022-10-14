<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
  <div class="container"></div>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ABC Jobs | community portal</title>
    <link rel="stylesheet" href="assets/css/style.css" />
  </head>
  <body>
    <div class="container">
	  <c:import url="components/header.jsp" />

      <section class="hero">
        <div class="hero-left">
          <h1>
            Welcome to your <br />
            professional <span class="bg-blue">community</span>
          </h1>
          <p>
            We help you to find best community to build your future and build a
            better future of digital era
          </p>
          <div class="hero-button">
            <button class="btn btn-xl">Get it now</button>
            <a href="" class="btn-link">Learn More</a>
          </div>
        </div>
        <div class="hero-right">
          <img src="./assets/img/hero.png" alt="hero" />
        </div>
      </section>

      <section class="home-thread">
        <!-- <div class="section-title">
          <h3>Trending Topics</h3>
          <a href="" class="btn-link">See all</a>
        </div> -->
        <div class="section-body">
          <div class="thread-item">
            <div class="thread-user">
              <img src="./assets/img/1.png" alt="" />
              <h3>Dorest News</h3>
              <button class="btn btn-xxs">Follow</button>
            </div>
            <div class="thread-img">
              <img src="./assets/img/hackaton.png" alt="" />
            </div>
            <h1 class="thread-title">
              27 new COVID cases in singapore, including 1 in community
            </h1>
            <div class="thread-link">
              <a href="">Read more</a>
              <a href="3 mins read"></a>
              <a href="">30 comments</a>
            </div>
          </div>
          <div class="thread-item">
            <div class="thread-user">
              <img src="./assets/img/1.png" alt="" />
              <h3>Dorest News</h3>
              <button class="btn btn-xxs">Follow</button>
            </div>
            <div class="thread-img">
              <img src="./assets/img/hackaton.png" alt="" />
            </div>
            <h1 class="thread-title">
              27 new COVID cases in singapore, including 1 in community
            </h1>
            <div class="thread-link">
              <a href="">Read more</a>
              <a href="3 mins read"></a>
              <a href="">30 comments</a>
            </div>
          </div>
          <div class="thread-item">
            <div class="thread-user">
              <img src="./assets/img/1.png" alt="" />
              <h3>Dorest News</h3>
              <button class="btn btn-xxs">Follow</button>
            </div>
            <div class="thread-img">
              <img src="./assets/img/hackaton.png" alt="" />
            </div>
            <h1 class="thread-title">
              27 new COVID cases in singapore, including 1 in community
            </h1>
            <div class="thread-link">
              <a href="">Read more</a>
              <a href="">30 comments</a>
            </div>
          </div>
        </div>
      </section>

      <section class="categories">
        <div class="section-title">
          <h3>Topics</h3>
          <a href="" class="btn-link">See all</a>
        </div>
        <div class="card-wrapper">
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/1.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/2.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/3.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/4.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/5.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/6.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
        </div>
        <div class="card-wrapper">
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/1.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/2.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/3.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/4.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/5.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
          <div class="role-item" onclick="toggleClick(this)">
            <img src="./assets/img/6.png" alt="" />
            <h4 class="role-title">Python</h4>
          </div>
        </div>
      </section>

      <!-- <section class="connect">
        <h1>Connect with people</h1>
        <p>
          We help you to find best community to build your future and build a
          better future of digital era
        </p>
      </section> -->

      <section class="join">
        <h1>
          Join your colleagues, classmates, and friends on
          <span class="blue-color">abcJOBS</span>.
        </h1>
        <button class="btn btn-xl">Get it now</button>
        <img src="./assets/img/sas.png" alt="" />
      </section>

      <div class="sitemap">
        <div class="site-left">
          <h1 class="logo">abcJOBS<span class="blue-color">.</span></h1>
          <p>
            We help you to find best community to build your future and build a
            better future of digital era
          </p>
          <p class="copyright">© 2019 -2022 abc jobs PTE LTD.</p>
        </div>
        <div class="site-right">
          <div class="site-item">
            <h4 class="site-title">Topics</h4>
            <a href="">Javascript</a>
            <a href="">HTML</a>
            <a href="">Css</a>
            <a href="">Python</a>
          </div>
          <div class="site-item">
            <h4 class="site-title">General</h4>
            <a href="">Sign Up</a>
            <a href="">Help Center</a>
            <a href="">About</a>
            <a href="">Developers</a>
            <a href="">Learning</a>
            <a href="">Why Us</a>
          </div>
          <div class="site-item">
            <h4 class="site-title">Community</h4>
            <a href="">Sign Up</a>
            <a href="">Help Center</a>
            <a href="">About</a>
          </div>
          <div class="site-item">
            <h4 class="site-title">Community</h4>
            <a href="">Sign Up</a>
            <a href="">Help Center</a>
            <a href="">About</a>
          </div>
        </div>
      </div>

      <c:import url="components/footer.jsp" />
    </div>
  </body>
</html>
