document.addEventListener('DOMContentLoaded', function() {
	document.getElementById('cartForm').addEventListener('submit',
		function(event) {
			event.preventDefault();
			var term = parseInt(document.getElementById('term').value);
			var price = parseFloat(document.getElementById('price').value);
		
			var tax = parseFloat(document.getElementById('tax').value);
			var down = parseFloat(document.getElementById('down').value);
			var error =document.getElementById("error");
			var errorMessage="";
			
			if (term <= 0||document.getElementById('term').value==="" ) {
				var error =document.getElementById("error");
				errorMessage+= "The term should be greater than zero. ";
			
				
			}

			if (price <= 0||document.getElementById('price').value==="" ) {
				errorMessage += "The price of the vehicle should be greater than zero. ";
				
				
			}
			
			if (down <= 0||document.getElementById('down').value===""||down>=price) {
				errorMessage += "The down payment should be greater than zero and less than cost of vehicle. ";
				
			}


			if (tax <= 0||document.getElementById('tax').value==="") {
				errorMessage += "The interest rate should be greater than zero."
			
			
			}
			if((term > 0) & (price >0) & (tax >0)&(down >0)&(down<price)){
			
			document.getElementById('cartForm').submit();
			}
			else{
			
			errorMessage= '<p style="color: red;">'+errorMessage+'</p>';
			error.innerHTML=errorMessage;
			return;
			}
			
			
		});
});