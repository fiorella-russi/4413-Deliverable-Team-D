/**
 * Function that ensures all the credit card information input is valid
 */
function validateAndPay() {
	console.log("CALLED")
	var errorMessage = "";
	var ok = true;
	var cname = document.querySelector('#cname').value;
	var ccnum = document.querySelector('#ccnum').value;
	var expmonth = document.getElementById("expmonth").value;
	var expyear = document.getElementById("expyear").value;
	var cvv = document.getElementById("cvv").value;

	errorMessageID.innerHTML = "";//empty the error paragraph
	//validations
	if (typeof cname !== "string" || cname.trim() === "") {
		ok = false;
		errorMessage += "Full name on card must be entered. ";
	}
	if (ccnum <= 0 || ccnum.length !== 16 || isNaN(ccnum)) {
		ok = false;
		errorMessage += "Credit card number must be a valid 16-digit number. ";
	}
	if (expmonth < 1 || expmonth > 12 || isNaN(expmonth)) {
		ok = false;
		errorMessage += "The expiry month must be between 1 and 12. ";
	}
	if (expyear < 2023 || isNaN(expyear)) {
		ok = false;
		errorMessage += "The expiry year must be greater than 2022. ";
	}
	if (cvv <= 0 || cvv.length !== 3 || isNaN(cvv)) {
		ok = false;
		errorMessage += "CVV must be a 3-digit number. ";
	}

	// the input entered is all valid 
	if (ok) {
		errorMessageID.innerHTML = "";//empty the error paragraph
		checkout(); //proceeds to checkout
	}
	else {
		var myPara1 = document.createElement('p');
		myPara1.textContent = errorMessage;
		errorMessageID.appendChild(myPara1);
		errorMessageID.style.color = "red";
		errorMessageID.style.fontWeight = "bold";

	}
	return ok;
}

/**
 * Function that assuming all the input is correct passes the request to the servlet. 
 */
function checkout() {
	console.log("Checkout called")
	 var cname = document.getElementById("cname").value;
	 var ccnum = document.getElementById("ccnum").value;
	 
	var xhr = new XMLHttpRequest();

    xhr.open("POST", "CheckoutServlet", true);

    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                console.log(response);
                if (response.success) {
    			
                    window.location.href = "SuccessPayment.html"; 
                } else {
                    document.getElementById("errorMessageID").innerHTML = response.message;
                }
            }
        }
    };
    var data =  "cname=" + encodeURIComponent(cname) + "&ccnum=" + encodeURIComponent(ccnum);
    xhr.send(data);
	
	
}