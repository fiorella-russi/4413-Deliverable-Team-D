<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ include file="chat.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="chat.jsp" %>
<% List<Map<String, Object>> myList = (List<Map<String, Object>>) request.getAttribute("myList"); 
session.setAttribute("myList", myList);
Locale usa = new Locale("en", "US");

Currency dollars = Currency.getInstance(usa);

NumberFormat dollarFormat = NumberFormat.getCurrencyInstance(usa);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/products.css">
<title>Products Page</title>
</head>
<body>
	

	<div class="container">
		<label for="colorFilter">Filter by Color:</label> <select
			id="colorFilter" onchange="filterItems()">
			<option value="all">All</option>
			<option value="Red">Red</option>
			<option value="Blue">Blue</option>

		</select> <label for="makeFilter">Filter by Make:</label> <select
			id="makeFilter" onchange="filterItems()">
			<option value="all">All</option>
			<option value="Tesla">Tesla</option>
			<option value="Audi">Audi</option>
			<option value="BMW">BMW</option>

		</select> <label for="typeFilter">Filter by Type:</label> <select
			id="typeFilter" onchange="filterItems()">
			<option value="all">All</option>
			<option value="Sedan">Sedan</option>
			<option value="SUV">SUV</option>

		</select> <label for="priceFilter">Filter by Price Range:</label> <select
			id="priceFilter" onchange="filterItems()">
			<option value="all">All</option>
			<option value="lt50000">Less than 50,000</option>
			<option value="50k100k">50,000 - 100,000</option>
			<option value="gt100k">100,000 and more</option>
		</select> <label for="accidentFilter">Filter by Accident:</label> <select
			id="accidentFilter" onchange="filterItems()">
			<option value="N/A">N/A</option>
			<option value="No">No Accidents</option>


		</select> <label for="sortSelect">Sort by:</label> <select id="sortSelect"
			onchange="sortItems()">
			<option value="default">Default</option>
			<option value="priceLH">Price Low to High</option>
			<option value="priceHL">Price High to Low</option>
			<option value="kmLH">KM Low to High</option>
			<option value="kmHL">KM High to Low</option>
			<option value="make">Make</option>

		</select>
	</div>
 <button onclick="compareProducts()" class="compare-button">Compare Selected</button>
	<div id="itemContainer">
	
		<%

    for (Map<String, Object> item : myList) {
    
        String color = (String) item.get("color");
        String make = (String) item.get("make");
        String model = (String) item.get("model");
        int price = (int) item.get("price");
        int km = (int) item.get("odometer");
        String accident = (String) item.get("accident");
		String type = (String) item.get("type");

      
    
 
    %>

<div class="item card" data-color="<%= color %>" data-make="<%= make %>" data-model="<%= model %>" data-price="<%= price %>" data-km="<%= km %>" data-accident="<%= accident %>" data-type="<%= type %>">
    <a href="productDetails?param1=<%= item.get("id") %>">
        <img src="<%= item.get("image1") %>" alt="Item Image">
    </a>
    <div class="item-details">
        <h3><%= make %> <%= model %></h3>
        <p>Color: <%= color %></p>
        <p>Type: <%= type %></p>
        <p class="price"><%= dollarFormat.format(price) %></p>
        <p>KM: <%= km %></p>
        <p>Accident History: <%= accident %></p>
        <div class="compare-checkbox">
            <label>
                <input type="checkbox" name="compareVehicle" value="<%= item.get("id") %>"> Add to comparison
            </label>
        </div>
    </div>
</div>


		</div>
		<%
    }
    %>
   
	</div>

	<script>
	function filterItems() {
	    var colorFilter = document.getElementById("colorFilter").value;
	    var makeFilter = document.getElementById("makeFilter").value;
	    var typeFilter = document.getElementById("typeFilter").value;
	    var priceFilter = document.getElementById("priceFilter").value;
	    var accidentFilter = document.getElementById("accidentFilter").value;

	    var items = document.getElementsByClassName("item");

	    for (var i = 0; i < items.length; i++) {
	        var item = items[i];
	        var color = item.getAttribute("data-color");
	        var make = item.getAttribute("data-make");
	        var price = parseInt(item.getAttribute("data-price"), 10);
	        var accident = item.getAttribute("data-accident");
	        var type = item.getAttribute("data-type");

	        var match = true;

	        if (colorFilter !== "all" && color !== colorFilter) {
	            match = false;
	        }

	        if (makeFilter !== "all" && make !== makeFilter) {
	            match = false;
	        }

	        if (typeFilter !== "all" && type !== typeFilter) {
	            match = false;
	        }

	        if (accidentFilter !== "N/A" && accident !== accidentFilter) {
	            match = false;
	        }

	        if (priceFilter === "lt50000" && price >= 50000) {
	            match = false;
	        } else if (priceFilter === "50k100k" && (price < 50000 || price >= 100000)) {
	            match = false;
	        } else if (priceFilter === "gt100k" && price < 100000) {
	            match = false;
	        }

	        item.style.display = match ? "flex" : "none";
	    }
	    var container = document.getElementById("itemContainer");
	    if (container) {
	        container.style.display = "flex";
	        container.style.flexWrap = "wrap";
	        container.style.justifyContent = "flex-start"; 
	    }
	}

    function sortItems() {
        var sortField = document.getElementById("sortSelect").value;
        var myList = document.getElementsByClassName("item");

        if (sortField === "default") {

        } else {
            var sortedItems = Array.from(myList).sort(function (a, b) {
                if (sortField === "priceLH") {
                    return parseInt(a.getAttribute("data-price")) - parseInt(b.getAttribute("data-price"));
                } else if (sortField === "priceHL") {
                    return parseInt(b.getAttribute("data-price")) - parseInt(a.getAttribute("data-price"));
                } else if (sortField === "kmHL") {
                    return parseInt(b.getAttribute("data-km")) - parseInt(a.getAttribute("data-km"));
                } else if (sortField === "kmLH") {
                    return parseInt(a.getAttribute("data-km")) - parseInt(b.getAttribute("data-km"));
                } else if (sortField === "make") {
                    var makeA = a.getAttribute("data-make");
                    var makeB = b.getAttribute("data-make");
                    if (makeA === "n/a") return 1;
                    if (makeB === "n/a") return -1;
                    return makeA.localeCompare(makeB);
                } else {

                    return 0;
                }
            });

            var container = document.getElementById("itemContainer");
            container.innerHTML = "";
            sortedItems.forEach(function (item) {
                container.appendChild(item);
            });
        }
    }

    function compareProducts() {
        var selectedProducts = collectSelectedProducts();

        if (selectedProducts.length < 2) {
            alert("Please select at least two products for comparison.");
            return false; 
        } else {
            var selectedProductsString = selectedProducts.join(",");
            window.location.href = "compare.jsp?selectedProducts=" + selectedProductsString;
            return false;
        }
    }

    function collectSelectedProducts() {
        var selectedProducts = [];
        var checkboxes = document.querySelectorAll('input[name="compareVehicle"]:checked');

        checkboxes.forEach(function (checkbox) {
            selectedProducts.push(checkbox.value);
        });

        return selectedProducts;
    }
</script>
</body>
</html>
