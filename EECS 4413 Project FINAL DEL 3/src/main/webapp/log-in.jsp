

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="nav.jsp"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/log-in.css">

<script>
function login() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "loginservlet", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                if (response.redirect) {
                    window.location.href = response.redirect;
                } else if (response.admin) {
                    window.location.href = "admin.jsp";
                } else {
                    window.location.href = "home.jsp";
                }
            } else {
                document.getElementById("error-message").innerHTML = response.message;
                document.getElementById("error-message").style.backgroundColor = '#f28482'; 
                document.getElementById("error-message").style.color = 'white'; 
            }
        }
    };

    var data = "email=" + encodeURIComponent(email) + "&password=" + encodeURIComponent(password);
    xhr.send(data);
}
</script>



<title>Login</title>
</head>
<body>
    <div class="home-container">
        <div class="content-container">
        
            <div class="welcome-text">
              <form onsubmit="event.preventDefault(); login();">
					<div>
						<div>
						<h1>Login</h1>
						</div>
						<p>Sign in to view and purchase cars.</p>
						<label for="email">Email : </label><br><input type="email" id="email" name="email" required><br>
						
						<label for="password">Password : </label><br><input type="password" id="password" name="password" required>
							
							 <input type="submit" value="Log In">
						<div class="form-divider"></div>
						<div>
							<p></p>
							<span>Don't have an account?</span> <a
								href="Sign-up.jsp"><strong>Sign Up</strong></a>

						</div>
					</div>
					<div id="error-message" style="color: red;"></div>

				</form>
                
            </div>
            <div class="image-container"></div>
        </div>
    </div>

</body>
</html>





