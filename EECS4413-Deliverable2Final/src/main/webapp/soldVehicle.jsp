<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="adminNav.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Mark Sold</title>
    <link rel="stylesheet" type="text/css" href="styles/soldVehicle.css">
    <script>
        function markSold() {
            var id = document.getElementById("id").value;
            var dateSold = document.getElementById("dateSold").value;
            var soldPrice = document.getElementById("soldPrice").value;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "MarkSoldVehicleServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        var errorMessage = document.getElementById("error-message");
                        if (response.success) {
                            errorMessage.textContent = response.message;
                            errorMessage.classList.remove("error");
                            errorMessage.classList.add("success");
                        } else {
                            errorMessage.textContent = response.message;
                            errorMessage.classList.remove("success");
                            errorMessage.classList.add("error");
                        }
                    }
                }
            };

            var data = "id=" + encodeURIComponent(id) + "&dateSold=" + encodeURIComponent(dateSold) + "&soldPrice=" + encodeURIComponent(soldPrice);
            xhr.send(data);
        }
    </script>
</head>
<body>

    <form onsubmit="event.preventDefault(); markSold();">
        <div>
            <h3>Mark Sold</h3>
        </div>
        <p>Mark vehicles as sold</p>
        <label for="id">Vehicle ID: </label>
        <input type="number" id="id" name="id" required>
        <label for="dateSold">Date Sold: </label>
        <input type="date" id="dateSold" name="dateSold" required>
        <label for="soldPrice">Sale Price: </label>
        <input type="number" id="soldPrice" name="soldPrice" required>
        <input type="submit" value="Submit">
        <div class="form-divider"></div>
        <div id="error-message" class="error"></div>
</form>

</body>
</html>