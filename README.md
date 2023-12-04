# 4413 - Deliverable 3 
**ECARMERCE Final Code - Team D**

Contributors: Fiorella Russi, Aryan Iranpour Mobarakeh, Samir Gandhi, Gouled Mahamud 

This branch contains our final code for Deliverable 3. Please let us know if there are any issues.

Deployed Website: https://eecs4413project.sgcook.net

## Instructions For Running Our Code 

The following instructions detail how to run our system locally. In order for these steps to work, you must have Eclipse Java EE, Java v20, Apache Tomcat (v10) and JDBC installed. You must also configure your Eclipse with Tomcat and create a web server. 

Please follow the following steps to ensure the code runs seamlessly. 

1. Download the WAR file and import it to Eclipse as a WAR file. Ensure that all the web library jars are selected and imported as well. 

2. Open MySQL and run the script provided.
 
3. In our project open srs-> main-> java-> DB -> database.java and change the database credentials to match your own. Please note they are currently set to connect with our deployed database. The specific lines that need to be changed are: line 21, line 44, line 65. 

4. Right-click the project -> Run as and run it on the Tomcat server.

## Instructions For Running Our Test Cases

Instructions on how to run each test case can be found inside our Deliverable Document in Section 8, Pages 22-31.
Here is a copy of our instructions for our Postman Test cases: 

**20) ValidLogin Test Case** - Logs a user in successfully using the parameters provided on Postman. Success message displayed on Postman.

**21) Invalid Login Test Case** - Invalid user login with incorrect credentials. Error message displayed on Postman.

**22) ValidAdminLogin Test Case** - Logs in an admin user using the parameters provided on Postman. Success message displayed on Postman.

**23) Invalid Sign-Up Test Case** - Invalid Signup when an existing user tries to sign up. Failure message displayed on Postman.

**24) Valid Sign-Up Test Case** - Valid Signup when an existing user tries to sign up. Success message displayed on Postman.

**25) Valid Loan Calc** - Valid loan calculation when user enters the correct input. Calculation displayed on Postman.

**26) Invalid Loan Calc** - Invalid loan calculation when user inputs an invalid integer as the vehicle price. Error message displayed on Postman.

**27) Valid Log out** - You must make a request to the valid log in test case before making this request. User logs out successfully and a success message is displayed on postman.

**28) UpdateVehicleReports Test case(Distinguished use case)** - You must make a request to the valid admin login test case before sending a request to this test case. Admin can update the vehicle as sold manually through the admin Update Vehicle Reports page. Success message displayed.

**29) InvalidUpdateVehicle Test case(Distinguished use case)** - You must make a request to the valid admin login test case before sending a
request to this test case. Admin is unable to update the vehicle as sold manually through the admin Update Vehicle Reports page as the vehicle id does not exist. Error message displayed.

**30) InvalidUpdateVehicleExists Test case(Distinguished use case)**- You must make a request to the valid admin login test case before sending a request to this test case. Admin is unable to update the vehicle as sold manually through the admin Update Vehicle Reports page as the vehicle is already sold. Error message displayed.

**31) UserReportsDisplayPage Test case**- You must make a request to the valid admin login test case before sending a
request to this test case. Admin can check the user reports page which displays
a table indicating number of logins each user has completed. Success message
displayed.

**32) ApplicationReportServlet Test case** - You must make a request to the valid admin login test case before sending a
request to this test case. Admin can check the application reports page which displays a table indicating the vehicle that has been sold alongside the information of that vehicle. Success message displayed.

**33) AddToCart Test case** - You must make a request to the valid login test case before sending a request to this test case. Users can add items to the shopping cart. Success message displayed once added to cart.

**34) RemoveCart Test case** - You must make a request to AddToCart test case before sending a request to this test case. Users can remove items from their shopping cart. Success message displayed once added to cart.

**35) DisplayAllCars** - Users can see all the vehicles displayed on the screen when they click on the Cars on sale page. Success message displayed.

**36) DisplayHotDeals** - Users can see all the hot deals displayed on the screen when they click on the
Cars on sale page. Success message displayed.
