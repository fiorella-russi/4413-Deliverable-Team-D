

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="nav.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/Sign-up.css">
<script>
function signup() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var name = document.getElementById("name").value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "signupservlet", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var response = JSON.parse(xhr.responseText);
            if (xhr.status === 200) {
                if (response.success) {
           
                     document.getElementById("error-message").innerHTML = "Sucessfully Signed Up! Please Log in now!";
                     document.getElementById("error-message").style.backgroundColor = '#74c69d'; 
                     document.getElementById("error-message").style.color = 'white'; 
                     
                  
                     
                } else {
                    
                    document.getElementById("error-message").innerHTML = response.message;
                    document.getElementById("error-message").style.backgroundColor = '#f28482'; 
                    document.getElementById("error-message").style.color = 'white'; 
                }
            } else {
                 
                document.getElementById("error-message").innerHTML = "Error: " + xhr.status;
                document.getElementById("error-message").style.backgroundColor = '#f28482'; 
                document.getElementById("error-message").style.color = 'white'; 
            }
        }
    };

    var data = "email=" + encodeURIComponent(email) + "&password=" + encodeURIComponent(password) + "&name=" + encodeURIComponent(name);
    xhr.send(data);
}

</script>

<title>Signup</title>
</head>
<body>
	<div class="home-container">
		<div class="content-container">

			<div class="welcome-text">
				<form onsubmit="event.preventDefault(); signup();">
				
						<div>
							<h1>Sign up</h1>
						</div>


				<p>Sign up to view and purchase cars.</p>
					<label for="Email">Email:</label><br> <input type="email" id="email"
					 autocomplete="username" required><br>

					<label for="Name">Name:</label> <br><input type="text" id="name"
						 required> <br><label for="Password">Password:</label><br>
					<input type="password" id="password" class="form-field w-input"
						required> </label><input type="submit" value="Create an account">

					<div>
						<span>Already have an account?</span> <a href="log-in.jsp">Log
							In</a>
					</div>
					<div id="error-message" style="color: red;"></div>
				</form>


			</div>
			<div class="image-container"></div>
		</div>
	</div>

</body>
</html>




