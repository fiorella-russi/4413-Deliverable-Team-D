<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="nav.jsp" %>
<%@ include file="chat.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Compare Vehicles</title>
    <link rel="stylesheet" type="text/css" href="styles/compare.css">
</head>
<body>

 
    <div class="container">
        <h1>Compare Vehicles</h1>
        <%
        String selectedProductsParam = request.getParameter("selectedProducts");
       

        if (selectedProductsParam != null && !selectedProductsParam.isEmpty()) {
            String[] selectedProductIds = selectedProductsParam.split(",");
            List<Map<String, Object>> comparedVehicles = new ArrayList<>();

            List<Map<String, Object>> myList = (List<Map<String, Object>>) session.getAttribute("myList");

            
            for (String feature : myList.get(0).keySet()) {
            	if (!feature.equals("image1")&& !feature.equals("salePrice") && !feature.equals("onSale") && !feature.equals("soldStatus") && !feature.equals("id")&&!feature.equals("vehicleHistoryReport")&&!feature.equals("DateSold")&&!feature.equals("soldPrice")) {
                out.println("<table>");
                out.println("<tr><th>Feature</th>");
                for (String productId : selectedProductIds) {
                    for (Map<String, Object> vehicle : myList) {
                        if (productId.equals(String.valueOf(vehicle.get("id"))) && vehicle.containsKey(feature)) {
                            comparedVehicles.add(vehicle);
                            out.println("<th>" + vehicle.get("make") +" "+ vehicle.get("model") + "</th>");
                            break;
                        }
                    }
                }
                out.println("</tr>");
                out.println("<tr><td>" + feature + "</td>");
                for (String productId : selectedProductIds) {
                    for (Map<String, Object> vehicle : myList) {
                        if (productId.equals(String.valueOf(vehicle.get("id")))&& !feature.equals("image1")&& !feature.equals("id")&&!feature.equals("vehicleHistoryReport")&&!feature.equals("DateSold")&&!feature.equals("soldPrice")) {
                            out.println("<td>" + vehicle.get(feature) + "</td>");
                            break;
                        }
                    }
                }
                out.println("</tr>");
                out.println("</table>");
            }

            request.setAttribute("comparedVehicles", comparedVehicles);
            }
        } else {
        %>
            <p>No vehicles selected for comparison.</p>
        <%
        }
        %>
    </div>
</body>
</html>
