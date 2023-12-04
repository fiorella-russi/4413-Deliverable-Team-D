<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ include file="nav.jsp"%>
<%@ include file="chat.jsp"%>

<% List<Map<String, Object>> myList = (List<Map<String, Object>>) request.getAttribute("myList"); 
List<Map<String, Object>> myList2 =  (List<Map<String, Object>>) request.getAttribute("myList2"); 
double average = (double) request.getAttribute("average"); 



     Locale usa = new Locale("en", "US");
     
     Currency dollars = Currency.getInstance(usa);
    
     NumberFormat dollarFormat = NumberFormat.getCurrencyInstance(usa);
     NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);


      
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Details</title>
<link rel="stylesheet" type="text/css" href="styles/productDetails.css">
<script>
	var addOnCost = 0;
	function calculateTotal(){
		addOnCost = 0;
		var color = document.getElementById("colorSelect").value;
		var warranty = document.getElementById("warrantySelect").value;
		var wheels = document.getElementById("wheelsSelect").value;
		
		if(color === "Red"){
			addOnCost += 1000;
		}
		if(color === "Blue"){
			addOnCost += 1200;
		}
		if(warranty === "1 year"){
			addOnCost += 3000;
		}
		if(warranty === "2 years"){
			addOnCost += 5000;
		}
		if(wheels === "19"){
			addOnCost += 1500;
		}
		if(wheels === "20"){
			addOnCost += 2000;
		}
		
		var container = document.getElementById("addOnTotal");
        container.innerHTML = "Add on cost: $" +addOnCost;
	}
	
	function validateForm() {
        // Perform any additional form validation if needed

        // Manually escape the comment before submitting the form
        var commentTextArea = document.getElementById("commentTextArea");
        commentTextArea.value = escapeHtml(commentTextArea.value);

        // Return true to allow form submission
        return true;
    }

    function escapeHtml(input) {
        if (input == null) {
            return null;
        }
        return input.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
    }

</script>
</head>
<body>


	<ul id="itemContainer">
		<%
          
            for (Map<String, Object> item : myList) {
               
                String color = (String) item.get("color");
                String make = (String) item.get("make");
                String model = (String) item.get("model");
                int price = (int) item.get("price");
                String accident = (String) item.get("accident");
                int odometer  =(int) item.get("odometer");
                String condition = (String) item.get("vehicleCondition");
                int year = (int) item.get("year");
                
                
                
        %>
        <%! 
    public String escapeHtml(String input) {
        if (input == null) {
            return null;
        }
        return input.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
    }
%>
        

		<div class="item-content">

			<img src="<%= item.get("image1") %>" alt="Item Image"
				class="product-image"> <br><%="Color: "+ color %><br>
			<%="Make: "+ make %><br>
			<%= "Model: "+model %><br>
			<%="Accident Status: "+accident %><br>
			<% if(accident.equals("Yes")){ %>



			<a href="images/Carfax.jpg">(Accident) CarFax: pdf</a><br>
			<%} %>

			<%="Year: "+year %><br>
			<%="Odometer: "+numberFormat.format(odometer) +" km"%><br>
			<%="Conditon: "+condition %><br>


			<% if((int)myList.get(0).get("onSale") == 0){ %>
			<%= "Price: "+dollarFormat.format(price) %><br>
			<%}
			if((int)myList.get(0).get("onSale") == 1){
			%>
			<%= "Price: "+dollarFormat.format(price) %><br>
			<%= "Sale Price: "+dollarFormat.format((int) myList.get(0).get("salePrice")) %>
			<%} %>
		</div>

		<form action="ShoppingCart" method="post">
			<input type="hidden" name="id" value="<%= item.get("id") %>">
			<%if((int)myList.get(0).get("onSale") == 0){%>
			<input type="hidden" name="price" value="<%= item.get("price") %>">
			<%} if((int)myList.get(0).get("onSale") == 1){ %>

			<input type="hidden" name="price"
				value="<%= myList.get(0).get("salePrice") %>">
			<%} %>


			<input type="hidden" name="make" value="<%= make %>"> <input
				type="hidden" name="model" value="<%= model %>"> <label
				for="color">Select Color:</label> <select name="color"
				id="colorSelect" onchange="calculateTotal()">
				<option value="Default (<%= item.get("color") %>)">Default
					(<%= item.get("color") %>)
				</option>
				<option value="Red">Red - $1000</option>
				<option value="Blue">Blue - $1200</option>
				<!-- Add more color options as needed -->
			</select> <label for="warranty">Select warranty:</label> <select
				name="warranty" id="warrantySelect" onchange="calculateTotal()">
				<option value="Default - No Warranty">Default - No Warranty</option>
				<option value="1 year">1 year - $3000</option>
				<option value="2 years">2 year - $5000</option>
				<!-- Add more color options as needed -->
			</select> <label for="wheels">Select wheel size:</label> <select name="wheels"
				id="wheelsSelect" onchange="calculateTotal()">
				<option value="Default - 18">Default - 18</option>
				<option value="19">19 - $1500</option>
				<option value="20">20 - $2000</option>

			</select>


			<h3 id="addOnTotal">Add on cost: $0</h3>
			<input type="submit" value="Add to Cart">
		</form>


		<form action="reviewServlet" method="post" onsubmit="return validateForm()">
			<input type="hidden" name="productId" value="<%= item.get("id") %>">
			<input type="hidden" name="make" value="<%= make %>"> <input
				type="hidden" name="model" value="<%= model %>"> <label
				for="rating">Rating:</label> <select name="rating">
				<option value="1">1 Star</option>
				<option value="2">2 Stars</option>
				<option value="3">3 Stars</option>
				<option value="4">4 Stars</option>
				<option value="5">5 Stars</option>
			</select> <label for="comment">Comment:</label>
    <textarea name="comment" rows="4" cols="50" id="commentTextArea"></textarea>

			<input type="submit" value="Submit Review">
		</form>



		<%
            }
        %>



		<div id="reviews">
			<h2>Latest Reviews</h2>


			<%if(Double.isNaN(average)){ %>
			<h3>Average Rating: No Reviews Yet</h3>

			<%}else{ %>
			<ul>

				<h3>
					Average Rating:
					<%= average %></h3>
				<%
      

 
        for (Map<String, Object> review : myList2) {
 
            int rating = (int) review.get("rating");
            String comment = (String) review.get("comment");
        %>


				<li>

					<p>
						Rating:
						<%= rating %>
						stars
					</p>
					<p>
						Comment:
						<%= escapeHtml(comment) %></p>
				</li>
				<%
        }
        %>
			</ul>

			<%} %>
		</div>




	</ul>





</body>
</html>