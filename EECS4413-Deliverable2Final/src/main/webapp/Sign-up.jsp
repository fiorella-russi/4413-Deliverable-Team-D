

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="nav.jsp" %>

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
                    document.getElementById("error-message").style.color="green";
                     document.getElementById("error-message").innerHTML = "Sucessfully Signed Up! Please Log in now!";
                     
                     
                } else {
                     document.getElementById("error-message").style.color="red";
                    document.getElementById("error-message").innerHTML = response.message;
                }
            } else {
                 document.getElementById("error-message").style.color="red";
                document.getElementById("error-message").innerHTML = "Error: " + xhr.status;
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


	<form onsubmit="event.preventDefault(); signup();">
		<div>
			<div>
				<h3>Sign up</h3>
			</div>


		</div>
		<label for="Email">Email</label> <input type="email" id="email"
			class="form-field w-input" autocomplete="username" required>

		<label for="Name">Name</label> <input type="text" id="name"
			class="form-field w-input" required> <label for="Password">Password</label>
		<input type="password" id="password" class="form-field w-input"
			required> 
			</label><input type="submit" value="Create an account">
	
		<div>
			<span>Already have an account?</span> <a href="log-in.jsp">Log
				In</a>
		</div>
		  <div id="error-message" style="color: red;"></div>
	</form>

</body>
</html>


