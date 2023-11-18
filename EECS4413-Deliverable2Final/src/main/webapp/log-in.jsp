

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="nav.jsp"%>
<%@ include file="chat.jsp" %>

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
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                if (response.success) {
                    if (response.admin) {
                        window.location.href = "admin.jsp";
                    } else {
                        window.location.href = "home.jsp";
                    }
                } else {
                    document.getElementById("error-message").innerHTML = response.message;
                }

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
	<div style="background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-width: 400px;">
		<form onsubmit="event.preventDefault(); login();">
			<div>
				<div>
					<h3>Log in</h3>
				</div>
				<p>Sign in to view and purchase cars.</p>
				<label for="email">Email : </label><input type="email" id="email"
					name="email">
				<p></p>
				<label for="password">Password : </label><input type="password"
					id="password" name="password"> <input type="submit"
					value="Log In">
				<div class="form-divider"></div>
				<div>
					<p></p>
					<span class="text-color-gray-500">Don't have an account?</span> <a
						href="Sign-up.jsp"><strong>Sign Up</strong></a>
				</div>
			</div>
			<div id="error-message" style="color: red;"></div>

		</form>
	</div>


</body>
</html>


